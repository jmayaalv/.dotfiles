-- :! 1
update trd_instruction set expected_date='2020-07-20 21:00' where  contract_code='I100012701' and completion_date is null;
