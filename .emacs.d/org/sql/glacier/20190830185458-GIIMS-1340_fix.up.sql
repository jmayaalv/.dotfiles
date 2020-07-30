update ent_pref set name = 'acct:eacDetailAsJSON_OLD_2019AUG' where name = 'acct:eacDetailAsJSON' and entity_type='ACCOUNT' and entity_id = (select acctid from ims_acct where acctnum = '1000009355');

update ent_pref set name = 'acct:eacDetailAsJSON_OLD_2019AUG' where name = 'acct:eacDetailAsJSON' and entity_type='ACCOUNT' and entity_id = (select acctid from ims_acct where acctnum = '1000010262');

update doc_tag set archived = true where entity_id = 14879 and entity_type='ORG' and tag='STATEMENTS_YEARLYPRINTED' and cdate > '2019-03-01' and archived=false;

update doc_tag set archived=false where entity_id=19373 and tagid=1109627 and entity_type='ORG' and tag='STATEMENTS_YEARLYPRINTED' and archived=true;