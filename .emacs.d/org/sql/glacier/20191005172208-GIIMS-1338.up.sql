update trd_fee set preferred_funds='["1802058"]' where fee_type != ':modelmanager' and
status=':pending' and contractid in (select c.contractid from trd_account a, trd_contract c where a.accountid=c.accountid and a.code in ('1000021152', '1000021426', '1000029049', '1000031235', '1000031276', '1000041051', '1000041069', '1000041499', '1002007027', '1002009502', '1002010245', '1900312768'));

update trd_contract_fee set preferred_funds = '["1802058"]' where contract_code in (select c.code from trd_account a, trd_contract c where a.accountid=c.accountid and a.code in ('1000021152', '1000021426', '1000029049', '1000031235', '1000031276', '1000041051', '1000041069', '1000041499', '1002007027', '1002009502', '1002010245', '1900312768'));
