-- :! 445
delete from ims_commission_payment_report icpr where not exists (select 1 from ims_acct_commission_advisor iaca where icpr.reportid = iaca.reportid);