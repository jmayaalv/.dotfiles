update trd_instruction set completion_date = now()  where code='ac6d49b2-0357-4ab7-9961-02ec23a77267';

insert into trd_transaction (transactionid, contractid, instruction_code, ref, common_id, type, code, traded_on, fundid, amount, currency, feed_date, creation_date, price_date)
values (nextval('seq_trd_transaction'), 2183, 'ac6d49b2-0357-4ab7-9961-02ec23a77267', uuid_in(overlay(overlay(md5(random()::text || ':' || clock_timestamp()::text) placing '4' from 13) placing to_hex(floor(random()*(11-8+1) + 8)::int)::text from 17)::cstring), 'PRE057261', ':sell', ':T301', '2020-03-30', 5959, 300000, 'USD', now(), now(), '2020-03-30') ;

insert into trd_settlement (settlementid, transactionid, type, settled_on, applied,  units, amount, currency, feed_date, completed)
select nextval('seq_trd_settlement'), transactionid, ':trader', '2020-03-30 22:55', true, 300000, 300000, 'USD', now (), true
from trd_transaction
where contractid=2183
order by transactionid desc
limit 1;

insert into trd_instruction (instructionid, code, order_code, common_id, transaction_code, type, action, expected_date, contract_Code, fundid, amount, amount_currency, completion_date, sourcetransactionid, creation_date, dca, flow
)
select nextval('seq_trd_instruction'), uuid_in(overlay(overlay(md5(random()::text || ':' || clock_timestamp()::text) placing '4' from 13) placing to_hex(floor(random()*(11-8+1) + 8)::int)::text from 17)::cstring),
'PRE057261','PRE057261',':T302', ':new-account', ':buy-price-pending', '2020-03-30 22:55', 'I100008340', 4381, 300000, 'USD', '2020-03-30 22:55', transactionid, now (), false, ':buy-hedge'
from trd_transaction
where contractid=2183
order by transactionid desc
limit 1;


insert into trd_transaction (transactionid, contractid, instruction_code, ref, common_id, type, code, traded_on, fundid, amount, currency, feed_date, creation_date, price_date)
select nextval('seq_trd_transaction'), 2183, code, uuid_in(overlay(overlay(md5(random()::text || ':' || clock_timestamp()::text) placing '4' from 13) placing to_hex(floor(random()*(11-8+1) + 8)::int)::text from 17)::cstring),
'PRE057261', ':buy', ':T302', '2020-03-30', 5965, 300000, 'USD', now(),  now(), '2020-03-30'
from trd_instruction
where common_id='PRE057261'
order by instructionid
desc limit 1;

insert into trd_settlement (settlementid, transactionid, type, settled_on, applied,  units, amount, currency, feed_date, completed)
select nextval('seq_trd_settlement'), transactionid, ':trader', '2020-03-30 22:55', true, 300000, 300000, 'USD', now (), true
from trd_transaction
where contractid=2183
order by transactionid desc
limit 1;


insert into trd_instruction (instructionid, code, order_code, common_id, transaction_code, type, action, expected_date, contract_Code, fundid, amount, amount_currency, completion_date, sourcetransactionid, creation_date, dca, flow
)
select nextval('seq_trd_instruction'), uuid_in(overlay(overlay(md5(random()::text || ':' || clock_timestamp()::text) placing '4' from 13) placing to_hex(floor(random()*(11-8+1) + 8)::int)::text from 17)::cstring),
'PRE057261','PRE057261',':T302', ':new-account', ':buy-fund', '2020-03-30 22:55', 'I100008340', 4381, 300000, 'USD', '2020-03-30 22:55', transactionid, now (), false, ':buy-hedge'
from trd_transaction
where contractid=2183
order by transactionid desc
limit 1;

insert into trd_transaction (transactionid, contractid, instruction_code, ref, common_id, type, code, traded_on, fundid, amount, currency, feed_date, creation_date, price_date)
select nextval('seq_trd_transaction'), 2183, code, uuid_in(overlay(overlay(md5(random()::text || ':' || clock_timestamp()::text) placing '4' from 13) placing to_hex(floor(random()*(11-8+1) + 8)::int)::text from 17)::cstring),
'PRE057261', ':buy', ':T400', '2020-03-31', 4381, 300000, 'USD', now(),  now(), '2020-04-02'
from trd_instruction
where common_id='PRE057261'
order by instructionid
desc limit 1;

insert into trd_trade (tradeid, batchid, code, status, fundid, type, unit_type, currency, price_date, offer_price, reconcile)
values (nextval('seq_trd_trade'), 1571, 'GIIMS-1645', ':pending', 4381, ':buy', ':money', 'USD', '2020-04-02', false, false);

insert into trd_trade_detail (tradedetailid, tradeid, transactionid, amount, currency)
values (nextval('seq_trd_trade_detail'), (select tradeid from trd_trade order by 1 desc limit 1), (select transactionid from trd_transaction where common_id='PRE057261' order by 1 desc limit 1), 300000, 'USD');


update trd_contract_position set units = 0 where contractid=2183 and fundid=5959;
update trd_contract_position set units = 300000 where contractid=2183 and fundid=5965;
update trd_contract_position_history set units = 0 where poshistid=25942818;
update trd_contract_position_history set units = 300000 where poshistid=8873873;

