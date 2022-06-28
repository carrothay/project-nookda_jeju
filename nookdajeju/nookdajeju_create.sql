-- member Table Create SQL

drop table member cascade constraints;

CREATE TABLE member
(
    mno          NUMBER           CONSTRAINT member_mno_pk PRIMARY KEY	NOT NULL, 
    memail       VARCHAR2(200)    NOT NULL, 
    mpw          VARCHAR2(100)    NOT NULL, 
    mlastname    VARCHAR2(40)     NOT NULL, 
    mfstname     VARCHAR2(60)     NOT NULL, 
    mphone       VARCHAR2(20)     NOT NULL, 
    nickname     VARCHAR2(30)     NOT NULL, 
    mhost        CHAR(1)          default 'n'	NOT NULL, 
    mregdate     DATE             NOT NULL, 
    del          CHAR(1)          default 'n'	NOT NULL
);

select * from member order by mno;


update member set mhost='p' where mno>7 and mno<13; 
insert into member values(0, 'admin', '1111', '어', '드민', '010-0000-0000', 'admin', 'y', sysdate, 'n');
insert into member values(1, 'user@nookda.com', '1111', '유', '저', '010-0000-0000', 'user', 'n', sysdate, 'n');
insert into member values(2, 'host1@nookda.com', '1111', '호', '스트1', '010-0000-0000', 'host1', 'y', sysdate, 'n'); 
insert into member values(3, 'host2@nookda.com', '1111', '호', '스트2', '010-0000-0000', 'host2', 'y', sysdate, 'n');


-- acm Table Create SQL

drop table acm cascade constraints;

CREATE TABLE acm
(   acmno           NUMBER            CONSTRAINT acm_acmno_pk PRIMARY KEY NOT NULL, 
    acm_name        VARCHAR2(100)     NOT NULL, 
    acm_loc         VARCHAR2(100)     NOT NULL, 
    acm_addr        VARCHAR2(200)     NOT NULL, 
    acm_phone       VARCHAR2(20)      NOT NULL, 
    acm_checkin     VARCHAR2(20)      NOT NULL, 
    acm_checkout    VARCHAR2(20)      NOT NULL, 
    acm_email       VARCHAR2(30)      NOT NULL, 
    acm_type        VARCHAR2(100)     NOT NULL, 
    acm_content     VARCHAR2(2000)    NOT NULL, 
    acm_price       NUMBER            NOT NULL, 
    latitude        BINARY_FLOAT      NOT NULL, 
    longtitude      BINARY_FLOAT      NOT NULL, 
    acm_regdate     DATE              NOT NULL, 
    acm_view        NUMBER            default '0' 		NOT NULL, 
    del             CHAR(1)           default 'n' 		NOT NULL, 
    mno             NUMBER            CONSTRAINT acm_mno_fk references member	 NOT NULL,
    acm_capa        NUMBER            NOT NULL, 
    acm_bedtype     VARCHAR2(100)     NOT NULL, 
    acm_size        VARCHAR2(30)      NULL
);

select * from acm order by acmno;

-- acmpic Table Create SQL

drop table acmpic	cascade constraints;

CREATE TABLE acmpic
(
    acm_picno      NUMBER           CONSTRAINT acmpic_acm_picno_pk PRIMARY KEY	NOT NULL, 
    acmno          NUMBER           CONSTRAINT acmpic_acmno_fk references acm NOT NULL, 
    acm_picname    VARCHAR2(100)    NOT NULL, 
    acm_picurl     VARCHAR2(200)    NULL
);

select * from acmpic order by acm_picno;


-- likes Table Create SQL

drop table likes cascade constraints;

CREATE TABLE likes
(
    lno      NUMBER    CONSTRAINT likes_lno_pk PRIMARY KEY	NOT NULL, 
    mno      NUMBER    CONSTRAINT likes_mno_fk references member		NOT NULL, 
    acmno    NUMBER    CONSTRAINT likes_acmno_fk references acm		NOT NULL
);

select * from likes order by lno;


