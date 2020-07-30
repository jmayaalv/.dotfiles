--:!1
update trd_order set code = concat(code,'-canceled') where orderid = 172020;
--:!1
insert into trd_order_status(orderstatusid,orderid,status,date,details) select nextval('seq_trd_order_status'),o.orderid,':canceled',now(),'[["Graziela-SLACK", "can this be sent back to processing? By mistake the allocation includes a Mutual Fund and Premium is an In-species"]]' from trd_order o where o.orderid = 172020;



--:!1
create temp table  tmp_move_wfid_to_state on commit drop as 
select w.requestid as wfid, 'PROCESSING' as newstate from ims_workflowrequest w where w.requestid in (59830);

--:!1
update ims_workflowrequest set state =newstate from tmp_move_wfid_to_state where requestid = wfid ;
--:!1
update ims_workflowstate_track set ended_userid = 1, ended_on=now(), ended_state=newstate from tmp_move_wfid_to_state where requestid = wfid and ended_state is null;
--:!1
insert into ims_workflowstate_track  select nextval('seq_ims_workflowstate_track'),null,null,null,1,now(),newstate,null,null,w.requestid from ims_workflowrequest w, tmp_move_wfid_to_state tmp where w.requestid = tmp.wfid;

