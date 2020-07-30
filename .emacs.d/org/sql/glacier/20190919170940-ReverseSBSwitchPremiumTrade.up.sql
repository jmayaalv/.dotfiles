-- :! 2
insert into trd_order_status(orderstatusid,orderid,status,date,details) select nextval('seq_trd_order_status'),o.orderid,':rejected',now(),'[["invalid-premium", "GIPS-851"]]' from trd_order o where o.type = ':switch' and o.status =':pending' and o.code in  ('CRSW010056','CRSW010055');
-- !: 2
update trd_order o set status = ':rejected' where o.type = ':switch' and o.status =':pending' and o.code in  ('CRSW010056','CRSW010055');

-- !: 1
update ims_premium op set amount = op.amount+fp.amount, locked =false, matched_date = null,matched_to_id =null,matched_to_type =null,confirm_date =null, confirmed_by =null from ims_premium fp where fp.parentid = op.parentid and fp.id = 8479 and op.id = 8436;
-- !: 1
update ims_premium fp set archived = true where fp.id = 8479;
-- !: 1
update ims_contract_txn set visibility = 99 where txnid = 6670333;	
-- !: 4
delete from ims_invchangereq_contractswitch_trade where switchid in (10056,10055);
-- !: 4
delete from ims_invchangereq_contractswitch where switchid in (10056,10055);

