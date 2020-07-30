delete from ims_fundmanager where managerid = 955 and not exists (select 1 from ims_fund where managerid = 955);

delete from rel_links where orgid = 26125;
delete from rel_org_details where orgid = 26125;
delete from rel_org where orgid = 26125;