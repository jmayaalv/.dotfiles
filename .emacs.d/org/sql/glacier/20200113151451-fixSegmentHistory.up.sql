--:!3
update ims_contract_txn set txncodeid=(select tc.txncodeid from ims_txncode tc where txncode='151'), visibility=10
where txncodeid =100 and visibility=99 and txn_date='2017-12-20' and contractid in (9054, 7709,10106) ;

--:!3
update ims_contract_txn set txncodeid=(select tc.txncodeid from ims_txncode tc where txncode='150')
where txncodeid =102 and txn_date='2017-12-20' and contractid in (9054, 7709,10106) ;

--:!3
update ims_contract_segment set status = -9 where contractid in (9054, 7709,10106) ;