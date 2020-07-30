-- select eventid, acctid from ims_acct_clientevent where acctid in (23239, 23247) and typeid = 10;
--  eventid | acctid
-- ---------+--------
--    67894 |  23239
--    67901 |  23247
-- (2 rows)

update ims_acct_clientevent_fund set fundid = 17901 where eventid in (67894, 67901) and fundid = 17847;

