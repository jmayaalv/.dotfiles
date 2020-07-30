update ims_contract_poshist set units =0, value =0 where contractid = 7334 and fundid in (19400,19406) and unit_value =1 and feed_date between '2019-02-17' and '2019-03-23';
