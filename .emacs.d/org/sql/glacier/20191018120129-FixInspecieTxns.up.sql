-- :!1
update ims_acct_clientevent set settlement_date = confirm_gendate where eventid = 61658 and commonid = 'PRE044814';

-- :!8
update ims_contract_txntrade tr set fundid = 23676 where tr.txnid in (6780137,6780138, 6780128,6780129,6780130,6780132);

-- :!12
update ims_contract_txn txn set visibility = 99 from ims_contract_txntrade tr,  ims_txncode txncode where  txn.txncodeid = txncode.txncodeid and txn.txnid = tr.txnid and  tr.commonid='PRE044814'
   and txncode not in ('1','T401','100','1100','1102');


-- :!9
delete from ims_contract_poshist cp where cp.contractid = 9346 and cp.fundid in (19422,19394,19396) and cp.feed_date between '2019-10-14' and '2019-10-17';

-- :!1
delete from ims_contract_pos cp where cp.contractid = 9346 and cp.fundid in (19422,19394,19396) ;

-- :!4
update ims_contract_poshist cp set units = 3133.6883010000, value = 3133.6883010000 * unit_value where cp.contractid = 9346 and cp.fundid in (19184) and feed_date between '2019-10-14' and '2019-10-17';
-- :!1
update ims_contract_pos cp set units = 3133.6883010000, value = 3133.6883010000 * unit_value where cp.contractid = 9346 and cp.fundid in (19184) ;

-- :!4
update ims_contract_poshist cp set units = 59.8336700000, value = 59.8336700000 * unit_value where cp.contractid = 9346 and cp.fundid in (18686) and feed_date between '2019-10-14' and '2019-10-17';
-- :!1
update ims_contract_pos cp set units = 59.8336700000, value = 59.8336700000 * unit_value where cp.contractid = 9346 and cp.fundid in (18686) ;

-- :!4
update ims_contract_poshist cp set units = 258.9814350000, value = 258.9814350000 * unit_value where cp.contractid = 9346 and cp.fundid in (18502) and feed_date between '2019-10-14' and '2019-10-17';
-- :!1
update ims_contract_pos cp set units = 258.9814350000, value = 258.9814350000 * unit_value where cp.contractid = 9346 and cp.fundid in (18502);

-- :!4
update ims_contract_poshist cp set units = 607.9042250000, value = 607.9042250000 * unit_value where cp.contractid = 9346 and cp.fundid in (18446) and feed_date between '2019-10-14' and '2019-10-17';
-- :!1
update ims_contract_pos cp set units = 607.9042250000, value = 607.9042250000 * unit_value where cp.contractid = 9346 and cp.fundid in (18446);


-- :!5
delete from trd_trade_detail s where s.transactionid in (select i.transactionid from trd_transaction i where common_id = 'PRE044814' and contractid= 2565 and code <> ':T401A');

-- :!16
delete from trd_settlement s where s.transactionid in (select i.transactionid from trd_transaction i where common_id = 'PRE044814' and contractid= 2565 and code <> ':T401A');

-- :!17
delete from trd_instruction i where common_id = 'PRE044814' and transaction_code <> ':T401A' and contract_code = 'I100008722';

-- :!16
delete from trd_transaction i where common_id = 'PRE044814' and contractid= 2565 and code <> ':T401A';

-- :!1
update trd_contract_position set units = 3133.6883007482 where fundid = 5004 and contractid = 2565;
-- :!1
update trd_contract_position_history set units = 3133.6883007482 where fundid = 5004 and contractid = 2565 and units <> 3133.6883007482 and date > '2019-10-14';

-- :!1
update trd_contract_position set units = 258.9814353922 where fundid = 5073 and contractid = 2565;
-- :!1
update trd_contract_position_history set units = 258.9814353922 where fundid = 5073 and contractid = 2565 and units <> 258.9814353922 and date > '2019-10-14';

-- :!1
update trd_contract_position set units = 607.9042252864 where fundid = 4990 and contractid = 2565;
-- :!2
update trd_contract_position_history set units = 607.9042252864 where fundid = 4990 and contractid = 2565 and units <> 607.9042252864 and date > '2019-10-14';

-- :!1
update trd_contract_position set units = 0 where fundid = 5959 and contractid = 2565;
-- :!1
update trd_contract_position_history set units = 0 where fundid = 5959 and contractid = 2565 and units <> 0 and date >= '2019-10-14';

-- :!1
update trd_order set status = ':completed' where code = 'PRE044814'; 
-- :!1
insert into trd_order_status select nextval('seq_trd_order_status'), o.orderid, o.status, now(), '[[":manual-completion", "GIBAU-1067"]]' from trd_order o where o.code = 'PRE044814';

