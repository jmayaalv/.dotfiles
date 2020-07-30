-- this is the only account using comm optionid 3247
update ims_acct_type_commissionoption set typeid = 800 where optionid = 3247;

update ims_acct_rider set riderid = 764 where riderid = 796 and acctid = 18265; -- comm fundind OptionA
update ims_acct_rider set riderid = 776 where riderid = 805 and acctid = 18265; -- FeeCustom
update ims_acct_rider set riderid = 772 where riderid = 801 and acctid = 18265; -- IFAClean

update ims_plan set term_optionid = 820 where planid = 10586;

update trd_account set productid = 33 where code = '1000050086';
update ims_acct set typeid = 800 where acctid = 18265;

