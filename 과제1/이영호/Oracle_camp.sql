	
create table Camping_member(
	id varchar2(20) primary key,
	passwd1 varchar2(20) not null,
	name varchar2(30) not null,
	email varchar2(30)not null,
	tele varchar2(20)not null,
	hobby varchar2(90),
	job varchar2(20),
	age varchar2(15),
	info varchar2(3000)
);
	select * from Camping_member;
commit
