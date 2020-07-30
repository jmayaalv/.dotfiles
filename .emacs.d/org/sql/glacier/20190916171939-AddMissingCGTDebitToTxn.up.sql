-- !: 1
update ims_contract_txn set amount = amount - 4147.76 where txnid = 3701621;
-- !: 1
update ims_contract_txntrade set units = units - 4147.76,  value = value - 4147.76 where txnid = 3701621;
