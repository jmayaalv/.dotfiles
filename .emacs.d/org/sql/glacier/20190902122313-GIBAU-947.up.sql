update ims_contract_pos set units = 0, value = 0 where contractid = 7293 and fundid=19406;
update ims_contract_poshist set units = 0, value = 0 where contractid = 7293 and fundid=19406 and feed_date = '2019-09-01';
update ims_omb_acct set account_value = account_value -189.9487090000, surrender_value = surrender_value  - 189.9487090000, death_benefit = death_benefit - 189.9487090000 where acctid=15364;
update ims_omb_accthist set account_value = account_value -189.9487090000, surrender_value = surrender_value - 189.9487090000, death_benefit = death_benefit - 189.9487090000 where acctid=15364 and feed_date = '2019-09-01';
update ims_omb_contract set contract_value = contract_value -189.9487090000, surrender_value = surrender_value - 189.9487090000, death_benefit = death_benefit - 189.9487090000 where contractid=7293;
update ims_omb_contracthist set contract_value = contract_value-189.9487090000, surrender_value = surrender_value - 189.9487090000, death_benefit = death_benefit - 189.9487090000 where contractid=7293 and feed_date = '2019-09-01';
