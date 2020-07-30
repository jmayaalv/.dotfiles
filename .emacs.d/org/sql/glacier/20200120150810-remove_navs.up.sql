-- :! 15
delete from prc_nav_fund where fundid in (select fundid from prc_fund where isin = 'IM00BFXBM425') and nav_date>='2019-12-13' ;
