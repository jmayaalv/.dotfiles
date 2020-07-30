update ims_contract_pos set units = 0, value = 0 where contractid = 7495 and fundid=19406;
update ims_contract_poshist set units = 0, value = 0 where contractid = 7495 and fundid=19406 and feed_date = '2019-09-11';
update ims_omb_acct set account_value = account_value - 8.2887800000, surrender_value = surrender_value  - 8.2887800000, death_benefit = death_benefit - 8.2887800000 where acctid=15576;
update ims_omb_accthist set account_value = account_value -8.28878, surrender_value = surrender_value - 8.28878, death_benefit = death_benefit - 8.28878 where acctid=15576 and feed_date = '2019-09-11';
update ims_omb_contract set contract_value = contract_value -8.28878, surrender_value = surrender_value - 8.28878, death_benefit = death_benefit - 8.28878 where contractid=7495;
update ims_omb_contracthist set contract_value = contract_value-8.28878, surrender_value = surrender_value - 8.28878, death_benefit = death_benefit - 8.28878 where contractid=7495 and feed_date = '2019-09-11';
