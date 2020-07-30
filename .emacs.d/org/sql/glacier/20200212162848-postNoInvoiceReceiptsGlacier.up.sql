-- there was a bug in the code and NO_INVOICE receipts were not being posted. This posts them all

create table newentry20200212 as
  select receiptid, posted_entryid
    from inv_receipt
   where receiptid in (select distinct r.receiptid from inv_receipt r, inv_invoice_entry ie, inv_invoice i
                        where r.receiptid = ie.paidby_receiptid and ie.invoiceid = i.invoiceid and i.invoicenum = 'NO_INVOICE');

update newentry20200212 set posted_entryid = nextval('seq_inv_account_entry');

insert into inv_account_entry
  select n.posted_entryid, r.acctid, r.cdate, r.cdate::date, r.cdate::date, null, null, null, null, 'Receipt',
         r.currencyid, r.amount*-1.0, null, null, null, null, 90
   from newentry20200212 n, inv_receipt r
   where n.receiptid = r.receiptid;

update inv_receipt r set status = 20, posted_entryid = n.posted_entryid
  from newentry20200212 n
where n.receiptid = r.receiptid
  and r.posted_entryid is null;

drop table newentry20200212;