-- booking Table Create SQL

drop table booking cascade constraints;

CREATE TABLE booking
(
    bookno        NUMBER            CONSTRAINT booking_bookno_pk PRIMARY KEY	NOT NULL, 
    mno           NUMBER            CONSTRAINT booking_mno_fk references member	NOT NULL, 
    acmno         NUMBER            CONSTRAINT booking_acmno_fk references acm	NOT NULL, 
    bookdate      VARCHAR2(60)      NOT NULL, 
    checkin       VARCHAR2(60)       NOT NULL, 
    checkout      VARCHAR2(60)       NOT NULL, 
    guestcnt      NUMBER            NOT NULL, 
    bookprice     NUMBER             NOT NULL, 
    payby         NVARCHAR2(60)      NOT NULL, 
    request       VARCHAR2(2000)     NULL, 
    bookstatus    CHAR(1)            default 'n'	NOT NULL 
);

select * from booking order by bookno;

-- review Table Create SQL

drop table review cascade constraints;

CREATE TABLE review
(
    rvno          NUMBER            CONSTRAINT review_rvno_pk PRIMARY KEY	NOT NULL, 
    star_rate     NUMBER            NOT NULL, 
    rv_content    VARCHAR2(2000)    NOT NULL, 
    rv_regdate    VARCHAR2(30)      NOT NULL, 
    acmno         NUMBER            CONSTRAINT review_acmno_fk references acm	 NOT NULL, 
    mno           NUMBER            CONSTRAINT review_mno_fk references member	 NOT NULL, 
    bookno          NUMBER            CONSTRAINT review_bookno_fk references booking	 	NOT NULL, 
    rvpic         VARCHAR2(500)     NULL, 
    del           CHAR(1)           default 'n'		NOT NULL
);

select * from review order by rvno;
delete from review where rvno=9;


-- faq Table Create SQL

drop table faq cascade constraints;

CREATE TABLE faq
(
    fno          	NUMBER            	CONSTRAINT faq_fno_pk PRIMARY KEY	NOT NULL, 
    fname     		VARCHAR2(100)     	NOT NULL, 
    faq_content   	VARCHAR2(2000)  	NOT NULL, 
    del           	CHAR(1)          	default 'n'		NOT NULL
);

select * from faq order by fno;

-- message Table Create SQL

drop table message cascade constraints;

create table message
(
	msgno			 NUMBER           CONSTRAINT message_msgno_pk PRIMARY KEY NOT NULL,
	mroom 			 NUMBER           NOT NULL,
	send_nick		 VARCHAR(30)         NOT NULL,
	recv_nick 		 VARCHAR(30)          NOT NULL,
	send_time 		 DATE          NOT NULL,
	read_time 		 DATE          NOT NULL,
	msg_text 		 VARCHAR(2000)          NOT NULL,
	read_chk 		 NUMBER           NOT NULL
);

alter table member add constraint member_nick_uq unique(nickname);

alter table message
add constraint send_nick_fk foreign key(send_nick)
references member(nickname);

alter table message
add constraint recv_nick_fk foreign key(recv_nick)
references member(nickname);

select * from message order by msgno;

-- 1:1 문의게시판 Table Create SQL
drop table askboard cascade constraints;

CREATE TABLE askboard
(
askno NUMBER CONSTRAINT askboard_askno_pk PRIMARY KEY NOT NULL,
mno NUMBER CONSTRAINT askboard_mno_fk REFERENCES member NOT NULL,
askname VARCHAR2(500) NOT NULL,
askcontent VARCHAR2(2000) NOT NULL,
ask_regdate VARCHAR2(30) NOT NULL,
readcount NUMBER default 0,
password VARCHAR2(12) not null,
ref NUMBER not null, --답변글끼리 그룹짓기
re_step NUMBER not null, --ref내 순서
re_level NUMBER not null, --들여쓰기
del CHAR(1) DEFAULT 'n' NOT NULL,
secret CHAR(1) default 'n',
re_name VARCHAR2(30)
);

select * from askboard order by askno;
