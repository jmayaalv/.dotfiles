delete from ims.rep_subreport_document rsd where rsd.subreportid in (select rs.subreportid from ims.rep_subreport rs where rs.executionid = 3121);
delete from ims.rep_subreport rs where rs.executionid = 3121;
delete from ims.rep_report_execution rre where rre.executionid = 3121;
delete from ims.rep_subreport_document rsd where subreportid = 5510 and documentid in (923291, 923310);