insert into trd_order_status select nextval('seq_trd_order_status'), orderid, ':pending', now(), null from trd_order where code in ('AE6CB2A', 'B95F2A2');
update trd_order set status = ':pending' where code in ('AE6CB2A', 'B95F2A2');
