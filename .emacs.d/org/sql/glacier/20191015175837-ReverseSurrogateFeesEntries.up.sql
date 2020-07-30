-- :!4
insert into inv_account_entry (entryid,acctid,cdate,feed_date,txn_date,reference1,reference2,reference3,reference4,descr,currencyid,value,reversal_entry_id,createdby_id,reference5,reference6,typeid)
select nextval('seq_inv_account_entry'),acctid,now(),feed_date,txn_date,reference1,reference2,reference3,reference4,descr,currencyid,-ea.value,ea.entryid,1,reference5,reference6,typeid
from inv_account_entry ea where ea.reference1='1000031946' and reference2='7742' and reference3='21790';

