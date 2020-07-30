--:!7
delete from ims_acct_clientevent_fund where eventid  = 63003;

--:!1
insert into ims_acct_clientevent_fund (id   ,allocation   ,amount_gross ,eventid ,fundid,dca_term,inspecie_transfer) 
values (nextval('seq_ims_acct_clientevent_fund'), 100.0, 65382.4300000000, 63003, 17827, 6,false);
--:!1
insert into ims_acct_clientevent_fund (id   ,allocation,eventid ,fundid , dca_srcfundid,inspecie_transfer) 
values (nextval('seq_ims_acct_clientevent_fund'), 100.0, 63003, 19284, 17827,false);

