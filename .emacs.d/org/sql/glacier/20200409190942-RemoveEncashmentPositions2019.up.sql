update ims_contract_pos set units = 0, value = 0 where conposid=162040;
update ims_contract_poshist set units = 0, value =0 where conposhistid = 66336241; -- feed 09 04 2020

update ims_omb_contract set contract_value = contract_value - 2200.7154580000, death_benefit = death_benefit - 2200.7154580000, surrender_value = surrender_value -2200.7154580000 where contractid= 8026;
update ims_omb_contracthist set contract_value = contract_value - 2200.7154580000, death_benefit = death_benefit - 2200.7154580000, surrender_value = surrender_value -2200.7154580000 where contractid= 8026 and feed_date ='2020-04-09';


update ims_omb_acct set account_value = account_value - 2200.7154580000, death_benefit = death_benefit - 2200.7154580000, surrender_value = surrender_value -2200.7154580000 where acctid= 16109;
update ims_omb_accthist set account_value = account_value - 2200.7154580000, death_benefit = death_benefit - 2200.7154580000, surrender_value = surrender_value -2200.7154580000 where acctid= 16109 and feed_date ='2020-04-09';

