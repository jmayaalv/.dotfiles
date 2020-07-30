--:!2
insert into trd_instruction (instructionid ,code, order_code, common_id, transaction_code,     type,   action,      expected_date, contract_code, fundid, creation_date, dca, percentage,   flow)
values (nextval('seq_trd_instruction'), uuid_in(md5(random()::text || now()::text)::cstring), null, 'PRE045730',':T715',':dca',':sell-fund',now(),'I100013421',5917,now(),false,0.8333333333,':sell-fund'),
	   (nextval('seq_trd_instruction'), uuid_in(md5(random()::text || now()::text)::cstring), null, 'PRE045730',':T715',':dca',':sell-fund','2020-02-13 21:00:00','I100013421',5917,now(),false,1.0,':sell-fund');

