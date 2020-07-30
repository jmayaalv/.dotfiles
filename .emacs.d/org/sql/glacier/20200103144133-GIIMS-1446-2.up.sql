insert into ims_acct_type_feecat_fund (id, feecatid, fundid)  
select nextval('seq_ims_acct_type_feecat_fund'), fc.feecatid, f.fundid
    from ims_acct_type_feecat fc, ims_fund f
    where fc.code = 'NAVI'
        and f.setid = (select setid from ims_fundset where name = 'Glacier Intl Funds') and f.code = '1802101N';


insert into trd_fee_category_fund (feecategoryid,fundid)
    select tfc.feecategoryid, tf.fundid
    from trd_fee_category tfc, trd_fund tf where tfc.name='NAVI' and tf.code='1802101N';
