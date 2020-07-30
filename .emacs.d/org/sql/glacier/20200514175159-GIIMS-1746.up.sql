update trd_fund set isin = 'BMG6766G1327' where isin = 'BMG6766G1087';
update trd_fund set isin = 'LU0241795839' where isin = 'LU0241795839';
update trd_fund set isin = 'LU2122430866' where isin = 'LU0891391392';

update prc_fund set isin = 'BMG6766G1327' where isin = 'BMG6766G1087';
update prc_fund set isin = 'LU0241795839' where isin = 'LU0241795839';
update prc_fund set isin = 'LU2122430866' where isin = 'LU0891391392';

update ims_fund_details set ticker='ORBGLSR BH', isin = 'BMG6766G1327' where isin = 'BMG6766G1087';
update ims_fund_details set ticker='ORBEMSR LX', isin = 'LU0241795839' where isin = 'LU0241795839';
update ims_fund_details set ticker='ORBGBSR LX', isin = 'LU2122430866' where isin = 'LU0891391392';
