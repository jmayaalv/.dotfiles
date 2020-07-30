update ims_omb_acct set irr_statusid = 3 where acctid  = 18415;

update doc_tag set archived = true where tagid IN (select tag.tagid from doc_tag tag, doc_doc doc where tag.tag = 'STATEMENT_CUSTOM' and tag.entity_id = 18415 and tag.entity_type = 'ACCOUNT' and doc.docid = tag.docid and name ilike '%valuationStmt:%' and not archived order by doc.cdate desc limit 1);