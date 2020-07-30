-- do not apply CGT on fund mergers
-- this really means that the avg base tracker won't be touched
update ims_txncode set apply_cgt = false where txncode = 'T600';
update ims_txncode set apply_cgt = false where txncode = 'T601';
