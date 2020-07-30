-- :!2
update ims_transfer_penalty set amount = round(amount,2) where penaltyid in (141942,140639);
