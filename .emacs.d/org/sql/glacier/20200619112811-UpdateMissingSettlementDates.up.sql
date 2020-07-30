update ims_acct_clientevent set settlement_date = effective_date where settlement_date is null and typeid in (10,20) and effective_date <='2019-08-31';
