update ims_contract_txn set feed_date='2019-10-05', txn_date='2019-10-05'
where txnid in (select txnid from ims_contract_txn where feed_date = '2019-10-06' and txncodeid in (118, 129, 124, 130));
