update trd_order set status = ':pending' where code in ('B95F2A2', 'AE6CB2A', '379928C');
insert into trd_order_status select nextval('seq_trd_order_status'), orderid, ':pending', now(), null from trd_order where code in ('B95F2A2', 'AE6CB2A', '379928C')
