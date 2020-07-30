--gather June 5th trail commission for policy: 1002028536
-- :! 1
insert into ims.ims_commission_payment_report ( reportid, cdate, initial_balance, report_date, report_type, advisor_orgid, rpt_orgid, notification_date)
select 
	nextval('ims.seq_ims_acct_commission_report')
	,now()
	,0.0
	,'2020-06-05'
	,'TRAIL'
	,17748
	,18305
	,null
;

-- :! 2
update ims.ims_acct_commission_advisor set reportid = (select reportid from ims.ims_commission_payment_report icpr where icpr.report_type = 'TRAIL' and icpr.report_date = '2020-06-05' and icpr.rpt_orgid = 18305 and icpr.advisor_orgid = 17748 ) where acct_comm_advisorid in (226813,226812);

-- :! 2
update ims.ims_acct_advisor_config set commission_percent = 100 where commission_percent > 100;