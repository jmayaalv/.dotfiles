-- :! 1
update ims_fund_details set isin = 'XS2064946200' where fundid in (select fundid from ims_fund where code='1802102');

-- :! 1
update ims_fund_details set isin = 'XS2058783437' where fundid in (select fundid from ims_fund where code='1802103');

