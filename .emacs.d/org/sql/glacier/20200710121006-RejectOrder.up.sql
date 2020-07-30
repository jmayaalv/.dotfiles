
--:!1
update trd_order set status = ':rejected' where orderid = 177111;
--:!1
insert into trd_order_status(orderstatusid,orderid,status,date,details) select nextval('seq_trd_order_status'),o.orderid,':rejected',now(),'[["GIBAU-1485", "Kindly send this workflow back to processing for the team to reject as it was sent to trading with the incorrect allocation"]]' from trd_order o where o.orderid = 177111;


--:!1
create temp table  tmp_move_wfid_to_state on commit drop as 
select w.requestid as wfid, 'PROCESSING' as newstate from ims_workflowrequest w where w.requestid in (60825);

--:!1
update ims_workflowrequest set state =newstate from tmp_move_wfid_to_state where requestid = wfid ;
--:!1
update ims_workflowstate_track set ended_userid = 1, ended_on=now(), ended_state=newstate from tmp_move_wfid_to_state where requestid = wfid and ended_state is null;
--:!1
insert into ims_workflowstate_track  select nextval('seq_ims_workflowstate_track'),null,null,null,1,now(),newstate,null,null,w.requestid from ims_workflowrequest w, tmp_move_wfid_to_state tmp where w.requestid = tmp.wfid;

