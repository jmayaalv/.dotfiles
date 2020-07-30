
insert into rel_user_permission (userid, permissionid) select 370331, 142 where not exists
(select 1 from rel_user_permission where userid = 370331 and permissionid = 142);

insert into rel_user_permission (userid, permissionid) select 370331, 143 where not exists
(select 1 from rel_user_permission where userid = 370331 and permissionid = 143);