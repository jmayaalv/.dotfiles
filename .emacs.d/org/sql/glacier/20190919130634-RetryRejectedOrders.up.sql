-- !: 2
insert into trd_order_status(orderstatusid,orderid,status,date,details) select nextval('seq_trd_order_status'),o.orderid,':pending',now(),null from trd_order o where o.code in ('B95F2A2','AE6CB2A')  and o.status =':rejected';
-- !: 2
update trd_order set status =':pending' where code in ('B95F2A2','AE6CB2A') and status = ':rejected';


