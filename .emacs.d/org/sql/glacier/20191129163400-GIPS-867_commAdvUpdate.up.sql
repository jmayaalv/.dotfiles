-- !: 1

Update ims_acct_advisor_config set main_advisor=true where advisor_orgid=25871 and acctid=22676;

-- !: 2
Update ims_acct_advisor_config set main_advisor=false,archived=true,start_date=null,end_date=now() where advisor_orgid=17067 and acctid=22676;