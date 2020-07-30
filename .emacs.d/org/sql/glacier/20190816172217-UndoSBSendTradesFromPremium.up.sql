update ims_premium set confirm_date =null, confirmed_by =null, locked= false  where id = 8018;

update trd_order set status = ':rejected' where code = 'CRSW09844';
insert into trd_order_status(orderstatusid,orderid,status,date,details) select nextval('seq_trd_order_status'),o.orderid,o.status,now(),'[[":manual-reject", ":incorrect-match"]]' from trd_order o where o.code = 'CRSW09844';

delete from ims_invchangereq_contractswitch_trade where switchid = 9844;
delete from ims_invchangereq_contractswitch where switchid = 9844;
