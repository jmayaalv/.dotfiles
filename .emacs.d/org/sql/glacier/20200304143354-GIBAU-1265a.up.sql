update ims_fund_details set pricing_freq =999 where fundid in (select fundid from ims_fund where code in ('75033', '75034', '75035', '75036', '75037', '75038', '75039', '75040', '75041'));
