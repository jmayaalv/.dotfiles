-- :! 2
update trd_instruction set units = amount, failure_reason=null, failed_on=null where common_id= 'CRSW010219' and completion_date is null ;