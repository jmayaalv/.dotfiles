delete from trd_fund_suspension;

insert into trd_fund_suspension (suspensionid, fundid, date, suspended)
select nextval('seq_trd_fund_suspension'),  f.fundid, coalesce (s.suspension_date, s.cdate) as date, s.suspended
from trd_fund f, ims_fund_suspension s
where f.isin = s.isin
order by date asc;

insert into trd_fund_suspension (suspensionid, fundid, date, suspended)
select nextval('seq_trd_fund_suspension'), f.fundid, now (), true
from ims_fund_details d, ims_fund if, trd_fund f
where f.code = if.code
and if.fundid=d.fundid
and f.type in (':mutual', ':hedge')
and d.trade_statusid=99;
