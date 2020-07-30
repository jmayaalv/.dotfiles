
--:!1
create temp table  tmp_fix_positions on commit drop as 
select vc.acctnum, vc.acctid, vc.contractid, cp.fundid, o.account_value, cp.units, cp.value, f.code, f.name, cp.conposid, fd.use_typeid, '2019-10-02'::date as feed_date
from ims_omb_acct o, ims_acct a, view_cont vc, ims_contract_pos cp, ims_fund f, ims_fund_details  fd
where fd.fundid = f.fundid and f.fundid = cp.fundid and vc.contractid =cp.contractid  and vc.acctid = a.acctid and o.account_value <> 0 and a.acctid = o.acctid and a.statusid = 7 
 and  vc.acctid in (17191) and cp.units<>0;

--:!1
 update ims_contract_pos cp set units = 0, value = 0 from tmp_fix_positions t where cp.conposid = t.conposid ;
--:!33
 update ims_contract_poshist cp set units = 0, value = 0 from tmp_fix_positions t where cp.fundid = t.fundid and cp.contractid = t.contractid  and cp.feed_date >= t.feed_date and not cp.archived;
--:!1
update ims_omb_acct h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid;
--:!33
update ims_omb_accthist h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid and h.feed_date >= t.feed_date;
--:!33
update ims_omb_contract h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid;
--:!1
update ims_omb_contracthist h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid and h.feed_date >= t.feed_date;

drop table tmp_fix_positions ;

create temp table  tmp_fix_positions on commit drop as 
select vc.acctnum, vc.acctid, vc.contractid, cp.fundid, o.account_value, cp.units, cp.value, f.code, f.name, cp.conposid, fd.use_typeid, '2019-10-16'::date as feed_date
from ims_omb_acct o, ims_acct a, view_cont vc, ims_contract_pos cp, ims_fund f, ims_fund_details  fd
where fd.fundid = f.fundid and f.fundid = cp.fundid and vc.contractid =cp.contractid  and vc.acctid = a.acctid and o.account_value <> 0 and a.acctid = o.acctid and a.statusid = 7 
 and  vc.acctid in (16756) and cp.units<>0;

--:!1
 update ims_contract_pos cp set units = 0, value = 0 from tmp_fix_positions t where cp.conposid = t.conposid ;
--:!19
 update ims_contract_poshist cp set units = 0, value = 0 from tmp_fix_positions t where cp.fundid = t.fundid and cp.contractid = t.contractid  and cp.feed_date >= t.feed_date and not cp.archived;
--:!1
update ims_omb_acct h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid;
--:!19
update ims_omb_accthist h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid and h.feed_date >= t.feed_date;
--:!19
update ims_omb_contract h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid;
--:!1
update ims_omb_contracthist h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid and h.feed_date >= t.feed_date;

drop table tmp_fix_positions ;

create temp table  tmp_fix_positions on commit drop as 
select vc.acctnum, vc.acctid, vc.contractid, cp.fundid, o.account_value, cp.units, cp.value, f.code, f.name, cp.conposid, fd.use_typeid, '2019-10-17'::date as feed_date
from ims_omb_acct o, ims_acct a, view_cont vc, ims_contract_pos cp, ims_fund f, ims_fund_details  fd
where fd.fundid = f.fundid and f.fundid = cp.fundid and vc.contractid =cp.contractid  and vc.acctid = a.acctid and o.account_value <> 0 and a.acctid = o.acctid and a.statusid = 7 
 and  vc.acctid in (16333) and cp.units<>0;

--:!2
 update ims_contract_pos cp set units = 0, value = 0 from tmp_fix_positions t where cp.conposid = t.conposid ;
--:!36
 update ims_contract_poshist cp set units = 0, value = 0 from tmp_fix_positions t where cp.fundid = t.fundid and cp.contractid = t.contractid  and cp.feed_date >= t.feed_date and not cp.archived;
--:!1
update ims_omb_acct h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid;
--:!18
update ims_omb_accthist h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid and h.feed_date >= t.feed_date;
--:!1
update ims_omb_contract h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid;
--:!18
update ims_omb_contracthist h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid and h.feed_date >= t.feed_date;

