--:!7
update trd_fund e set support_fees = false where e.name ilike '%quantum%' and e.type =':discretionary' and e.support_fees;

