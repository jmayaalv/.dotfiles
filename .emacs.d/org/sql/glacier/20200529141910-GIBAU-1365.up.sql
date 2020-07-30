

--change issue date for account 1000009876
update ims_acct set issue_date='2012-06-15' where acctid=(select acctid from view_cont where acctnum='1000009876');

update ims_subacct set issue_date='2012-06-15' where acctid=(select acctid from view_cont where acctnum='1000009876');

update ims_plan set issue_date='2012-06-15' where subacctid=(select subacctid from view_cont where acctnum='1000009876');

update ims_contract set issue_date='2012-06-15' where planid=(select planid from view_cont where acctnum='1000009876');



--change issue date for account 1000037026
update ims_acct set issue_date='2016-04-25' where acctid=(select acctid from view_cont where acctnum='1000037026');

update ims_subacct set issue_date='2016-04-25' where acctid=(select acctid from view_cont where acctnum='1000037026');

update ims_plan set issue_date='2016-04-25' where subacctid=(select subacctid from view_cont where acctnum='1000037026');

update ims_contract set issue_date='2016-04-25' where planid=(select planid from view_cont where acctnum='1000037026');

