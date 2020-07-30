--:!1
create temp table  tmp_fix_positions on commit drop as 
select vc.acctnum, vc.acctid, vc.contractid, cp.fundid, o.account_value, cp.units, cp.value, f.code, f.name, cp.conposid, fd.use_typeid, '2019-05-16'::date as feed_date, 0 as amount
from ims_omb_acct o, ims_acct a, view_cont vc, ims_contract_pos cp, ims_fund f, ims_fund_details  fd
where fd.fundid = f.fundid and f.fundid = cp.fundid and vc.contractid =cp.contractid  and vc.acctid = a.acctid and o.account_value <> 0 and a.acctid = o.acctid and a.statusid = 7 
 and  vc.acctid in (18123) and cp.units<>0;

--:!1
 update ims_contract_pos cp set units = t.amount , value =  t.amount from tmp_fix_positions t where cp.conposid = t.conposid ;
--:!221
 update ims_contract_poshist cp set units = t.amount , value =  t.amount from tmp_fix_positions t where cp.fundid = t.fundid and cp.contractid = t.contractid  and cp.feed_date >= t.feed_date and not cp.archived;
--:!1	
update ims_omb_acct h set account_value = t.amount from tmp_fix_positions t where t.acctid = h.acctid;
--:!221
update ims_omb_accthist h set account_value = t.amount from tmp_fix_positions t where t.acctid = h.acctid and h.feed_date >= t.feed_date;
--:!1
update ims_omb_contract h set contract_value =  t.amount from tmp_fix_positions t where t.contractid = h.contractid;
--:!221
update ims_omb_contracthist h set contract_value =  t.amount from tmp_fix_positions t where t.contractid = h.contractid and h.feed_date >= t.feed_date;

drop table tmp_fix_positions ;

