-- :! 5 
update trd_contract set details = '{"fees": {"liquidity-based-collection": true}}' where contractid in (select contractid from trd_account a, trd_contract c where a.accountid=c.accountid and a.code in ('1002032132', '1002032009', '1002031860', '1002031878', '1002030052'));
