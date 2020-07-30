insert into trd_order_status select nextval('seq_trd_order_status'), orderid, ':pending',  now(), null from trd_order where  status = ':rejected' and code in
('CRSW015444');


update trd_order set status = ':pending'  where   status = ':rejected' and code in
('CRSW015444');

