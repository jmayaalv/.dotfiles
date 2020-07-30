-- :! 1
insert into trd_trade_batch values (nextval('seq_trd_trade_batch'), 38, ':completed', '2019-09-11', now(), 'dummy-20190911');

-- :! 4
insert into trd_trade select nextval('seq_trd_trade'), (select batchid from trd_trade_batch where code = 'dummy-20190911'), t.fundid || 'US09112019', ':pending', t.fundid,  ':sell', ':unit', null, null, t.price_date From trd_transaction t where common_id = 'CRSW010003' and not exists (select 1 from trd_settlement where t.transactionid = transactionid);

-- :! 4
insert into trd_trade_detail select nextval('seq_trd_trade_detail'), tradeid, transactionid, t.units, t.amount, t.currency  from trd_transaction t, trd_trade tt, trd_trade_batch b where tt.batchid = b.batchid and tt.fundid=t.fundid and b.code='dummy-20190911'  and common_id = 'CRSW010003' and not exists (select 1 from trd_settlement where t.transactionid = transactionid);
