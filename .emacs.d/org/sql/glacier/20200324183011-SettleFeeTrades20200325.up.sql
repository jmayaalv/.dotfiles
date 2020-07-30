create temp table tmp_pending_trades on commit drop as 
select distinct tr.tradeid
  from trd_trade tr, trd_trade_Detail td, trd_transaction tx
 where tr.tradeid = td.tradeid and td.transactionid = tx.transactionid 
   and not exists (select 1 from trd_settlement s where s.transactionid = tx.transactionid)
   and tr.status = ':pending'; 

create temp table tmp_settle_fee_trades on commit drop as 
select distinct tr.tradeid,
	max(s.settled_on) settled_on,
	max(s.currency) currency,
	sum(s.units)  settlement_units,
	sum(s.amount) settlement_amount
from trd_trade tr, trd_trade_detail td, trd_settlement s where tr.status = ':pending'
    and tr.tradeid = td.tradeid
    and tr.status =':pending'
    and s.transactionid = td.transactionid
    and tr.tradeid not in (select pt.tradeid from tmp_pending_trades pt)
    group by tr.tradeid;


update trd_trade tr set status = ':settle' from tmp_settle_fee_trades tmp where tmp.tradeid = tr.tradeid;

insert into trd_trade_settlement (settlementid, tradeid, source, settlement_date, nav, units, amount, currency, creation_date, feed_date)
select nextval('seq_trd_trade_settlement'), tmp.tradeid, ':bloomberg', tmp.settled_on, case when tmp.settlement_units =0 then 0 else tmp.settlement_amount/tmp.settlement_units end,tmp.settlement_units, tmp.settlement_amount, tmp.currency, now(),now()
  from tmp_settle_fee_trades tmp
  where not exists (select 1 from trd_trade_settlement s where s.tradeid = tmp.tradeid);

