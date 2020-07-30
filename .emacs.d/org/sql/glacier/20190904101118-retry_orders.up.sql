update trd_order set status = ':pending' where code in ('FMV000864_1002004172', 'FMV000864_1002003141', '98FA788');
insert into trd_order_status select nextval('seq_trd_order_status'),orderid, ':pending', now(), null from trd_order where code in ('FMV000864_1002004172', 'FMV000864_1002003141', '98FA788');