--:!4
update ims_contract_txn txn set visibility =99 from tmp_fix_positions t, ims_contract_txntrade td, inv_account_entry ae where t.contractid = txn.contractid and txn.txnid  = td.txnid and td.tradeid::varchar = ae.reference4 and ae.reference1 = t.acctnum
	and not exists (select 1 from inv_invoice_entry ie where ie.entryid = ae.entryid and ie.paidby_receiptid is not null);

--:!1
update  trd_contract_position ps set units = 0 from trd_contract c, trd_account a,tmp_fix_positions t, trd_fund f  where a.code =t.acctnum and a.accountid = c.accountid and c.contractid = ps.contractid and f.code = t.code and ps.fundid = f.fundid;
--:!1
insert into  trd_contract_position_history ( poshistid, contractid, fundid, modelid,      units, currency,  unit_price,    date,      creation_date)
	select nextval('seq_trd_contract_position_history'), ps.contractid, ps.fundid, ps.modelid, ps.units, ps.currency, ps.unit_price, t.feed_date, now() from trd_contract_position ps,trd_contract c, trd_account a,tmp_fix_positions t, trd_fund f  where a.code =t.acctnum and a.accountid = c.accountid and c.contractid = ps.contractid and f.code = t.code and ps.fundid = f.fundid;

drop table tmp_fix_positions ;

create temp table  tmp_fix_positions on commit drop as 
select vc.acctnum, vc.acctid, vc.contractid, cp.fundid, o.account_value, cp.units, cp.value, f.code, f.name, cp.conposid, fd.use_typeid, '2019-10-10'::date as feed_date
from ims_omb_acct o, ims_acct a, view_cont vc, ims_contract_pos cp, ims_fund f, ims_fund_details  fd
where fd.fundid = f.fundid and f.fundid = cp.fundid and vc.contractid =cp.contractid  and vc.acctid = a.acctid and o.account_value <> 0 and a.acctid = o.acctid and a.statusid = 7 
 and  vc.acctid in (18615) and cp.units<>0;

--:!1
 update ims_contract_pos cp set units = 0, value = 0 from tmp_fix_positions t where cp.conposid = t.conposid ;
--:!25
 update ims_contract_poshist cp set units = 0, value = 0 from tmp_fix_positions t where cp.fundid = t.fundid and cp.contractid = t.contractid  and cp.feed_date >= t.feed_date and not cp.archived;
--:!1
update ims_omb_acct h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid;
--:!25
update ims_omb_accthist h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid and h.feed_date >= t.feed_date;
--:!1
update ims_omb_contract h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid;
--:!25
update ims_omb_contracthist h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid and h.feed_date >= t.feed_date;

--:!1
update  trd_contract_position ps set units = 0 from trd_contract c, trd_account a,tmp_fix_positions t, trd_fund f  where a.code =t.acctnum and a.accountid = c.accountid and c.contractid = ps.contractid and f.code = t.code and ps.fundid = f.fundid;
--:!15
update  trd_contract_position_history ps set units = 0 from  trd_contract c, trd_account a,tmp_fix_positions t, trd_fund f  where a.code =t.acctnum and a.accountid = c.accountid and c.contractid = ps.contractid and f.code = t.code and ps.fundid = f.fundid and ps.date >= t.feed_date;

drop table tmp_fix_positions ;


create temp table  tmp_fix_positions on commit drop as 
select vc.acctnum, vc.acctid, vc.contractid, cp.fundid, o.account_value, cp.units, cp.value, f.code, f.name, cp.conposid, fd.use_typeid, '2019-10-05'::date as feed_date
from ims_omb_acct o, ims_acct a, view_cont vc, ims_contract_pos cp, ims_fund f, ims_fund_details  fd
where fd.fundid = f.fundid and f.fundid = cp.fundid and vc.contractid =cp.contractid  and vc.acctid = a.acctid and o.account_value <> 0 and a.acctid = o.acctid and a.statusid = 7 
 and  vc.acctid in (18902) and cp.units<>0;

