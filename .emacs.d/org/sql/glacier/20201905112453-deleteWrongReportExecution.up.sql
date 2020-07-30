-- :! 2
delete from ims.rep_subreport_document rsd where rsd.subreportid in (select rs.subreportid from ims.rep_subreport rs where rs.executionid in (4253,4254));
-- :! 2
delete from ims.rep_subreport rs where rs.executionid in (4253,4254);
-- :! 2
delete from ims.rep_report_execution rre where rre.executionid in (4253,4254);