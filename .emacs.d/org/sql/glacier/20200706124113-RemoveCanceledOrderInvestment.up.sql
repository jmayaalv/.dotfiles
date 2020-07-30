--:!7
update ims_contract_txn set visibility= 99 where txnid in (8213615, 8213665, 8213666, 8213667, 8213668, 8217222, 8217223);

--:!1
update ims_contract_pos set units = 0, value= 0 where conposid = 231600;
--:!1
update ims_contract_pos set units = units - 52687.0000000000, value= value-52687.0000000000 where conposid = 231383;

--:!3
update ims_contract_poshist set units = 0, value= 0 where contractid  = 15055 and fundid = 23130;
--:!6
update ims_contract_poshist set units = units - 52687.0000000000, value= value-52687.0000000000 where contractid  = 15055 and fundid  = 17910;

--:!1
update ims_omb_acct oa set 
	account_value = account_value - 2748.597618 - 52687.0, 
	death_benefit = death_benefit - 2748.597618 - 52687.0,
	surrender_value = surrender_value - 2748.597618 - 52687.0
	where oa.acctid = 23517;


--:!1
update ims_omb_accthist oa set 
	account_value = account_value- 2748.597618 - 52687.0, 
	death_benefit = death_benefit - 2748.597618 - 52687.0,
	surrender_value = surrender_value - 2748.597618 - 52687.0
	where oa.acctid = 23517 and id = 9703790;	
--:!5
update ims_omb_accthist oa set 
	account_value = account_value- 55460.0000000000,
	death_benefit = death_benefit - 55460.0000000000,
	surrender_value = surrender_value - 55460.0000000000
	where oa.acctid = 23517 and id <> 9703790;	


--:!1
update ims_omb_contract set 
	contract_value	= contract_value - 2748.597618 - 52687.0, 
	death_benefit = death_benefit - 2748.597618 - 52687.0,
	surrender_value = surrender_value - 2748.597618 - 52687.0
	where contractid = 15055;

--:!1
update ims_omb_contracthist set 
	contract_value	= contract_value - 2748.597618 - 52687.0, 
	death_benefit = death_benefit - 2748.597618 - 52687.0,
	surrender_value = surrender_value - 2748.597618 - 52687.0
	where contractid = 15055 and id = 9354559;
--:!5
update ims_omb_contracthist set 
	contract_value	= contract_value -  55460.0000000000,
	death_benefit = death_benefit - 55460.0000000000,
	surrender_value = surrender_value - 55460.0000000000
	where contractid = 15055 and id <> 9354559;


--:!1
update trd_contract_position set units = 0 where positionid = 122877032;
--:!1
update trd_contract_position set units = units - 52687.0 where positionid = 122876901;

--:!5
update trd_contract_position_history set units = 0 where contractid =7662 and fundid = 9612;
--:!2
update trd_contract_position_history set units = units - 52687.0 where contractid =7662 and fundid = 4866;


--:!1
update trd_order set code = concat('PRE059830','-canceled') where orderid = 172020;

