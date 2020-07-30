-- :! 7012
update ims.ims_acct_commission set feed_date = '2020-06-05' where type = 'TRAIL' and earned_date between '2020-05-06' and '2020-06-05';

-- :! 7213
update ims.ims_acct_commission_advisor set feed_date = '2020-06-05' where commid in (select iac.commid from ims.ims_acct_commission iac where iac.type = 'TRAIL' and iac.earned_date between '2020-05-06' and '2020-06-05' and iac.feed_date = '2020-06-05');