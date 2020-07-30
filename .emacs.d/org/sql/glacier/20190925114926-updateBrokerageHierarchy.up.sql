--GIBAU-1014 - move brokerage Dave Pohl & Associates (Pty) Ltd - ORG ID 21608 to IFA Clean - Western Cape - ORG ID 21728
update rel_links set porgid=21728 where orgid=21608 and typeid=1;


--GIBAU-1008 - move brokerage (18319) Kirk Gibbons Financial Planning CC to (22559) IFA Retail - East London
update rel_links set porgid=22559 where orgid=18319 and typeid=1;

