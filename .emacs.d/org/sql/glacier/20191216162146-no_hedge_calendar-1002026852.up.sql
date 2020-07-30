-- :! 1
delete from trd_settlement where transactionid in (3322085);

-- :! 1
delete from trd_transaction where transactionid in (3322085);

-- :! 1
delete from trd_contract_position where fundid=5959 and contractid=7072;

-- :! 1
delete from  trd_contract_position_history where fundid=5959 and contractid=7072;

-- :! 1
delete from ims_Contract_txntrade where txnid=7086735;

-- :! 1
delete from ims_Contract_txn where txnid=7086735;

-- :! 1
delete from ims_contract_pos where contractid=14465 and fundid=19422;

-- :! 3
delete from ims_contract_poshist where contractid=14465 and fundid=19422;

-- :! 1
update ims_omb_acct set account_value=account_value-9647.07, death_benefit=death_benefit-9647.0700000000, surrender_value=surrender_value-9647.0700000000 where acctid=22888;

-- :! 3
update ims_omb_accthist set account_value=account_value-9647.07, death_benefit=death_benefit-9647.0700000000, surrender_value=surrender_value-9647.0700000000 where acctid=22888;

-- :! 1
update ims_omb_contract set contract_value=contract_value-9647.07, death_benefit=death_benefit-9647.0700000000, surrender_value=surrender_value-9647.0700000000 where contractid=14465;

-- :! 3
update ims_omb_contracthist set contract_value=contract_value-9647.07, death_benefit=death_benefit-9647.0700000000, surrender_value=surrender_value-9647.0700000000 where contractid=14465;

-- :! 1
update trd_instruction set failed_on=null, failure_reason=null where failed_on is not null;
