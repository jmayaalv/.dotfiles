insert into trd_order_status select nextval('seq_trd_order_status'), orderid, ':pending', now(), null from trd_order where code = '98FA788';
update trd_order set status = ':pending' where code = '98FA788';
