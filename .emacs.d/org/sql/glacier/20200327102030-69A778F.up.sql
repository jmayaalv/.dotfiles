insert into trd_order_status select nextval('seq_trd_order_status'), orderid, ':pending',  now(), null from trd_order where  code in
('69A778F');


update trd_order set status = ':pending'  where   code in
('69A778F');

