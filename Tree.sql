Create table If Not Exists tree (id int, p_id int) ;
Truncate table tree;
insert into tree (id, p_id) values ('1', null) ;
insert into tree (id, p_id) values ('2', '1');
insert into tree (id, p_id) values ('3', '1');
insert into tree (id, p_id) values ('4', '2');
insert into tree (id, p_id) values ('5', '2');

--with p_ids as (select distinct p_id from tree where p_id<>null)
with types as (select id, 'Root' as Type from tree where p_id is null union
select p_id, 'Inner' as Type from tree where p_id in (select distinct p_id from tree where p_id is not null)
except (select id as p_id, 'Inner' as Type from tree where p_id is null) union
select id, 'Leaf' as Type from tree where p_id is not null and id not in (select distinct p_id from tree where p_id is not null))
select * from types order by 1