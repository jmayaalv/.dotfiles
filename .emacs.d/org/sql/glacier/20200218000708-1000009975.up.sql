create temp table tmp_contract_total_withdrawals on commit drop as
select 16000 as acctid, 7906 as contractid, '2012-11-29' as start_date, '2014-06-17' as end_date, 47741.80 as total_withdrawals, false as today_ ;

insert into tmp_contract_total_withdrawals
select 16000 as acctid, 7906 as contractid, '2014-06-18' as start_date, '2015-05-20' as end_date, (47741.80+75095.20) as total_withdrawals, false as today_;

insert into tmp_contract_total_withdrawals
select 16000 as acctid, 7906 as contractid, '2015-05-21' as start_date, '2016-10-13' as end_date, (47741.80+75095.20+147908.25) as total_withdrawals, false as today_;

insert into tmp_contract_total_withdrawals
select 16000 as acctid, 7906 as contractid, '2016-10-14' as start_date, '2017-10-23' as end_date, (47741.80+75095.20+147908.25+161209.30) as total_withdrawals, false as today_;

insert into tmp_contract_total_withdrawals
select 16000 as acctid, 7906 as contractid, '2017-10-24' as start_date, '2018-11-19' as end_date, (47741.80+75095.20+147908.25+161209.30+159772.80) as total_withdrawals, false as today_;

insert into tmp_contract_total_withdrawals
select 16000 as acctid, 7906 as contractid, '2018-11-20' as start_date, '2019-02-21' as end_date, (47741.80+75095.20+147908.25+161209.30+159772.80+460661.50) as total_withdrawals, false as today_;

insert into tmp_contract_total_withdrawals
select 16000 as acctid, 7906 as contractid, '2019-02-22' as start_date, now()::date as end_date, (47741.80+75095.20+147908.25+161209.30+159772.80+460661.50+50008.00) as total_withdrawals, true as today_;

update ims_omb_contracthist h set total_withdrawals = t.total_withdrawals from tmp_contract_total_withdrawals t where h.contractid = t.contractid and h.feed_date between t.start_date::date and t.end_date::date ;

update ims_omb_accthist h set total_withdrawals = t.total_withdrawals from tmp_contract_total_withdrawals t where h.acctid = t.acctid and h.feed_date between t.start_date::date and t.end_date::date;


update ims_omb_contract h set total_withdrawals = t.total_withdrawals from tmp_contract_total_withdrawals t where h.contractid = t.contractid and today_ ;

update ims_omb_acct h set total_withdrawals = t.total_withdrawals from tmp_contract_total_withdrawals t where h.acctid = t.acctid and today_;


drop table tmp_contract_total_withdrawals;

