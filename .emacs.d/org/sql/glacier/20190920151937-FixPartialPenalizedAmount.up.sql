-- !: 1
update ims_omb_contract set partials_penalized = partials_penalized*0.0674440000 where contractid = 10726;
-- !: 1
update ims_omb_contracthist set partials_penalized = partials_penalized*0.0674440000 where contractid = 10726 and feed_date = '2019-09-19';

