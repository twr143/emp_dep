create table survey_log(uid int,action varchar(6), question_id int);
delete from survey_log;
insert into survey_log values(5,'show',285);
insert into survey_log values(5,'answer',285);
insert into survey_log values(5,'show',369);
insert into survey_log values(5,'skip',369);
insert into survey_log values(5,'show',379);
insert into survey_log values(5,'skip',379);
insert into survey_log values(9,'show',285);
insert into survey_log values(9,'answer',285);
insert into survey_log values(9,'show',369);
insert into survey_log values(9,'answer',369);
insert into survey_log values(9,'show',379);
insert into survey_log values(9,'skip',379);

--max answer rate
with grouping as (select action, question_id, count(uid) as cnt from survey_log where action <> 'show' group by action, question_id order by question_id)
,grouping_all_answ as (
    select question_id from grouping group by question_id having count(action) =1 and max(action) = 'answer'
    )
,grouping_none_answ as (
    select question_id from grouping group by question_id having count(action) =1 and max(action) = 'skip'
    )
,grouping_part_answ as (
    select g.question_id,g.cnt as cnt_a,g2.cnt as cnt_s from grouping g join grouping g2 on g.question_id=g2.question_id and g.action='answer' and g2.action ='skip'
)
select question_id, 1.0 as rate from grouping_all_answ union select question_id,0.0 from grouping_none_answ
union select question_id, cnt_a::real/(cnt_a::real+cnt_s::real) from grouping_part_answ;

select * from survey_log