create table candidate(id int,Name varchar(2));

insert into candidate values (1,'A');
insert into candidate values (2,'B');
insert into candidate values (3,'C');
insert into candidate values (4,'D');
insert into candidate values (5,'E');

CREATE TABLE Vote (id int,CandidateId int);
insert into Vote values(1,2);
insert into Vote values(2,4);
insert into Vote values(3,3);
insert into Vote values(4,2);
insert into Vote values(5,5);



with voteCnt as (select CandidateId as cid, count(CandidateId) as cnt from vote group by cid order by cnt desc limit 1)
select c.name,v.cnt from candidate c join voteCnt v on c.id=v.cid