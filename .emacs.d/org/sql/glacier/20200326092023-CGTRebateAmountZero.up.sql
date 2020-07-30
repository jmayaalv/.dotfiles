create temp table tmp_cgt_rebate_amount_zero on commit drop as
select orderid, code, status, (select sum(i.amount) from trd_instruction i where i.order_code = o.code) amount
  from trd_order o where status = ':processing' and code ilike 'PRERBT%';

insert into trd_order_status(orderstatusid,orderid,status,date,details) select nextval('seq_trd_order_status'),o.orderid,':completed',now(),'[["GIIMS-1621", "amount 0"]]' from tmp_cgt_rebate_amount_zero o where o.amount =0;

update trd_order o set status = ':completed' from tmp_cgt_rebate_amount_zero t where t.amount =0 and t.orderid = o.orderid;
