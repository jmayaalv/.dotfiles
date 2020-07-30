delete from sec_group_resource where entity_type in ('INVESTMENT_SWITCH.DRAFT','INVESTMENT_SWITCH.NEW','INVESTMENT_WITHDRAWAL.DRAFT', 'INVESTMENT_WITHDRAWAL.NEW');

insert into sec_group_resource (groupresource,entity_id, entity_type, groupid)
select nextval('seq_sec_group_resource'), 0, 'INVESTMENT_SWITCH.DRAFT', groupid
from sec_group g, rel_branding b
where g.public_group = true and g.enabled = true and g.tenantid=b.orgid and g.internal_group = false;
insert into sec_group_resource (groupresource,entity_id, entity_type, groupid)
select nextval('seq_sec_group_resource'), 0, 'INVESTMENT_SWITCH.NEW', groupid
from sec_group g, rel_branding b
where g.public_group = true and g.enabled = true and g.tenantid=b.orgid and g.internal_group = false;
insert into sec_group_resource (groupresource,entity_id, entity_type, groupid)
select nextval('seq_sec_group_resource'), 0, 'INVESTMENT_WITHDRAWAL.DRAFT', groupid
from sec_group g, rel_branding b
where g.public_group = true and g.enabled = true and g.tenantid=b.orgid and g.internal_group = false;
insert into sec_group_resource (groupresource,entity_id, entity_type, groupid)
select nextval('seq_sec_group_resource'), 0, 'INVESTMENT_WITHDRAWAL.NEW', groupid
from sec_group g, rel_branding b
where g.public_group = true and g.enabled = true and g.tenantid=b.orgid and g.internal_group = false;