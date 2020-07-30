-- :!1
create temp table tmp_contract_txn_seq on commit drop as select nextval('seq_ims_contract_txn') as nextval, 214114.80 as amount,214114.80 as units, 1 as unit_price, '2017-10-26'::date as txn_date, f.fundid, 8867 as contractid,19733 as modelid  from ims_fund f where f.code = '13083';

-- :!1
insert into ims_contract_txn (txnid, amount,cdate,feed_date,txn_date,visibility,contractid,txncodeid,currencyid,surrogate)
select s.nextval, s.amount, now(),s.txn_date,s.txn_date,10,s.contractid,366,1,false
 from tmp_contract_txn_seq s ;

-- :!1
insert into ims_contract_txntrade (tradeid,  cdate, unit_value,units,value,fundid,model_fundid,txnid, changerequestid,valuation_date,contractswitch_trade,commonid,commonid_status,cellnum)
select nextval('seq_ims_contract_txntrade'), now(), s.unit_price, s.units, s.amount, s.fundid,s.modelid,s.nextval, null,s.txn_date,null,null,null,null
 from tmp_contract_txn_seq s ;

