-- :! 4
create temp table  tmp_fix_positions on commit drop as 
select vc.acctnum, vc.acctid, vc.contractid, cp.fundid, o.account_value, cp.units, cp.value, f.code, f.name, cp.conposid, fd.use_typeid
from ims_omb_acct o, ims_acct a, view_cont vc, ims_contract_pos cp, ims_fund f, ims_fund_details  fd
where fd.fundid = f.fundid and f.fundid = cp.fundid and vc.contractid =cp.contractid  and vc.acctid = a.acctid and o.account_value <> 0 and a.acctid = o.acctid and a.statusid = 7 
 and  vc.acctid in (17508);

-- :! 4
 update ims_contract_pos cp set units = 0, value = 0 from tmp_fix_positions t where cp.conposid = t.conposid ;
-- :! 31
update ims_contract_poshist cp set units = 0, value = 0 from tmp_fix_positions t where cp.fundid = t.fundid and cp.contractid = t.contractid  and feed_date >= '2019-09-03';

-- :! 1
update ims_omb_acct h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid;
-- :! 29
update ims_omb_accthist h set account_value = 0 from tmp_fix_positions t where t.acctid = h.acctid and feed_date >= '2019-09-03';
-- :! 1
update ims_omb_contract h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid;
-- :! 29
update ims_omb_contracthist h set contract_value = 0 from tmp_fix_positions t where t.contractid = h.contractid and feed_date >= '2019-09-03';

