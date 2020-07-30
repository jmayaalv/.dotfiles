-- :! 1
insert into rpt_lookup (id, code, key, value) values (nextval('seq_rpt_lookup'),'ims_acct_typeid',804,'Offshore Investment Plan') on conflict on constraint rpt_lookup_code_key_unq do nothing;