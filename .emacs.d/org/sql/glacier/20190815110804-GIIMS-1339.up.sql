-- :! 1
update trd_contract set details = '{"fee-liquidity-based-collection": true}' where contractid in (select contractid from trd_account a, trd_contract c where a.accountid=c.accountid and a.code = '1002020574');
