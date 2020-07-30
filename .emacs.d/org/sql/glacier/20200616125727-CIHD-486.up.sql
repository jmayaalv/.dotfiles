-- :! 5
update trd_fund set settlement_days=1 where settlement_days is not null and settlement_days != 1  and isin is not null;
