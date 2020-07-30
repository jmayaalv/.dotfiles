--:!1
create temp table  tmp_move_wfid_to_state on commit drop as 
select w.requestid as wfid, 'TRADING' as newstate from ims_workflowrequest w where w.requestid in (56487);

--:!1
update ims_workflowrequest set state =newstate from tmp_move_wfid_to_state where requestid = wfid ;
--:!1
update ims_workflowstate_track set ended_userid = 1, ended_on=now(), ended_state=newstate from tmp_move_wfid_to_state where requestid = wfid and ended_state is null;
--:!1
insert into ims_workflowstate_track  select nextval('seq_ims_workflowstate_track'),null,null,null,1,now(),newstate,null,null,w.requestid from ims_workflowrequest w, tmp_move_wfid_to_state tmp where w.requestid = tmp.wfid;

--:!1
update ims_sbtrade_req set status  = 2 where id = 1447;
