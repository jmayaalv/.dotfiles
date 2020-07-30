-- :! 6
insert into ent_funds_allocation (allocationid, archived, cdate, entity_id, entity_type, userid)
select nextval('seq_ent_funds_allocation'), false, now(), contractid, 'CONTRACT_PREFERRED_FUNDS', 1
from view_cont
where acctnum in ('1002027942', '1002010633', '1000048528', '1002023016', '1002014494', '1002028676');

-- :! 6
insert into ent_funds_allocation_detail (detailid, allocationid, fundid,percentage)
select nextval('seq_ent_funds_allocation_detail'), allocationid, 18665, 0
from ent_funds_allocation fa, view_cont vc
where entity_type='CONTRACT_PREFERRED_FUNDS' and
 fa.archived=false and
 fa.entity_id = vc.contractid and
 vc.acctnum in ('1002027942', '1002010633', '1000048528', '1002023016', '1002014494', '1002028676');