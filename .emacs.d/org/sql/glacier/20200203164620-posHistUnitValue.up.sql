-- GIIMS-1482
-- change the unit value from the migrated position from igas 

-- select conposhistid, feed_date, units, unit_value, value from ims_contract_poshist where not archived and fundid = 18487 and contractid = 9458 order by feed_date limit 3;
--  conposhistid |      feed_date      |      units      |   unit_value   |       value
-- --------------+---------------------+-----------------+----------------+-------------------
--      28226673 | 2017-03-27 00:00:00 | 1819.9134970000 | 152.1900000000 | 276972.6351080000
--      28226674 | 2017-03-28 00:00:00 | 1819.9134970000 | 153.0400000000 | 278519.5615810000
--      28226675 | 2017-03-29 00:00:00 | 1819.9134970000 | 153.6700000000 | 279666.1070840000
-- (3 rows)

update ims_contract_poshist set archived  = true where not archived and fundid = 18487 and contractid = 9458 and feed_date = '2017-03-27';

insert into ims_contract_poshist values (nextval('seq_ims_contract_poshist'), false, now(), '2017-03-27', 153.290, 1819.9134970000, round(153.290*1819.9134970000,6), 9458, 18487,null, 0);

