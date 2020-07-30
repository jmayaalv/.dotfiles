-- :! 13
insert into ent_funds_allocation (allocationid, archived, cdate, entity_id, entity_type, userid)
select nextval('seq_ent_funds_allocation'), false, now(), contractid, 'CONTRACT_PREFERRED_FUNDS', 1
from view_cont
where acctnum in ('1000020469', '1000026698', '1000026763', '1000028710', '1000043974', '1000051563', '1000052769', '1000055135', '1002014833', '1002017620', '1900287101', '1002013355', '1002015392');

-- :! 13
insert into ent_funds_allocation_detail (detailid, allocationid, fundid,percentage)
select nextval('seq_ent_funds_allocation_detail'), allocationid, 23735, 0
from ent_funds_allocation fa, view_cont vc
where entity_type='CONTRACT_PREFERRED_FUNDS' and
 fa.archived=false and
 fa.entity_id = vc.contractid and
 vc.acctnum in ('1000020469', '1000026698', '1000026763', '1000028710', '1000043974', '1000051563', '1000052769', '1000055135', '1002014833', '1002017620', '1900287101', '1002013355', '1002015392');

