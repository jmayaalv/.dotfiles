-- :! 303
insert into trd_order_status(orderstatusid,orderid,status,date,details) select nextval('seq_trd_order_status'),o.orderid,':rejected',now(),'[["invalid-amount", "zero"]]' from trd_order o where o.type = ':dividend-update' and o.status =':processing' and (o.details->0->>'amount')::numeric =0.0;
-- !: 303
update trd_order o set status = ':rejected' where o.type = ':dividend-update' and o.status =':processing' and (o.details->0->>'amount')::numeric =0.0;

-- !: 1
insert into trd_order_status(orderstatusid,orderid,status,date,details) select nextval('seq_trd_order_status'),o.orderid,':pending',now(),null from trd_order o where o.type = ':surrender' and o.code = '98FA788';
-- !: 1
update trd_order o set status = ':pending' where o.type = ':surrender' and o.code = '98FA788';

