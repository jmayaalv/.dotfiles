insert into trd_order_status(orderstatusid,orderid,status,date) select nextval('seq_trd_order_status'),o.orderid,':pending',now() 
  from trd_order o where o.orderid in (164379,164388,164382,164376,164386,164378,164375,164380,164383,164389,164374,164381,164387,164377);

update trd_order o set status = ':pending' where o.orderid in (164379,164388,164382,164376,164386,164378,164375,164380,164383,164389,164374,164381,164387,164377);

