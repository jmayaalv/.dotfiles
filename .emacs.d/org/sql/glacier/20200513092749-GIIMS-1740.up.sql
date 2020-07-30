update ims_fund_details set isin = null where fundid=18769; 
update trd_fund set type=':cash', trader=':internal', isin=null, liquidation_days=0, valuation_days=0, settlor=':internal' where code='3013031';

