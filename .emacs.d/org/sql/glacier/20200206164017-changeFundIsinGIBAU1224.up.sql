
--:!1
update ims_fund_details set isin = 'GL2GML' where isin = 'XS2058783437' and not exists (select 1 from ims_fund_details where isin = 'GL2GML');

--:!1
update ims_fund_details set isin = 'GLAGML' where isin = 'XS1994881552' and not exists (select 1 from ims_fund_details where isin = 'GLAGML');

--:!1
update ims_fund_details set isin = 'GLEACP' where isin = 'XS1901830767' and not exists (select 1 from ims_fund_details where isin = 'GLEACP');

--:!1
update ims_fund_details set isin = 'NFB2GG' where isin = 'XS2064946200' and not exists (select 1 from ims_fund_details where isin = 'NFB2GG');


--:!1
update trd_fund set isin = 'GL2GML' where isin = 'XS2058783437' and not exists (select 1 from trd_fund where isin = 'GL2GML');

--:!1
update trd_fund set isin = 'GLAGML' where isin = 'XS1994881552' and not exists (select 1 from trd_fund where isin = 'GLAGML');

--:!1
update trd_fund set isin = 'GLEACP' where isin = 'XS1901830767' and not exists (select 1 from trd_fund where isin = 'GLEACP');

--:!1
update trd_fund set isin = 'NFB2GG' where isin = 'XS2064946200' and not exists (select 1 from trd_fund where isin = 'NFB2GG');


--:!1
update prc_fund set isin = 'GL2GML' where isin = 'XS2058783437' and not exists (select 1 from prc_fund where isin = 'GL2GML');

--:!1
update prc_fund set isin = 'GLAGML' where isin = 'XS1994881552' and not exists (select 1 from prc_fund where isin = 'GLAGML');

--update prc_fund set isin = 'GLEACP' where isin = 'XS1901830767' and not exists (select 1 from prc_fund where isin = 'GLEACP');

 --:!1
update prc_fund set isin = 'NFB2GG' where isin = 'XS2064946200' and not exists (select 1 from prc_fund where isin = 'NFB2GG');