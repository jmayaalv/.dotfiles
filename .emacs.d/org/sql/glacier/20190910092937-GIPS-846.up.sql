insert into trd_trade_account values  (nextval('seq_trd_trade_account'), 'allfunds', 9, ':all-funds', '{"distributor-code": "12183", "sub-distributor-code": "99999"}');
update trd_fund set trader = ':all-funds' where trader = ':trinkaus';
update trd_trade_batch set code = replace(code, '7980257635', 'allfunds'), tradeaccountid = (select tradeaccountid from trd_trade_account where trader = ':all-funds') where tradeaccountid = 3 and status = ':pending';
