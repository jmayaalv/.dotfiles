-- :! 14
insert into ent_funds_allocation (allocationid, archived, cdate, entity_id, entity_type, userid)
select nextval('seq_ent_funds_allocation'), false, now(), contractid, 'CONTRACT_PREFERRED_FUNDS', 1
from view_cont
where contractnum in ('I100006630', 'I100006986', 'I100009868', 'I100010526', 'I100010533', 'I100010717', 'I100010782', 'I100011443', 'I100011447', 'I100012049', 'I100012280', 'I100012319', 'I100007419',  'I100012731');

-- :! 12
insert into ent_funds_allocation_detail (detailid, allocationid, fundid,percentage)
select nextval('seq_ent_funds_allocation_detail'), allocationid, 23735, 0
from ent_funds_allocation fa, view_cont vc
where entity_type='CONTRACT_PREFERRED_FUNDS' and
 fa.archived=false and
 fa.entity_id = vc.contractid and
 vc.contractnum in ('I100006630', 'I100006986', 'I100009868', 'I100010526', 'I100010533', 'I100010717', 'I100010782', 'I100011443', 'I100011447', 'I100012049', 'I100012280', 'I100012319');

-- :! 1
insert into ent_funds_allocation_detail (detailid, allocationid, fundid,percentage)
select nextval('seq_ent_funds_allocation_detail'), allocationid, 18485, 0
from ent_funds_allocation fa, view_cont vc
where entity_type='CONTRACT_PREFERRED_FUNDS' and
 fa.archived=false and
 fa.entity_id = vc.contractid and
 vc.contractnum in ('I100007419');

-- :1 
insert into ent_funds_allocation_detail (detailid, allocationid, fundid,percentage)
select nextval('seq_ent_funds_allocation_detail'), allocationid, 23130, 0
from ent_funds_allocation fa, view_cont vc
where entity_type='CONTRACT_PREFERRED_FUNDS' and
 fa.archived=false and
 fa.entity_id = vc.contractid and
 vc.contractnum in ('I100012731');


