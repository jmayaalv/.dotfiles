Create temp table tmp_taxrec_rejected_fund on commit drop as
select icr.changerequestid, icr.confirmation_code, sw.switchid, o.orderid, o.code, o.status, wr.type, icr.workflowrequestid, (select (st.details) from trd_order_status st where st.orderid = o.orderid and st.status=':rejected' limit 1) details
  from ims_investment_change_request icr, ims_workflowrequest wr, ims_invchangereq_contractswitch sw, trd_order o
where icr.changerequestid = sw.changerequestid
  and o.code = icr.confirmation_code
  and wr.requestid = icr.workflowrequestid
  and o.status =':rejected'
  and wr.type ='INVESTMENT_INTERNAL_WITHDRAWAL'
  and wr.state = 'TRADING' order by o.status;

update ims_workflowrequest set state ='REJECTED' from tmp_taxrec_rejected_fund t where requestid = t.workflowrequestid ;
update ims_workflowstate_track set ended_userid = 1, ended_on=now(), ended_state='REJECTED' from tmp_taxrec_rejected_fund t where requestid = t.workflowrequestid and ended_state is null;
insert into ims_workflowstate_track  select nextval('seq_ims_workflowstate_track'),null,null,null,1,now(),'REJECTED',null,null,tmp.workflowrequestid from ims_workflowrequest w, tmp_taxrec_rejected_fund tmp where w.requestid = tmp.workflowrequestid;


Create temp table tmp_taxrec_notrading_fund on commit drop as
select icr.changerequestid, icr.confirmation_code, sw.switchid, o.orderid, o.code order_code, o.status, wr.type, wr.requestid, f.code fund_code, f.isin,f.name,t.transactionid, t.traded_on, t.amount
  from ims_investment_change_request icr, ims_workflowrequest wr, ims_invchangereq_contractswitch sw, trd_order o, trd_instruction i, trd_fund f, trd_transaction t
where icr.changerequestid = sw.changerequestid
  and o.code = icr.confirmation_code
  and wr.requestid = icr.workflowrequestid
  and wr.type ='INVESTMENT_INTERNAL_WITHDRAWAL'
  and wr.state = 'TRADING' 
  and i.order_code = o.code
  and o.status = ':processing'
  and t.instruction_code = i.code
  and not exists (select 1 from trd_settlement s where s.transactionid = t.transactionid)
  and f.fundid = t.fundid
  order by f.code;


delete from trd_trade_detail where  transactionid in (select t.transactionid from tmp_taxrec_notrading_fund t);
delete from trd_transaction where  transactionid in (select t.transactionid from tmp_taxrec_notrading_fund t);

delete from ims_invchangereq_contractswitch_trade where settlement_txndate is null and switchid in (select t.switchid from tmp_taxrec_notrading_fund t);
update ims_invchangereq_contractswitch set completion_date = now() where switchid in (select t.switchid from tmp_taxrec_notrading_fund t);
update trd_order set status = ':completed' where orderid in (select t.orderid from tmp_taxrec_notrading_fund t) ;
insert into trd_order_status(orderstatusid,orderid,status,date,details) select nextval('seq_trd_order_status'),o.orderid,':completed',now(),'[["GIIMS-1578", "manually-completed"]]' from tmp_taxrec_notrading_fund o;

