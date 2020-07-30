-- !: 6
update trd_fund set calendar_code='UK&LUX4' where isin  in (select isin from trd_fund where code in ('1012037', '1012021', '1012047'));