--:!1
 update ims_contract_pos cp set units = 0, value = 0 from tmp_fix_positions t where cp.conposid = t.conposid ;
--:!25
 update ims_contract_poshist cp set units = 0, value = 0 from tmp_fix_positions t where cp.fundid = t.fundid and cp.contractid = t.contractid  and cp.feed_date >= t.feed_date and not cp.archived;
--:!1
update ims_omb_acct h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid;
--:!30
update ims_omb_accthist h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid and h.feed_date >= t.feed_date;
--:!1
update ims_omb_contract h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid;
--:!30
update ims_omb_contracthist h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid and h.feed_date >= t.feed_date;

--:!1
update  trd_contract_position ps set units = 0 from trd_contract c, trd_account a,tmp_fix_positions t, trd_fund f  where a.code =t.acctnum and a.accountid = c.accountid and c.contractid = ps.contractid and f.code = t.code and ps.fundid = f.fundid;
--:!19
update  trd_contract_position_history ps set units = 0 from  trd_contract c, trd_account a,tmp_fix_positions t, trd_fund f  where a.code =t.acctnum and a.accountid = c.accountid and c.contractid = ps.contractid and f.code = t.code and ps.fundid = f.fundid and ps.date >= t.feed_date;

drop table tmp_fix_positions ;




create temp table  tmp_fix_positions on commit drop as 
select vc.acctnum, vc.acctid, vc.contractid, cp.fundid, o.account_value, cp.units, cp.value, f.code, f.name, cp.conposid, fd.use_typeid, '2019-10-17'::date as feed_date
from ims_omb_acct o, ims_acct a, view_cont vc, ims_contract_pos cp, ims_fund f, ims_fund_details  fd
where fd.fundid = f.fundid and f.fundid = cp.fundid and vc.contractid =cp.contractid  and vc.acctid = a.acctid and o.account_value <> 0 and a.acctid = o.acctid and a.statusid = 7 
 and  vc.acctid in (19512) and cp.units<>0;

--:!1
 update ims_contract_pos cp set units = 0, value = 0 from tmp_fix_positions t where cp.conposid = t.conposid ;
--:!18
 update ims_contract_poshist cp set units = 0, value = 0 from tmp_fix_positions t where cp.fundid = t.fundid and cp.contractid = t.contractid  and cp.feed_date >= t.feed_date and not cp.archived;
--:!1
update ims_omb_acct h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid;
--:!18
update ims_omb_accthist h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid and h.feed_date >= t.feed_date;
--:!1
update ims_omb_contract h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid;
--:!18
update ims_omb_contracthist h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid and h.feed_date >= t.feed_date;

--:!1
update ims_contract_txn txn set visibility =99 from tmp_fix_positions t, ims_contract_txntrade td, inv_account_entry ae where t.contractid = txn.contractid and txn.txnid  = td.txnid and td.tradeid::varchar = ae.reference4 and ae.reference1 = t.acctnum
	and not exists (select 1 from inv_invoice_entry ie where ie.entryid = ae.entryid and ie.paidby_receiptid is not null);

--:!1
update  trd_contract_position ps set units = 0 from trd_contract c, trd_account a,tmp_fix_positions t, trd_fund f  where a.code =t.acctnum and a.accountid = c.accountid and c.contractid = ps.contractid and f.code = t.code and ps.fundid = f.fundid;
--:!1
insert into  trd_contract_position_history ( poshistid, contractid, fundid, modelid,      units, currency,  unit_price,    date,      creation_date)
	select nextval('seq_trd_contract_position_history'), ps.contractid, ps.fundid, ps.modelid, ps.units, ps.currency, ps.unit_price, t.feed_date, now() from trd_contract_position ps,trd_contract c, trd_account a,tmp_fix_positions t, trd_fund f  where a.code =t.acctnum and a.accountid = c.accountid and c.contractid = ps.contractid and f.code = t.code and ps.fundid = f.fundid;


drop table tmp_fix_positions ;


