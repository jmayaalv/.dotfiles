insert into trd_order_status
select nextval('seq_trd_order_status'), orderid, ':completed', now(), null
from trd_order o
where status=':processing'
and type=':dividend-update'
and not exists (select 1 from trd_instruction where completion_date is null and order_code=o.code)
and not exists (select 1 from trd_transaction t, trd_instruction i where t.instruction_code=i.code and i.order_code = o.code and not exists (select 1 from trd_settlement where transactionid=t.transactionid));


update trd_order set status=':completed' where orderid in (
select orderid
from trd_order o
where status=':processing'
and type=':dividend-update'
and not exists (select 1 from trd_instruction where completion_date is null and order_code=o.code)
and not exists (select 1 from trd_transaction t, trd_instruction i where t.instruction_code=i.code and i.order_code = o.code and not exists (select 1 from trd_settlement where transactionid=t.transactionid)));

