--Adding 1802144N,1802145N funds in navi category :

-- :! 1
insert into ims_acct_type_feecat_fund (id, feecatid, fundid) select nextval('seq_ims_acct_type_feecat_fund'), fc.feecatid, f.fundid
from ims_acct_type_feecat fc, ims_fund f where fc.code = 'NAVI'
and f.setid = (select setid from ims_fundset where name = 'Glacier Intl Funds') and f.code = '1802144N';

-- :! 1
insert into ims_acct_type_feecat_fund (id, feecatid, fundid) select nextval('seq_ims_acct_type_feecat_fund'), fc.feecatid, f.fundid
from ims_acct_type_feecat fc, ims_fund f where fc.code = 'NAVI'
and f.setid = (select setid from ims_fundset where name = 'Glacier Intl Funds') and f.code = '1802145N';

-- :! 2
insert into trd_fee_category_fund select 1, fundid  from trd_fund where code in ('1802144N', '1802145N');
