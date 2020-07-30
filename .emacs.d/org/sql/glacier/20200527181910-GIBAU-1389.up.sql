update ims_fund_details set isin = 'GG00BMFF2189', ticker = 'FORDITC GU' where fundid in (select fundid from ims_fund where code='1034001');
update trd_fund set  isin = 'GG00BMFF2189' where code='1034001';

