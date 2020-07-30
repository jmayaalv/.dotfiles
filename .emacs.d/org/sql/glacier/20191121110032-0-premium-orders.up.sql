update trd_order set status=':rejected' where code in ('PRERBT6636118', 'PRERBT6636113', 'PRERBT6636100');
insert into trd_order_status select nextval('seq_trd_order_status'), orderid, ':rejected',now(), null from trd_order where code in ('PRERBT6636118', 'PRERBT6636113', 'PRERBT6636100');

