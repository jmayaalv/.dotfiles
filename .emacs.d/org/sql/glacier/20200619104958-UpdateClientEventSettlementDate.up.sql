 update ims_acct_clientevent set settlement_date = effective_date where settlement_date is null and typeid in (10,20) and acctid =21989;
