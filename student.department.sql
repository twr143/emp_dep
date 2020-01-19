CREATE TABLE IF NOT EXISTS student (student_id INT,student_name VARCHAR(45), gender VARCHAR(6), dept_id INT);
CREATE TABLE IF NOT EXISTS department (dept_id INT, dept_name VARCHAR(255));
Truncate table student;
insert into student (student_id, student_name, gender, dept_id) values ('1', 'Jack', 'M', '1');
insert into student (student_id, student_name, gender, dept_id) values ('2', 'Jane', 'F', '1');
insert into student (student_id, student_name, gender, dept_id) values ('3', 'Mark', 'M', '2');
Truncate table department;
insert into department (dept_id, dept_name) values ('1', 'Engineering');
insert into department (dept_id, dept_name) values ('2', 'Science');
insert into department (dept_id, dept_name) values ('3', 'Law');
select d.dept_name,coalesce(sd.cnt,0) as student_number from  department d left join (select dept_id, count(*) as cnt from student group by dept_id)
    sd on d.dept_id=sd.dept_id order by student_number desc, dept_name

select d.dept_name, coalesce(sd.cnt,0) as student_number from  department d