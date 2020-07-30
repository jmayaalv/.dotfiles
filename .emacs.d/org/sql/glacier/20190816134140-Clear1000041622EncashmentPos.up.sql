update ims_contract_pos set units = 0, value = 0 where contractid = 7568 and fundid in (19406,19408) ;
update ims_contract_poshist set units = 0, value = 0 where contractid = 7568 and fundid in (19406,19408) and feed_date ='2019-08-15';
