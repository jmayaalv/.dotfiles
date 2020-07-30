--:!3
create temp table  tmp_fix_positions on commit drop as 
select vc.acctnum, vc.acctid, vc.contractid, cp.fundid, o.account_value, cp.units, cp.value, f.code, f.name, cp.conposid, fd.use_typeid, '2019-12-18'::date as feed_date, 0 as amount
from ims_omb_acct o, ims_acct a, view_cont vc, ims_contract_pos cp, ims_fund f, ims_fund_details  fd
where fd.fundid = f.fundid and f.fundid = cp.fundid and vc.contractid =cp.contractid  and vc.acctid = a.acctid and o.account_value <> 0 and a.acctid = o.acctid and a.statusid = 7 
 and  vc.acctid in (16886) and cp.units<>0;

--:!3
 update ims_contract_pos cp set units = t.amount , value =  t.amount from tmp_fix_positions t where cp.conposid = t.conposid ;
--:!24
 update ims_contract_poshist cp set units = t.amount , value =  t.amount from tmp_fix_positions t where cp.fundid = t.fundid and cp.contractid = t.contractid  and cp.feed_date >= t.feed_date and not cp.archived;
--:!1
update ims_omb_acct h set account_value = t.amount from tmp_fix_positions t where t.acctid = h.acctid;
--:!20
update ims_omb_accthist h set account_value = t.amount from tmp_fix_positions t where t.acctid = h.acctid and h.feed_date >= t.feed_date;
--:!1
update ims_omb_contract h set contract_value =  t.amount from tmp_fix_positions t where t.contractid = h.contractid;
--:!20
update ims_omb_contracthist h set contract_value =  t.amount from tmp_fix_positions t where t.contractid = h.contractid and h.feed_date >= t.feed_date;

--:!5
update ims_contract_txn set visibility = 99 where txnid in (7191960,7124927,7124926,7124925,7124924);

--:!4
delete from trd_surrogate_transaction where transactionid  in (81811,81810,81809,81808);	

--:!3
update trd_contract_position set units = 0 where positionid in (104470320,104470318,104470317);

--:!2
delete from trd_contract_position_history where poshistid in (22115414,22115413);

--:!1
insert into trd_contract_position_history ( poshistid ,contractid,fundid,modelid,units,currency ,unit_price  ,date    ,creation_date)
values (nextval('seq_trd_contract_position_history'), 2007, 4728,6967, 0.0, 'USD',1.0000000000,'2019-12-18',now());



drop table tmp_fix_positions ;

