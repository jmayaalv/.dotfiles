
-- :! 2
update trd_fund set valuation_days = 1 where isin in ('IE00B94Q3M90', 'IE00BFM0NK35');

-- :! 1
update trd_fund set valuation_days = 2 where isin = 'IE00B8KMNS03';

-- :! 1
update trd_fund set valuation_days = 3 where isin = 'IE00B8KMNS03';
