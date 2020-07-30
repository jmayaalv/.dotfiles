-- !: 1
update ims_fund_details fd set ISIN =  'IE00BGT6GV38' from ims_fund f where f.fundid = fd.fundid and fd.isin ='IE00B7VMS436' and f.code = '1050001';

-- !: 1
update trd_fund set ISIN =  'IE00BGT6GV38' where isin ='IE00B7VMS436' and code ='1050001';

