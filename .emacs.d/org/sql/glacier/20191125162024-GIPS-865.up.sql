-- :! 208
update trd_fund set support_fees=false where code in (select code from ims_fund where managerid=813);
