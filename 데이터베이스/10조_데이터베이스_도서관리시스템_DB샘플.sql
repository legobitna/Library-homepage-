use mysql;

create table Level(
levelId int not null primary key ,
name varchar(50),
possirentnum int,
possiPeriod int
);

insert into Level values(100,'student',7,14);
insert into Level values(200,'professor',10,30);
insert into Level values(300,'citizen',5,7);
insert into Level values(400,'empolyee',5,10);

create table Book ( 
bookId int not null primary key ,
title varchar(100),
author varchar(50),
publisher varchar(50),
reference boolean,
price int
);

insert into Book values(1000,'데이터베이스','오세종','단국',0,25000);
insert into Book values(2000,'JSP웹프로그래밍','김은옥','삼양',0,23000);
insert into Book values(3000,'청춘이란 무엇인가','헤르만 헤세','스타북스',0,12000);
insert into Book values(4000,'HTML','김선화','길벗',0,25000);
insert into Book values(5000,'나미야 잡화점의 기적','히가시노 게이고','현대문학',0,14800);

create table userInfo(
userID int not null primary key,
name varchar(50) not null,
id varchar(50),
password varchar(50),
administer boolean,
rentNum int,
levelID int,
foreign key(levelID) references level(levelID)
on delete CASCADE
on update CASCADE 
);

insert into userinfo values(0,'관리자','administer',0000,1,0,400);
insert into userinfo values(1,'김빛나','tallshe',1234,0,0,100);
insert into userinfo values(2,'이범희','tallhe',5678,0,0,200);
insert into userinfo values(3,'전은선','shortshe',9999,0,0,300);

create table Copy(
copyId int not null,
bookId int not null,
purchaseDate date,
rent boolean,
primary key(copyId),
foreign key(bookId) references Book(bookId) 
on delete restrict on update restrict );

insert into Copy values(1001,1000,'2012-03-01',0);
insert into Copy values(1002,1000,'2012-03-01',0);
insert into Copy values(1003,1000,'2012-03-01',0);

insert into Copy values(2001,2000,'2013-09-02',0);
insert into Copy values(2002,2000,'2013-09-02',0);
insert into Copy values(2003,2000,'2013-09-02',0);

insert into Copy values(3001,3000,'2014-06-26',0);
insert into Copy values(3002,3000,'2014-06-27',0);
insert into Copy values(3003,3000,'2014-06-28',0);

insert into Copy values(4001,4000,'2015-03-02',0);
insert into Copy values(4002,4000,'2015-03-02',0);
insert into Copy values(4003,4000,'2015-03-02',0);

insert into Copy values(5001,5000,'2016-09-01',0);
insert into Copy values(5002,5000,'2016-09-01',0);
insert into Copy values(5003,5000,'2016-09-01',0);


create table Lend(
lendId int not null auto_increment primary key,
userID int, 
copyId int,
dueDate datetime,
returnDate datetime default now(),
foreign key(userID) references UserINFO(userID),
foreign key(copyId) references Copy(copyId));

create table reserveBook(
rsvid int not null auto_increment primary key,
copyId int not null,
userID int not null,
rsvDate date,
foreign key(copyId) references copy(copyId),
foreign key(userID) references userINFO(userID)
);
