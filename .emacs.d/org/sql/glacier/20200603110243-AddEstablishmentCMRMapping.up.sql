insert into gl_cmr_map_txncodes
select nextval('seq_gl_cmr_map_txncodes'), txncode.txncode, act.typeid, b.orgid, '00070','110' from ims_txncode txncode, rel_branding_account_type act, rel_branding b
 where txncode.txncode in ('100') and b.brandingid = act.brandingid and act.typeid not in (801)
   and not exists (select 1 from gl_cmr_map_txncodes tmap where tmap.txncode in ('100') and tmap.accttypeid = act.typeid and b.orgid = tmap.orgid);

insert into gl_cmr_map_txncodes
select nextval('seq_gl_cmr_map_txncodes'), txncode.txncode, act.typeid, b.orgid, '00075','110' from ims_txncode txncode, rel_branding_account_type act, rel_branding b
 where txncode.txncode in ('100') and b.brandingid = act.brandingid and act.typeid in (801)
   and not exists (select 1 from gl_cmr_map_txncodes tmap where tmap.txncode in ('100') and tmap.accttypeid = act.typeid and b.orgid = tmap.orgid);

