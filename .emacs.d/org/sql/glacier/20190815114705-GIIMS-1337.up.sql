-- :! 1
update trd_order set details = '[{"percent": 0.75, "txn-type": "buy", "common-id": "CRSW09637", "fund-code": "1802058", "contract-code": "I100010400"}, {"percent": 0.25, "txn-type": "buy", "common-id": "CRSW09637", "fund-code": "1802059", "contract-code": "I100010400"} , {"percent": 1.0, "txn-type": "sell", "common-id": "CRSW09637", "fund-code": "1091001", "model-code": "1091001M", "contract-code": "I100010400"}]' where code = 'CRSW09637' ;