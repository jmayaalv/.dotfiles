update ims_fund set name = 'Fee Transactions in Progress' where fundid in (select fundid from ims_fund_details where use_typeid = 104 );

update trd_fund set name = 'Fee Transactions in Progress' where code in (select code from ims_fund f, ims_fund_details d where d.fundid=f.fundid and d.use_typeid=104);