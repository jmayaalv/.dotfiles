insert into ent_funds_allocation (allocationid, archived, cdate, entity_id, entity_type, userid)
values(nextval('seq_ent_funds_allocation'), false, now(), (select contractid from view_cont where acctnum='1002012910'), 'CONTRACT_PREFERRED_FUNDS', 1);

insert into ent_funds_allocation_detail (detailid, allocationid, fundid,percentage)
values(nextval('seq_ent_funds_allocation_detail'),
       (select allocationid from ent_funds_allocation
       where entity_id=(select contractid from view_cont where acctnum='1002012910')
       and entity_type='CONTRACT_PREFERRED_FUNDS' and archived=false order by cdate desc limit 1),
       (select fundid from ims_fund where code ='1120092'), 0);