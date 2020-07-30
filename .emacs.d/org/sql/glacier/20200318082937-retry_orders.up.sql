insert into trd_order_status select nextval('seq_trd_order_status'), orderid, ':pending',  now(), null from trd_order where  code in
('CRSW015256', 'CRSW015250');
update trd_order set status = ':pending'  where   code in
('CRSW015256', 'CRSW015250');

