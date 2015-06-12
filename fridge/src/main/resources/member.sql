select * from member;
drop table member;

create table member(
	member_id varchar2(50) primary key,
	password varchar2(50) not null,
	nick varchar2(50) not null,
	name varchar2(50) not null,
	email varchar2(50) not null,
	gender number default 0,
	answer varchar2(50) not null,
	member_level number default 0,
	register_date date not null,
	love number default 0
)
drop table recipe 
create table recipe(
   recipe_no         number               primary key,
   title               varchar2(50)      not null,
   contents         varchar2(4000)      not null,
   post_date         date      not null,
   nick               varchar2(50)      not null,
   cooking_time   number               not null,
   good               number               default 0,
   bad               number               default 0,
   hits               number             default 0,
   member_id      varchar2(50)      not null,
   constraint fk_member_id foreign key(member_id) references member(member_id)
)
 select * from member where member_id='java'
insert into member(member_id, password, nick, name, email, gender, answer, member_level, register_date, love)
values('java', '1234', 'abcd', '한지민', 'java@gmail.com', 0, '파스타', 5, sysdate, 0 )

insert into member(member_id, password, nick, name, email, gender, answer, member_level, register_date, love)
values('dindony', '1234', '진썬', '김진선', 'jinsun@gmail.com', 2, '김치볶음밥', 5, sysdate, 0 )

select *from member;


update member set password='1234', name='한지민ㅇㅇㅇ', nick='abcd',gender=2, email='java@gamil.com',answer='파스타' where member_id='java';
   
   
   
   
   
   select password from member where member_id='aaaa' and name='aaaa' and email='aaa@aaa.com' and answer='aaa';
   select password from member where member_id='aaaa' and name='aaaa' and email='aaa@aaa.com' and answer='aaa';
   
   
   
   