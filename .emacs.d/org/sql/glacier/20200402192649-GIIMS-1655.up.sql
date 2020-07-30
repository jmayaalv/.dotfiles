
--manual data fix till the code changes are deployed for ownership changes fixes
--as per tkt GIIMS-1655 for account 1000036564
--make the contacts json as null instead of empty

UPDATE ims_ownershipchangereq SET current_org_info =jsonb_set(current_org_info, '{contacts}'::text[], 'null'::jsonb) where reasonid=1 and current_org_info  is not null and acctid=16739;

