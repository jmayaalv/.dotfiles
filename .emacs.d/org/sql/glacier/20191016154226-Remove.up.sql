-- :!1
update ims_contract_pos cp set units =  0, value = 0 where cp.contractid = 7742 and cp.fundid = 23876 and model_fundid = 21790;

-- :!1
update ims_contract_poshist cp set units =  0, value = 0 where cp.contractid = 7742 and cp.fundid = 23876 and model_fundid = 21790 and feed_date ='2019-10-15';

-- :!1
insert into trd_contract_position_history (poshistid, contractid, fundid, modelid,      units, currency,  unit_price,    date,      creation_date)
	values (nextval('seq_trd_contract_position_history'), 962, 10344,6432,0,'USD',1,'2019-10-15',now());

-- :!1
update trd_contract_position cp set units =  0  where cp.contractid = 962 and cp.fundid = 10344 and modelid = 6432;

