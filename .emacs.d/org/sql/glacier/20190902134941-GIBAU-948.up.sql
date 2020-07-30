update ims_contract_pos set units = 0, value = 0 where contractid = 10143 and fundid=19406;
update ims_contract_poshist set units = 0, value = 0 where contractid = 10143 and fundid=19406 and feed_date = '2019-09-01';
update ims_omb_acct set account_value = account_value - 2753.8934270000 , surrender_value = surrender_value  - 2753.8934270000, death_benefit = death_benefit - 2753.8934270000 where acctid=18266;
update ims_omb_accthist set account_value = account_value -2753.8934270000, surrender_value = surrender_value - 2753.8934270000, death_benefit = death_benefit - 2753.8934270000 where acctid=18266 and feed_date = '2019-09-01';
update ims_omb_contract set contract_value = contract_value -2753.8934270000, surrender_value = surrender_value - 2753.8934270000, death_benefit = death_benefit - 2753.8934270000 where contractid=10143;
update ims_omb_contracthist set contract_value = contract_value-2753.8934270000, surrender_value = surrender_value - 2753.8934270000, death_benefit = death_benefit - 2753.8934270000 where contractid=10143 and feed_date = '2019-09-01';
