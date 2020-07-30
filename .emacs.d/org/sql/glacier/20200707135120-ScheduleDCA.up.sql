--:!6
insert into trd_instruction (instructionid,code,common_id,transaction_code,type,action,expected_date,contract_code,fundid,creation_date,dca,percentage,flow)
select 
nextval('seq_trd_instruction'), 
 uuid_in(md5(random()::text || now()::text)::cstring) code,
 uuid_in(md5(random()::text || now()::text)::cstring) commonid,
':T715',
':dca',
':sell-fund',
date '2020-07-07' + (6-b.a||' month')::interval expected_date,
'I100014405',
5916,
now(),
false,
round(1.0/b.a,2),
':sell-fund' 
from (select generate_series(1, 6) as a order by 1 desc) b;

