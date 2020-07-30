-- change the IRR display status to hide (2)
update ims_omb_acct set irr_statusid = 2 where acctid in (select acctid from view_cont where acctnum = '1002013231');
