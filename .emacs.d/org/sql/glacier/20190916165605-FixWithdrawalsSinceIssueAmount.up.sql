create temp table tmp_fix_GIPS650 on commit drop as 
	select vc.*, 66429.34 total_withdrawals from view_cont vc where vc.acctnum ='1000010650';

-- !: 1
update ims_omb_contract oc set  total_withdrawals = t.total_withdrawals from tmp_fix_GIPS650 t where t.contractid = oc.contractid;
-- !: 1
update ims_omb_acct oc set  total_withdrawals = t.total_withdrawals from tmp_fix_GIPS650 t where t.acctid = oc.acctid;
-- !: 243
update ims_omb_contracthist oc set  total_withdrawals = t.total_withdrawals from tmp_fix_GIPS650 t where t.contractid = oc.contractid and oc.feed_date >= '2019-01-16';
-- !: 243	
update ims_omb_accthist oc set  total_withdrawals = t.total_withdrawals from tmp_fix_GIPS650 t where t.acctid = oc.acctid and oc.feed_date >= '2019-01-16' ;	

