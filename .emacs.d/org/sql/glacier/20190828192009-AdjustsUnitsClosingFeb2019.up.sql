create temp table tmp_glacier_gcp_fix_units (
	contractid bigint,
	fundid bigint,
	feed_date_from timestamp without time zone,
	feed_date_to timestamp without time zone,
	units numeric(30,10)) on commit drop;

insert into tmp_glacier_gcp_fix_units values(7334, 18484, '2019-02-21','2019-03-24',2.083425);
insert into tmp_glacier_gcp_fix_units values(7334, 18689, '2019-02-20','2019-03-24',0.417588);
insert into tmp_glacier_gcp_fix_units values(7334, 18691, '2019-02-21','2019-03-24',1.165059);
insert into tmp_glacier_gcp_fix_units values(7334, 18563, '2019-02-20','2019-03-24',0.314171);
insert into tmp_glacier_gcp_fix_units values(7334, 18422, '2019-02-20','2019-03-24',9.509373);

update 	ims_contract_poshist cph set units = cph.units+t.units, value = (cph.units+t.units)*cph.unit_value from tmp_glacier_gcp_fix_units t where cph.contractid = t.contractid and t.fundid = cph.fundid and cph.feed_date between t.feed_date_from and t.feed_date_to;

update ims_omb_accthist h set account_value = h.account_value + (t.units*cph.unit_value), death_benefit = h.death_benefit + (t.units*cph.unit_value), surrender_value = h.surrender_value+ (t.units*cph.unit_value)
  from tmp_glacier_gcp_fix_units t, ims_contract_poshist cph, view_cont vc where cph.contractid = t.contractid and vc.contractid = t.contractid and t.fundid = cph.fundid and h.feed_date = cph.feed_date and cph.feed_date between t.feed_date_from and t.feed_date_to and h.acctid = vc.acctid;

update ims_omb_contracthist h set contract_value = h.contract_value + (t.units*cph.unit_value), death_benefit = h.death_benefit + (t.units*cph.unit_value), surrender_value = h.surrender_value+ (t.units*cph.unit_value)
  from tmp_glacier_gcp_fix_units t, ims_contract_poshist cph where h.contractid = cph.contractid and cph.contractid = t.contractid and t.fundid = cph.fundid and h.feed_date = cph.feed_date and cph.feed_date between t.feed_date_from and t.feed_date_to and t.fundid = 18484;

update ims_omb_contracthist h set contract_value = h.contract_value + (t.units*cph.unit_value), death_benefit = h.death_benefit + (t.units*cph.unit_value), surrender_value = h.surrender_value+ (t.units*cph.unit_value)
  from tmp_glacier_gcp_fix_units t, ims_contract_poshist cph where h.contractid = cph.contractid and cph.contractid = t.contractid and t.fundid = cph.fundid and h.feed_date = cph.feed_date and cph.feed_date between t.feed_date_from and t.feed_date_to and t.fundid = 18689;   

update ims_omb_contracthist h set contract_value = h.contract_value + (t.units*cph.unit_value), death_benefit = h.death_benefit + (t.units*cph.unit_value), surrender_value = h.surrender_value+ (t.units*cph.unit_value)
  from tmp_glacier_gcp_fix_units t, ims_contract_poshist cph where h.contractid = cph.contractid and cph.contractid = t.contractid and t.fundid = cph.fundid and h.feed_date = cph.feed_date and cph.feed_date between t.feed_date_from and t.feed_date_to and t.fundid = 18691;

update ims_omb_contracthist h set contract_value = h.contract_value + (t.units*cph.unit_value), death_benefit = h.death_benefit + (t.units*cph.unit_value), surrender_value = h.surrender_value+ (t.units*cph.unit_value)
  from tmp_glacier_gcp_fix_units t, ims_contract_poshist cph where h.contractid = cph.contractid and cph.contractid = t.contractid and t.fundid = cph.fundid and h.feed_date = cph.feed_date and cph.feed_date between t.feed_date_from and t.feed_date_to and t.fundid = 18563; 

update ims_omb_contracthist h set contract_value = h.contract_value + (t.units*cph.unit_value), death_benefit = h.death_benefit + (t.units*cph.unit_value), surrender_value = h.surrender_value+ (t.units*cph.unit_value)
  from tmp_glacier_gcp_fix_units t, ims_contract_poshist cph where h.contractid = cph.contractid and cph.contractid = t.contractid and t.fundid = cph.fundid and h.feed_date = cph.feed_date and cph.feed_date between t.feed_date_from and t.feed_date_to and t.fundid = 18422; 
	

