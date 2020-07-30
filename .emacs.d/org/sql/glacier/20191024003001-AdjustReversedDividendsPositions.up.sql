-- :!93
update trd_contract_position_history set units = 2438.9651260000 where contractid = 3744 and fundid = 4386 and units <> 2438.9651260000;
-- :!1
update trd_contract_position set units = 2438.9651260000 where contractid = 3744 and fundid = 4386 and units <> 2438.9651260000;
-- :!1
update ims_contract_pos set units  = 2438.9651260000, value = 2438.9651260000*unit_value where contractid = 10525  and fundid = 18865 and units<> 2438.9651260000 ;
-- :!244
update ims_contract_poshist set units  = 2438.9651260000, value = 2438.9651260000*unit_value where contractid = 10525  and fundid = 18865 and units<> 2438.9651260000 and feed_date >= '2019-02-01' and not archived;


