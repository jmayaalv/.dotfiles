-- :! 1
insert into rel_user_permission (userid, permissionid)
    select userid, 142 from rel_user where username = 'NathanN';