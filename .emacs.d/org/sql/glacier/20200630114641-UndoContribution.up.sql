--:!2
delete from ims_acct_clientevent_fund where eventid = 68225;
--:!1
delete from ims_acct_clientevent where eventid = 68225;
--:!1
update ims_contribution set statusid = 0 where contributionid = 41703;
--:!1
update ims_premium set confirm_date =null, locked = false , confirmed_by =null where id = 12311;
--:!1
update ent_funds_allocation set archived = true where allocationid  = 10630;

