-- !: 1
update ims_investment_change_request i set advisorid = l.porgid from ims_transfer t, ims_acct a, rel_links l
 where t.transferid = i.transferid and t.acctid = a.acctid and l.orgid = a.orgid and i.advisorid <> l.porgid and i.changerequestid = 71874 and a.acctid = 17043;
