create database emp_dep --encoding='utf-8';;
create user emp_dep_user with password '123';;
grant all on database "emp_dep" to emp_dep_user;
psql -d bootzooka -U bz_user;
