insert into trd_fund_suspension (suspensionid, fundid, date, suspended)
select nextval('seq_trd_fund_suspension'), f.fundid, now(), true
from ims_fund if, ims_fund_details d, trd_fund f
where if.fundid = d.fundid
and d.trade_statusid = 99
and if.code=f.code;

