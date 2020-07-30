insert into trd_order_status select nextval('seq_trd_order_status'),  orderid, ':canceled',  now(), null from trd_order where  code in ('CRSW015992');
update trd_order set status = ':canceled'  where status =':pending'  and code in ('CRSW015992');

create temp table  tmp_move_wfid_to_state as select w.requestid as wfid, 'PROCESSING' as newstate from ims_workflowrequest w where requestid in (60232 );

update ims_workflowrequest set state =newstate from tmp_move_wfid_to_state where requestid = wfid ;

update ims_workflowstate_track set ended_userid = 1, ended_on=now(), ended_state=newstate from tmp_move_wfid_to_state where requestid = wfid and ended_state is null;

insert into ims_workflowstate_track  select nextval('seq_ims_workflowstate_track'),null,null,null,1,now(),newstate,null,null,w.requestid from ims_workflowrequest w, tmp_move_wfid_to_state tmp where w.requestid = tmp.wfid;

Drop table tmp_move_wfid_to_state;
