create temp table tmp_contract_total_withdrawals on commit drop as
select 17141 as acctid, 9036 as contractid, '2020-01-08' as start_date, now()::date as end_date, 305184 as total_withdrawals, true as today_;

update ims_omb_contracthist h set total_withdrawals = t.total_withdrawals from tmp_contract_total_withdrawals t where h.contractid = t.contractid and h.feed_date between t.start_date::date and t.end_date::date ;

update ims_omb_accthist h set total_withdrawals = t.total_withdrawals from tmp_contract_total_withdrawals t where h.acctid = t.acctid and h.feed_date between t.start_date::date and t.end_date::date;

update ims_omb_contract h set total_withdrawals = t.total_withdrawals from tmp_contract_total_withdrawals t where h.contractid = t.contractid and today_ ;

update ims_omb_acct h set total_withdrawals = t.total_withdrawals from tmp_contract_total_withdrawals t where h.acctid = t.acctid and today_;

drop table tmp_contract_total_withdrawals;

