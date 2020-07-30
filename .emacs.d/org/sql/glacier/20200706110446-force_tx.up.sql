update trd_transaction set traded_on='2020-07-06', price_date='2020-07-06' where transactionid=4394431;
insert into trd_trade_batch (batchid, tradeaccountid, status, trade_date ,creation_date, code) values (nextval('seq_trd_trade_batch'), 38, ':completed', '2020-07-06', now(), 'mocked-20200706');
update trd_trade set tradeid=(select tradeid from trd_trade_batch where code='mocked-20200706'), price_date='2020-07-06' where tradeid=67786;
