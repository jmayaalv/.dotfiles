create temp table  tmp_move_wfid_to_state on commit drop as 
select t.workflowrequestid as wfid, 'TRADING' as newstate from (
select (select max(txn.txnid) from ims_contract_txn txn, ims_contract_txntrade tr, ims_txncode txncode where txncode.txncode = t.fee_txn_code and tr.txnid = txn.txnid and txncode.txncodeid = txn.txncodeid and txn.contractid = vc.contractid and tr.changerequestid = icr.changerequestid) as txnid, 
  icr.changerequestid, icr.workflowrequestid
from ims_investment_change_request icr, ims_transfer t, ims_workflowrequest wr, view_cont vc
where icr.transferid = t.transferid and wr.requestid = icr.workflowrequestid
  and vc.acctid = t.acctid
  and t.fee_txn_code is not null
  and wr.state ='COMPLETED'
  and icr.request_date >= '2020-01-01'
  order by icr.request_date desc) t where t.txnid is null;

update ims_workflowrequest set state =newstate from tmp_move_wfid_to_state where requestid = wfid ;
update ims_workflowstate_track set ended_userid = 1, ended_on=now(), ended_state=newstate from tmp_move_wfid_to_state where requestid = wfid and ended_state is null;
insert into ims_workflowstate_track  select nextval('seq_ims_workflowstate_track'),null,null,null,1,now(),newstate,null,null,w.requestid from ims_workflowrequest w, tmp_move_wfid_to_state tmp where w.requestid = tmp.wfid;

