insert into rep_report (reportid, category, code, description, name, send_notifications, default_ownerorgid, notif_subject, calendarid, monitored, visible, source, interactive)
 select nextval('seq_rep_report'), 'NO_CAT', 'GROSS_INFLOWS', 'Gross Inflows', 'Gross Inflows', false, orgid, null, null, false, true, 'IMS', false
from rel_branding
where not exists (select 1 from rep_report where code = 'GROSS_INFLOWS')
 and branding_type = 12 and orgid is not null;

insert into rep_report (reportid, category, code, description, name, send_notifications, default_ownerorgid, notif_subject, calendarid, monitored, visible, source, interactive)
 select nextval('seq_rep_report'), 'NO_CAT', 'OUTFLOWS', 'Outflows', 'Outflows', false, orgid, null, null, false, true, 'IMS', false
from rel_branding
where not exists (select 1 from rep_report where code = 'OUTFLOWS')
 and branding_type = 12 and orgid is not null;
