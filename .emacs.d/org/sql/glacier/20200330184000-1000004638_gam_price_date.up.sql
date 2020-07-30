update trd_trade set price_date='2020-04-30' where tradeid=59189;
update trd_transaction set price_date = '2020-04-30' where transactionid in (select transactionid from trd_Trade_detail where tradeid=59189);
