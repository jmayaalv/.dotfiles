-- fix missing main advisors in alt_advisor
insert into ims_acct_alt_advisor (id, acctid, advisor_orgid, cdate, commission_percent, createdby_userid, main_advisor, mdate, modifiedby_userid, statusid, commission_payment_type) 
   select nextval('seq_ims_acct_alt_advisor'), 
          a.acctid, l.porgid, now(), 100, 1, true, now(), 0, 2, 'DIRECT' 
    from ims_acct a, rel_links l 
   where not exists (Select 1 from ims_acct_alt_advisor aa where aa.acctid = a.acctid and aa.statusid = 2 and aa.main_advisor = true)
    and a.statusid in (5,6) 
    and a.orgid = l.orgid and l.typeid = 1;