create temp table  tmp_fix_positions on commit drop as 
select vc.acctnum, vc.acctid, vc.contractid, cp.fundid, o.account_value, cp.units, cp.value, f.code, f.name, cp.conposid, fd.use_typeid, '2019-10-22'::date as feed_date
from ims_omb_acct o, ims_acct a, view_cont vc, ims_contract_pos cp, ims_fund f, ims_fund_details  fd
where fd.fundid = f.fundid and f.fundid = cp.fundid and vc.contractid =cp.contractid  and vc.acctid = a.acctid and o.account_value <> 0 and a.acctid = o.acctid and a.statusid = 7 
 and  vc.acctid in (17164) and cp.units<>0;

--:!1
 update ims_contract_pos cp set units = 0, value = 0 from tmp_fix_positions t where cp.conposid = t.conposid ;
--:!13
 update ims_contract_poshist cp set units = 0, value = 0 from tmp_fix_positions t where cp.fundid = t.fundid and cp.contractid = t.contractid  and cp.feed_date >= t.feed_date and not cp.archived;
--:!1
update ims_omb_acct h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid;
--:!13
update ims_omb_accthist h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid and h.feed_date >= t.feed_date;
--:!1
update ims_omb_contract h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid;
--:!13
update ims_omb_contracthist h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid and h.feed_date >= t.feed_date;

--:!2
update ims_contract_txn txn set visibility =99 from tmp_fix_positions t, ims_contract_txntrade td, inv_account_entry ae where t.contractid = txn.contractid and txn.txnid  = td.txnid and td.tradeid::varchar = ae.reference4 and ae.reference1 = t.acctnum
	and not exists (select 1 from inv_invoice_entry ie where ie.entryid = ae.entryid and ie.paidby_receiptid is not null);

--:!1
update  trd_contract_position ps set units = 0 from trd_contract c, trd_account a,tmp_fix_positions t, trd_fund f  where a.code =t.acctnum and a.accountid = c.accountid and c.contractid = ps.contractid and f.code = t.code and ps.fundid = f.fundid;
--:!1
insert into  trd_contract_position_history ( poshistid, contractid, fundid, modelid,      units, currency,  unit_price,    date,      creation_date)
	select nextval('seq_trd_contract_position_history'), ps.contractid, ps.fundid, ps.modelid, ps.units, ps.currency, ps.unit_price, t.feed_date, now() from trd_contract_position ps,trd_contract c, trd_account a,tmp_fix_positions t, trd_fund f  where a.code =t.acctnum and a.accountid = c.accountid and c.contractid = ps.contractid and f.code = t.code and ps.fundid = f.fundid;


drop table tmp_fix_positions ;


--:!1
create temp table  tmp_fix_positions on commit drop as 
select vc.acctnum, vc.acctid, vc.contractid, cp.fundid, o.account_value, cp.units, cp.value, f.code, f.name, cp.conposid, fd.use_typeid, '2019-10-31'::date as feed_date
from ims_omb_acct o, ims_acct a, view_cont vc, ims_contract_pos cp, ims_fund f, ims_fund_details  fd
where fd.fundid = f.fundid and f.fundid = cp.fundid and vc.contractid =cp.contractid  and vc.acctid = a.acctid and o.account_value <> 0 and a.acctid = o.acctid and a.statusid = 7 
 and  vc.acctid in (17847) and cp.units<>0;

--:!1
 update ims_contract_pos cp set units = 0, value = 0 from tmp_fix_positions t where cp.conposid = t.conposid ;
--:!4
 update ims_contract_poshist cp set units = 0, value = 0 from tmp_fix_positions t where cp.fundid = t.fundid and cp.contractid = t.contractid  and cp.feed_date >= t.feed_date and not cp.archived;
--:!1
update ims_omb_acct h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid;
--:!4
update ims_omb_accthist h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid and h.feed_date >= t.feed_date;
--:!4
update ims_omb_contract h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid;
--:!1
update ims_omb_contracthist h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid and h.feed_date >= t.feed_date;

drop table tmp_fix_positions ;

