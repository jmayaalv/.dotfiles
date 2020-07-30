-- !: 1
update trd_contract_position cp set units = 0.0 from trd_contract c where c.contractid = cp.contractid and fundid = 4861 and c.code ='I100010763' and modelid is null;
-- !: 1
insert into trd_contract_position_history (poshistid ,contractid, fundid, modelid,      units, currency,  unit_price,    date,    creation_date)
select nextval('seq_trd_contract_position_history'), c.contractid, cp.fundid, cp.modelid, cp.units, cp.currency, cp.unit_price, '2019-09-17', now() from 
trd_contract c, trd_contract_position cp where c.contractid = cp.contractid and cp.fundid = 4861 and c.code = 'I100010763' and modelid is null;
-- !: 1
update ims_contract_pos cp set units = 0, value = 0 from ims_contract c where c.contractid = cp.contractid and fundid = 18371 and c.contractnum ='I100010763';
-- !: 1
update ims_contract_poshist cp set units = 0, value = 0 from ims_contract c where c.contractid = cp.contractid and fundid = 18371 and c.contractnum ='I100010763' and feed_date = '2019-09-17';

