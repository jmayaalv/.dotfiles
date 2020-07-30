update ims_workflowrequest set state = 'REJECTED' where requestid=38334;
 
insert into ims_workflowstate_track (trackid, started_userid, started_on, started_state, requestid) 
   select nextval('seq_ims_workflowstate_track'), 1, now(), 'REJECTED', 38334; 
 
update ims_workflowstate_track set ended_userid = 1, ended_on = now(), ended_state = 'REJECTED' 
where ended_on is null and started_state = 'TRADING' and requestid = 38334;

