update trd_fund set support_fees=false where support_fees=true and isin in (select isin from ims_fund_details where trade_statusid = 99) and isin is not null;
