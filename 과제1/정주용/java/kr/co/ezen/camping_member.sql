create table camping_member (
	id varchar2(20) primary key,
	passwd1 varchar2(20) not null,
	name varchar2(30) not null, 
	email varchar2(30) not null,
	phone varchar2(30) not null,
	hobby varchar2(30),
	job varchar2(20),
	age varchar2(10), 
	info varchar2(3000)
);

drop table camping_member;

select * from CAMPING_MEMBER;

select * from tab;

commit