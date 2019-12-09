prompt PL/SQL Developer import file
prompt Created on 2011年3月10日 星期四 by Administrator
set feedback off
set define off
prompt Creating BONUS...
create table BONUS
(
  ENAME VARCHAR2(10),
  JOB   VARCHAR2(9),
  SAL   NUMBER,
  COMM  NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CARDSTATE...
create table CARDSTATE
(
  STATEID   NUMBER not null,
  STATENAME VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CARDSTATE
  add constraint PK_STATE_ID primary key (STATEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CARDTYPE...
create table CARDTYPE
(
  TYPEID    NUMBER not null,
  TYPENAME  VARCHAR2(20),
  SELLMONEY NUMBER,
  TIME      NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CARDTYPE
  add constraint PK_TYPE_ID primary key (TYPEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating MEMBERGROUP...
create table MEMBERGROUP
(
  GROUPID   NUMBER not null,
  GROUPNAME VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MEMBERGROUP
  add constraint PK_PID primary key (GROUPID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating MEMBER...
create table MEMBER
(
  MNO         VARCHAR2(20) not null,
  MNAME       VARCHAR2(20),
  ID          VARCHAR2(18),
  EMAIL       VARCHAR2(50),
  MGROUP      NUMBER,
  SEX         VARCHAR2(4),
  BIRTHDAY    DATE,
  QQ          VARCHAR2(20),
  TELPHONE    VARCHAR2(20),
  PHONE       VARCHAR2(20),
  ADDRESS     VARCHAR2(100),
  DESCRIPTION VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MEMBER
  add constraint PK_MNO primary key (MNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MEMBER
  add constraint FK_GROUPID foreign key (MGROUP)
  references MEMBERGROUP (GROUPID);

prompt Creating CARDINFO...
create table CARDINFO
(
  CARDID    VARCHAR2(20) not null,
  CARDTYPE  NUMBER not null,
  CARDSTATE NUMBER not null,
  MONEY     NUMBER,
  STARTDATE DATE,
  OVERDATE  DATE,
  CONTENT   VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CARDINFO
  add constraint PK_CARD_IDD primary key (CARDID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CARDINFO
  add constraint FK_CARD_IDD foreign key (CARDID)
  references MEMBER (MNO);
alter table CARDINFO
  add constraint FK_STATE_IDD foreign key (CARDSTATE)
  references CARDSTATE (STATEID);
alter table CARDINFO
  add constraint FK_TYPE_IDD foreign key (CARDTYPE)
  references CARDTYPE (TYPEID);

prompt Creating COACH_TYPE...
create table COACH_TYPE
(
  TID   NUMBER not null,
  TNAME VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table COACH_TYPE
  add constraint PK_TID primary key (TID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating COACHINFO...
create table COACHINFO
(
  CNO         VARCHAR2(10) not null,
  CNAME       VARCHAR2(20),
  CID         VARCHAR2(20),
  SEX         VARCHAR2(10),
  BIRTHDAY    DATE,
  ADDRESS     VARCHAR2(100),
  QQ          VARCHAR2(15),
  EMAIL       VARCHAR2(20),
  TYPE        NUMBER,
  TEL         VARCHAR2(20),
  DESCRIPTION VARCHAR2(200),
  PHOTOFILE   VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table COACHINFO
  add constraint PK_COACH_ID primary key (CNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table COACHINFO
  add constraint FK_TYPE_ID foreign key (TYPE)
  references COACH_TYPE (TID);

prompt Creating COURSE...
create table COURSE
(
  COURSEID   NUMBER not null,
  COURSENAME VARCHAR2(20),
  ROOMNAME   VARCHAR2(20),
  COACHNAME  VARCHAR2(10),
  CARPNUMBER NUMBER,
  DEVICENAME VARCHAR2(20),
  BENIFITS   VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table COURSE
  add constraint PK_COURSEID primary key (COURSEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating DEPT...
create table DEPT
(
  DEPTNO NUMBER(2) not null,
  DNAME  VARCHAR2(14),
  LOC    VARCHAR2(13)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DEPT
  add constraint PK_DEPT primary key (DEPTNO)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ROOM...
create table ROOM
(
  ROOMID        NUMBER not null,
  ROOMNAME      VARCHAR2(20),
  ACCOUNTNUMBER NUMBER,
  ROOMPHOTO     VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add constraint PK_ROOMID primary key (ROOMID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating DEVICEINFO...
create table DEVICEINFO
(
  DEVICEID     NUMBER not null,
  DEVICENAME   VARCHAR2(20),
  PRINCIPAL    VARCHAR2(10),
  ROOM         NUMBER not null,
  ENTRANCETIME DATE,
  USETIME      DATE,
  BRIEF        VARCHAR2(200)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DEVICEINFO
  add constraint PK_DEVICEID primary key (DEVICEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DEVICEINFO
  add constraint FK_ROOMID foreign key (ROOM)
  references ROOM (ROOMID);

prompt Creating USERTYPE...
create table USERTYPE
(
  TYPEID   NUMBER not null,
  TYPENAME VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERTYPE
  add constraint PK_TYPEID primary key (TYPEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating EMAIL...
create table EMAIL
(
  E_ID          NUMBER not null,
  SEND_NAME     NVARCHAR2(20),
  SEND_USERGROP NUMBER,
  E_TITLE       NVARCHAR2(100),
  E_CONTEXT     NVARCHAR2(1000),
  SEND_DATE     DATE,
  IS_READ       NUMBER,
  USERID        VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EMAIL
  add constraint E_PK primary key (E_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EMAIL
  add constraint F_FK foreign key (SEND_USERGROP)
  references USERTYPE (TYPEID);

prompt Creating EMP...
create table EMP
(
  EMPNO    NUMBER(4) not null,
  ENAME    VARCHAR2(10),
  JOB      VARCHAR2(9),
  MGR      NUMBER(4),
  HIREDATE DATE,
  SAL      NUMBER(7,2),
  COMM     NUMBER(7,2),
  DEPTNO   NUMBER(2)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EMP
  add constraint PK_EMP primary key (EMPNO)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EMP
  add constraint FK_DEPTNO foreign key (DEPTNO)
  references DEPT (DEPTNO);

prompt Creating OPERATEDATE...
create table OPERATEDATE
(
  OPE_ID       NUMBER not null,
  OPE_NAME     VARCHAR2(20),
  FUNCTION     VARCHAR2(50),
  OPE_DATE     DATE,
  SPECIFIC_OPE VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPERATEDATE
  add constraint PK_OPEID primary key (OPE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PURCHASETRAINER...
create table PURCHASETRAINER
(
  CARDID     VARCHAR2(20) not null,
  CARDTYPE   NUMBER,
  MNAME      VARCHAR2(20),
  COURSENAME VARCHAR2(20),
  MONEY      NUMBER,
  COACHNAME  VARCHAR2(20),
  CONTENT    VARCHAR2(100)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PURCHASETRAINER
  add constraint PK_CARD_IDDD primary key (CARDID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SALGRADE...
create table SALGRADE
(
  GRADE NUMBER,
  LOSAL NUMBER,
  HISAL NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating USERS...
create table USERS
(
  USERID        NUMBER not null,
  USERNAME      VARCHAR2(20),
  PASSWORD      VARCHAR2(50),
  REGISTER_TIME DATE,
  REALNAME      VARCHAR2(20),
  SEX           VARCHAR2(4),
  BIRTHDAY      DATE,
  QQ            VARCHAR2(20),
  TEL           VARCHAR2(20),
  ADDRESS       VARCHAR2(50),
  TYPEID        NUMBER,
  EMAIL         VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint PK_USERID primary key (USERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint FK_TYPEID foreign key (TYPEID)
  references USERTYPE (TYPEID);

prompt Creating VISITORINFO...
create table VISITORINFO
(
  CARDID    VARCHAR2(20) not null,
  NAME      VARCHAR2(20),
  TEL       VARCHAR2(20),
  ADDRESS   VARCHAR2(100),
  STARTTIME DATE,
  OVERTIME  DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table VISITORINFO
  add constraint PK_CID primary key (CARDID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating VISITORORDER...
create table VISITORORDER
(
  ORDERID   NUMBER not null,
  ORDERNAME VARCHAR2(20),
  TIME      DATE,
  TEL       VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table VISITORORDER
  add constraint PK_ORDERID primary key (ORDERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for BONUS...
alter table BONUS disable all triggers;
prompt Disabling triggers for CARDSTATE...
alter table CARDSTATE disable all triggers;
prompt Disabling triggers for CARDTYPE...
alter table CARDTYPE disable all triggers;
prompt Disabling triggers for MEMBERGROUP...
alter table MEMBERGROUP disable all triggers;
prompt Disabling triggers for MEMBER...
alter table MEMBER disable all triggers;
prompt Disabling triggers for CARDINFO...
alter table CARDINFO disable all triggers;
prompt Disabling triggers for COACH_TYPE...
alter table COACH_TYPE disable all triggers;
prompt Disabling triggers for COACHINFO...
alter table COACHINFO disable all triggers;
prompt Disabling triggers for COURSE...
alter table COURSE disable all triggers;
prompt Disabling triggers for DEPT...
alter table DEPT disable all triggers;
prompt Disabling triggers for ROOM...
alter table ROOM disable all triggers;
prompt Disabling triggers for DEVICEINFO...
alter table DEVICEINFO disable all triggers;
prompt Disabling triggers for USERTYPE...
alter table USERTYPE disable all triggers;
prompt Disabling triggers for EMAIL...
alter table EMAIL disable all triggers;
prompt Disabling triggers for EMP...
alter table EMP disable all triggers;
prompt Disabling triggers for OPERATEDATE...
alter table OPERATEDATE disable all triggers;
prompt Disabling triggers for PURCHASETRAINER...
alter table PURCHASETRAINER disable all triggers;
prompt Disabling triggers for SALGRADE...
alter table SALGRADE disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for VISITORINFO...
alter table VISITORINFO disable all triggers;
prompt Disabling triggers for VISITORORDER...
alter table VISITORORDER disable all triggers;
prompt Disabling foreign key constraints for MEMBER...
alter table MEMBER disable constraint FK_GROUPID;
prompt Disabling foreign key constraints for CARDINFO...
alter table CARDINFO disable constraint FK_CARD_IDD;
alter table CARDINFO disable constraint FK_STATE_IDD;
alter table CARDINFO disable constraint FK_TYPE_IDD;
prompt Disabling foreign key constraints for COACHINFO...
alter table COACHINFO disable constraint FK_TYPE_ID;
prompt Disabling foreign key constraints for DEVICEINFO...
alter table DEVICEINFO disable constraint FK_ROOMID;
prompt Disabling foreign key constraints for EMAIL...
alter table EMAIL disable constraint F_FK;
prompt Disabling foreign key constraints for EMP...
alter table EMP disable constraint FK_DEPTNO;
prompt Disabling foreign key constraints for USERS...
alter table USERS disable constraint FK_TYPEID;
prompt Deleting VISITORORDER...
delete from VISITORORDER;
commit;
prompt Deleting VISITORINFO...
delete from VISITORINFO;
commit;
prompt Deleting USERS...
delete from USERS;
commit;
prompt Deleting SALGRADE...
delete from SALGRADE;
commit;
prompt Deleting PURCHASETRAINER...
delete from PURCHASETRAINER;
commit;
prompt Deleting OPERATEDATE...
delete from OPERATEDATE;
commit;
prompt Deleting EMP...
delete from EMP;
commit;
prompt Deleting EMAIL...
delete from EMAIL;
commit;
prompt Deleting USERTYPE...
delete from USERTYPE;
commit;
prompt Deleting DEVICEINFO...
delete from DEVICEINFO;
commit;
prompt Deleting ROOM...
delete from ROOM;
commit;
prompt Deleting DEPT...
delete from DEPT;
commit;
prompt Deleting COURSE...
delete from COURSE;
commit;
prompt Deleting COACHINFO...
delete from COACHINFO;
commit;
prompt Deleting COACH_TYPE...
delete from COACH_TYPE;
commit;
prompt Deleting CARDINFO...
delete from CARDINFO;
commit;
prompt Deleting MEMBER...
delete from MEMBER;
commit;
prompt Deleting MEMBERGROUP...
delete from MEMBERGROUP;
commit;
prompt Deleting CARDTYPE...
delete from CARDTYPE;
commit;
prompt Deleting CARDSTATE...
delete from CARDSTATE;
commit;
prompt Deleting BONUS...
delete from BONUS;
commit;
prompt Loading BONUS...
prompt Table is empty
prompt Loading CARDSTATE...
insert into CARDSTATE (STATEID, STATENAME)
values (1, '激活');
insert into CARDSTATE (STATEID, STATENAME)
values (2, '锁定');
commit;
prompt 2 records loaded
prompt Loading CARDTYPE...
insert into CARDTYPE (TYPEID, TYPENAME, SELLMONEY, TIME)
values (1, '年卡', 3000, 100);
insert into CARDTYPE (TYPEID, TYPENAME, SELLMONEY, TIME)
values (2, '半年卡', 2000, 50);
insert into CARDTYPE (TYPEID, TYPENAME, SELLMONEY, TIME)
values (3, '季卡', 1000, 30);
insert into CARDTYPE (TYPEID, TYPENAME, SELLMONEY, TIME)
values (4, '月卡', 500, 10);
insert into CARDTYPE (TYPEID, TYPENAME, SELLMONEY, TIME)
values (5, '次卡', 30, 1);
commit;
prompt 5 records loaded
prompt Loading MEMBERGROUP...
insert into MEMBERGROUP (GROUPID, GROUPNAME)
values (1, '普通会员');
insert into MEMBERGROUP (GROUPID, GROUPNAME)
values (2, 'VIP');
commit;
prompt 2 records loaded
prompt Loading MEMBER...
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e002', '李四', '430522198802147816', null, 2, null, to_date('03-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e0056', '王五', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e007', '海洋', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e006', '飞飞', '430522198802147816', null, 2, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e008', 'aaa', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e009', 'bbb', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e010', 'ccc', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e011', 'ddd', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e012', 'eee', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e013', 'fff', '430522198802147816', null, 2, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e014', 'ggg', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e015', 'hhh', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e016', 'iii', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e017', 'jjj', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e018', 'kkk', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e019', 'lll', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e020', 'mmm', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e021', 'nnn', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e022', 'ooo', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e023', 'ppp', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e024', 'qqq', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
insert into MEMBER (MNO, MNAME, ID, EMAIL, MGROUP, SEX, BIRTHDAY, QQ, TELPHONE, PHONE, ADDRESS, DESCRIPTION)
values ('e025', 'rrr', '430522198802147816', null, 1, null, to_date('09-03-2011', 'dd-mm-yyyy'), null, null, null, null, null);
commit;
prompt 22 records loaded
prompt Loading CARDINFO...
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e0056', 3, 2, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-06-2012', 'dd-mm-yyyy'), '季卡');
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e007', 4, 1, 500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-04-2012', 'dd-mm-yyyy'), '月卡');
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e002', 2, 1, 2600, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-09-2012', 'dd-mm-yyyy'), '半年卡');
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e006', 1, 1, 1900, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-03-2013', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e009', 1, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-03-2013', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e008', 1, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-03-2013', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e010', 1, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-03-2013', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e011', 2, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-09-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e012', 2, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-09-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e013', 2, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-09-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e014', 2, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-09-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e015', 3, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-06-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e016', 3, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-06-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e017', 3, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-06-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e018', 3, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-06-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e019', 4, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-04-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e020', 4, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-04-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e021', 4, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-04-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e022', 4, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-04-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e023', 3, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-06-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e024', 5, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-03-2012', 'dd-mm-yyyy'), null);
insert into CARDINFO (CARDID, CARDTYPE, CARDSTATE, MONEY, STARTDATE, OVERDATE, CONTENT)
values ('e025', 5, 1, 1500, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-03-2012', 'dd-mm-yyyy'), null);
commit;
prompt 22 records loaded
prompt Loading COACH_TYPE...
insert into COACH_TYPE (TID, TNAME)
values (1, '健身教练');
insert into COACH_TYPE (TID, TNAME)
values (2, '私人教练');
commit;
prompt 2 records loaded
prompt Loading COACHINFO...
insert into COACHINFO (CNO, CNAME, CID, SEX, BIRTHDAY, ADDRESS, QQ, EMAIL, TYPE, TEL, DESCRIPTION, PHOTOFILE)
values ('eb012', '赵承俊', '430522198802147845', '男', to_date('07-03-2012', 'dd-mm-yyyy'), '湖南长沙', '359080412', '1099040379@qq.com', 1, '13973906869', null, 'coach/zhaocheng.jpg');
insert into COACHINFO (CNO, CNAME, CID, SEX, BIRTHDAY, ADDRESS, QQ, EMAIL, TYPE, TEL, DESCRIPTION, PHOTOFILE)
values ('eb013', '赵承俊', '430522198802147845', '男', to_date('07-03-2012', 'dd-mm-yyyy'), '湖南长沙', '359080412', '1099040379@qq.com', 1, '13973906869', null, 'coach/zhaocheng.jpg');
insert into COACHINFO (CNO, CNAME, CID, SEX, BIRTHDAY, ADDRESS, QQ, EMAIL, TYPE, TEL, DESCRIPTION, PHOTOFILE)
values ('eb001', '小月月', '430521198801125689', '女', to_date('24-12-1989', 'dd-mm-yyyy'), '湖南长沙', '359080412', '359080419@qq.com', 2, '13973906869', '史上最美健身女教练', null);
insert into COACHINFO (CNO, CNAME, CID, SEX, BIRTHDAY, ADDRESS, QQ, EMAIL, TYPE, TEL, DESCRIPTION, PHOTOFILE)
values ('eb002', '小甜甜', '400522198802147845', '女', to_date('30-12-1988', 'dd-mm-yyyy'), '湖南长沙', '359080412', '359080419@qq.com', 2, '13973906869', '绝望主妇', null);
insert into COACHINFO (CNO, CNAME, CID, SEX, BIRTHDAY, ADDRESS, QQ, EMAIL, TYPE, TEL, DESCRIPTION, PHOTOFILE)
values ('eb003', '小甜甜', '400522198802147845', '女', to_date('30-12-1988', 'dd-mm-yyyy'), '湖南长沙', '359080412', '359080419@qq.com', 2, '13973906869', null, null);
insert into COACHINFO (CNO, CNAME, CID, SEX, BIRTHDAY, ADDRESS, QQ, EMAIL, TYPE, TEL, DESCRIPTION, PHOTOFILE)
values ('ee004', 'affa', '430522198802147845', '女', to_date('07-03-2012', 'dd-mm-yyyy'), 'fafa', '359080412', '1099040379@qq.com', 1, '13973906869', 'fafaffa', 'E:\JAVA\jdk150.ZH_cn.chm');
insert into COACHINFO (CNO, CNAME, CID, SEX, BIRTHDAY, ADDRESS, QQ, EMAIL, TYPE, TEL, DESCRIPTION, PHOTOFILE)
values ('ee001', 'fafa', '430522198802147845', '女', to_date('07-03-2012', 'dd-mm-yyyy'), 'fafaf', 'fafafaf', '1099040379@qq.com', 1, '1533696726', 'sgggsgsg', 'C:\Documents and Settings\Administrator\桌面\jsf.sql');
insert into COACHINFO (CNO, CNAME, CID, SEX, BIRTHDAY, ADDRESS, QQ, EMAIL, TYPE, TEL, DESCRIPTION, PHOTOFILE)
values ('a005', 'fafaf', '430522198802147845', '女', to_date('09-03-2012', 'dd-mm-yyyy'), '湖南长沙', '359080416', '693589670@qq.com', 1, '15173814187', 'fafffafa', 'coach/jdk150.ZH_cn.chm');
insert into COACHINFO (CNO, CNAME, CID, SEX, BIRTHDAY, ADDRESS, QQ, EMAIL, TYPE, TEL, DESCRIPTION, PHOTOFILE)
values ('e050', 'fafaf', '430522198802147816', 'false', to_date('10-03-2011', 'dd-mm-yyyy'), 'fafafa', 'fafafa', 'fafafaf@qq.com', 1, '151738147187', 'aafafafafafafafaqf', 'coach/');
commit;
prompt 9 records loaded
prompt Loading COURSE...
insert into COURSE (COURSEID, COURSENAME, ROOMNAME, COACHNAME, CARPNUMBER, DEVICENAME, BENIFITS)
values (1, '瑜伽', '瑜伽室', 'aaa', 30, '瑜伽垫', '瑜伽垫');
insert into COURSE (COURSEID, COURSENAME, ROOMNAME, COACHNAME, CARPNUMBER, DEVICENAME, BENIFITS)
values (2, '有氧搏击', '有氧搏击室', 'aaa', 30, '搏击拳套', '搏击拳套');
insert into COURSE (COURSEID, COURSENAME, ROOMNAME, COACHNAME, CARPNUMBER, DEVICENAME, BENIFITS)
values (3, '肚皮舞', '肚皮舞室', 'aaa', 30, '肚皮舞', '肚皮舞');
insert into COURSE (COURSEID, COURSENAME, ROOMNAME, COACHNAME, CARPNUMBER, DEVICENAME, BENIFITS)
values (4, '动感单车', '4动感单车', 'aaa', 30, '动感单车', '动感单车');
insert into COURSE (COURSEID, COURSENAME, ROOMNAME, COACHNAME, CARPNUMBER, DEVICENAME, BENIFITS)
values (5, '哑铃', '哑铃室', 'aaa', 30, '哑铃杆', '哑铃杆');
commit;
prompt 5 records loaded
prompt Loading DEPT...
insert into DEPT (DEPTNO, DNAME, LOC)
values (10, 'ACCOUNTING', 'NEW YORK');
insert into DEPT (DEPTNO, DNAME, LOC)
values (20, 'RESEARCH', 'DALLAS');
insert into DEPT (DEPTNO, DNAME, LOC)
values (30, 'SALES', 'CHICAGO');
insert into DEPT (DEPTNO, DNAME, LOC)
values (40, 'OPERATIONS', 'BOSTON');
commit;
prompt 4 records loaded
prompt Loading ROOM...
insert into ROOM (ROOMID, ROOMNAME, ACCOUNTNUMBER, ROOMPHOTO)
values (7, '游泳室', 20, 'device/device6.jpg');
insert into ROOM (ROOMID, ROOMNAME, ACCOUNTNUMBER, ROOMPHOTO)
values (1, '瑜伽室', 20, 'device/device1.jpg');
insert into ROOM (ROOMID, ROOMNAME, ACCOUNTNUMBER, ROOMPHOTO)
values (2, '肚皮舞室', 20, 'device/device2.jpg');
insert into ROOM (ROOMID, ROOMNAME, ACCOUNTNUMBER, ROOMPHOTO)
values (3, '有氧搏击', 15, 'device/device3.jpg');
insert into ROOM (ROOMID, ROOMNAME, ACCOUNTNUMBER, ROOMPHOTO)
values (4, '动感单车', 10, 'device/device4.jpg');
insert into ROOM (ROOMID, ROOMNAME, ACCOUNTNUMBER, ROOMPHOTO)
values (5, '哑铃', 20, 'device/device5.jpg');
commit;
prompt 6 records loaded
prompt Loading DEVICEINFO...
insert into DEVICEINFO (DEVICEID, DEVICENAME, PRINCIPAL, ROOM, ENTRANCETIME, USETIME, BRIEF)
values (1002, '登山机', 'eb001', 3, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-03-2011', 'dd-mm-yyyy'), '锻炼身材');
insert into DEVICEINFO (DEVICEID, DEVICENAME, PRINCIPAL, ROOM, ENTRANCETIME, USETIME, BRIEF)
values (1003, '健身车', 'eb001', 4, to_date('02-03-2012', 'dd-mm-yyyy'), to_date('01-03-2011', 'dd-mm-yyyy'), '锻炼身材');
insert into DEVICEINFO (DEVICEID, DEVICENAME, PRINCIPAL, ROOM, ENTRANCETIME, USETIME, BRIEF)
values (1004, '划船机', 'eb001', 2, to_date('16-03-2011', 'dd-mm-yyyy'), to_date('01-03-2011', 'dd-mm-yyyy'), '锻炼身材');
insert into DEVICEINFO (DEVICEID, DEVICENAME, PRINCIPAL, ROOM, ENTRANCETIME, USETIME, BRIEF)
values (1006, '杠哑铃', 'eb001', 3, to_date('06-03-2012', 'dd-mm-yyyy'), to_date('01-03-2011', 'dd-mm-yyyy'), '锻炼身材');
commit;
prompt 4 records loaded
prompt Loading USERTYPE...
insert into USERTYPE (TYPEID, TYPENAME)
values (0, '全部用户');
insert into USERTYPE (TYPEID, TYPENAME)
values (1, '营业员');
insert into USERTYPE (TYPEID, TYPENAME)
values (2, '管理员');
commit;
prompt 3 records loaded
prompt Loading EMAIL...
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2000, 'manager', 1, 'fafafaf', 'afafafa', to_date('10-03-2011 10:31:55', 'dd-mm-yyyy hh24:mi:ss'), 0, '1002');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2001, 'manager', 1, 'fafafaf', 'afafafa', to_date('10-03-2011 10:31:55', 'dd-mm-yyyy hh24:mi:ss'), 0, '1003');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2002, 'manager', 1, 'fafafaf', 'afafafa', to_date('10-03-2011 10:31:55', 'dd-mm-yyyy hh24:mi:ss'), 0, '1005');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2003, 'manager', 1, 'fafafaf', 'afafafa', to_date('10-03-2011 10:31:55', 'dd-mm-yyyy hh24:mi:ss'), 0, '1006');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2004, 'manager', 1, 'fafafaf', 'afafafa', to_date('10-03-2011 10:31:55', 'dd-mm-yyyy hh24:mi:ss'), 0, '1007');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2005, 'manager', 1, 'fafafaf', 'afafafa', to_date('10-03-2011 10:31:55', 'dd-mm-yyyy hh24:mi:ss'), 0, '1008');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2006, 'manager', 1, 'fafafaf', 'afafafa', to_date('10-03-2011 10:31:55', 'dd-mm-yyyy hh24:mi:ss'), 0, '1011');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2007, 'manager', 1, 'fafafaf', 'afafafa', to_date('10-03-2011 10:31:55', 'dd-mm-yyyy hh24:mi:ss'), 0, '1012');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2008, 'manager', 1, 'fafafaf', 'afafafa', to_date('10-03-2011 10:31:55', 'dd-mm-yyyy hh24:mi:ss'), 0, '1004');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2009, 'manager', 1, 'fafafaf', 'afafafa', to_date('10-03-2011 10:31:55', 'dd-mm-yyyy hh24:mi:ss'), 1, '1000');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2010, 'manager', 2, 'fafaf', 'fafafaf', to_date('10-03-2011 10:36:14', 'dd-mm-yyyy hh24:mi:ss'), 0, '1002');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2011, 'manager', 2, 'fafaf', 'fafafaf', to_date('10-03-2011 10:36:14', 'dd-mm-yyyy hh24:mi:ss'), 0, '1003');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2012, 'manager', 2, 'fafaf', 'fafafaf', to_date('10-03-2011 10:36:14', 'dd-mm-yyyy hh24:mi:ss'), 0, '1005');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2013, 'manager', 2, 'fafaf', 'fafafaf', to_date('10-03-2011 10:36:14', 'dd-mm-yyyy hh24:mi:ss'), 0, '1006');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2014, 'manager', 2, 'fafaf', 'fafafaf', to_date('10-03-2011 10:36:14', 'dd-mm-yyyy hh24:mi:ss'), 0, '1007');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2015, 'manager', 2, 'fafaf', 'fafafaf', to_date('10-03-2011 10:36:14', 'dd-mm-yyyy hh24:mi:ss'), 0, '1008');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2016, 'manager', 2, 'fafaf', 'fafafaf', to_date('10-03-2011 10:36:14', 'dd-mm-yyyy hh24:mi:ss'), 0, '1011');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2017, 'manager', 2, 'fafaf', 'fafafaf', to_date('10-03-2011 10:36:14', 'dd-mm-yyyy hh24:mi:ss'), 0, '1012');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2018, 'manager', 2, 'fafaf', 'fafafaf', to_date('10-03-2011 10:36:14', 'dd-mm-yyyy hh24:mi:ss'), 0, '1004');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2019, 'manager', 2, 'fafaf', 'fafafaf', to_date('10-03-2011 10:36:14', 'dd-mm-yyyy hh24:mi:ss'), 0, '1000');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2020, 'manager', 1, 'fafafa', 'fafafaf', to_date('10-03-2011 10:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, '1002');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2021, 'manager', 1, 'fafafa', 'fafafaf', to_date('10-03-2011 10:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, '1003');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2022, 'manager', 1, 'fafafa', 'fafafaf', to_date('10-03-2011 10:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, '1005');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2023, 'manager', 1, 'fafafa', 'fafafaf', to_date('10-03-2011 10:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, '1006');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2024, 'manager', 1, 'fafafa', 'fafafaf', to_date('10-03-2011 10:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, '1007');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2025, 'manager', 1, 'fafafa', 'fafafaf', to_date('10-03-2011 10:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, '1008');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2026, 'manager', 1, 'fafafa', 'fafafaf', to_date('10-03-2011 10:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, '1011');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2027, 'manager', 1, 'fafafa', 'fafafaf', to_date('10-03-2011 10:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, '1012');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2028, 'manager', 1, 'fafafa', 'fafafaf', to_date('10-03-2011 10:36:32', 'dd-mm-yyyy hh24:mi:ss'), 0, '1004');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2029, 'manager', 1, 'fafafa', 'fafafaf', to_date('10-03-2011 10:36:32', 'dd-mm-yyyy hh24:mi:ss'), 1, '1000');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2030, 'admin', 2, 'fafafafaf', 'afafafaf', to_date('10-03-2011 10:37:52', 'dd-mm-yyyy hh24:mi:ss'), 0, '1002');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2031, 'admin', 2, 'fafafafaf', 'afafafaf', to_date('10-03-2011 10:37:52', 'dd-mm-yyyy hh24:mi:ss'), 0, '1003');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2032, 'admin', 2, 'fafafafaf', 'afafafaf', to_date('10-03-2011 10:37:52', 'dd-mm-yyyy hh24:mi:ss'), 0, '1005');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2033, 'admin', 2, 'fafafafaf', 'afafafaf', to_date('10-03-2011 10:37:52', 'dd-mm-yyyy hh24:mi:ss'), 0, '1006');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2034, 'admin', 2, 'fafafafaf', 'afafafaf', to_date('10-03-2011 10:37:52', 'dd-mm-yyyy hh24:mi:ss'), 0, '1007');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2035, 'admin', 2, 'fafafafaf', 'afafafaf', to_date('10-03-2011 10:37:52', 'dd-mm-yyyy hh24:mi:ss'), 0, '1008');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2036, 'admin', 2, 'fafafafaf', 'afafafaf', to_date('10-03-2011 10:37:52', 'dd-mm-yyyy hh24:mi:ss'), 0, '1011');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2037, 'admin', 2, 'fafafafaf', 'afafafaf', to_date('10-03-2011 10:37:52', 'dd-mm-yyyy hh24:mi:ss'), 0, '1012');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2038, 'admin', 2, 'fafafafaf', 'afafafaf', to_date('10-03-2011 10:37:52', 'dd-mm-yyyy hh24:mi:ss'), 0, '1004');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2039, 'admin', 2, 'fafafafaf', 'afafafaf', to_date('10-03-2011 10:37:52', 'dd-mm-yyyy hh24:mi:ss'), 1, '1001');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2043, 'manager', 0, 'kaio', 'sadsad', to_date('10-03-2011 14:09:19', 'dd-mm-yyyy hh24:mi:ss'), 0, '2040');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2044, 'manager', 0, 'kaio', 'sadsad', to_date('10-03-2011 14:09:19', 'dd-mm-yyyy hh24:mi:ss'), 0, '2041');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2045, 'manager', 0, 'kaio', 'sadsad', to_date('10-03-2011 14:09:19', 'dd-mm-yyyy hh24:mi:ss'), 0, '2042');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2046, 'manager', 0, 'kaio', 'sadsad', to_date('10-03-2011 14:09:19', 'dd-mm-yyyy hh24:mi:ss'), 0, '1005');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2047, 'manager', 0, 'kaio', 'sadsad', to_date('10-03-2011 14:09:19', 'dd-mm-yyyy hh24:mi:ss'), 0, '1006');
insert into EMAIL (E_ID, SEND_NAME, SEND_USERGROP, E_TITLE, E_CONTEXT, SEND_DATE, IS_READ, USERID)
values (2048, 'manager', 0, 'kaio', 'sadsad', to_date('10-03-2011 14:09:19', 'dd-mm-yyyy hh24:mi:ss'), 0, '1011');
commit;
prompt 46 records loaded
prompt Loading EMP...
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7369, 'SMITH', 'CLERK', 7902, to_date('17-12-1980', 'dd-mm-yyyy'), 800, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-02-1981', 'dd-mm-yyyy'), 1600, 300, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7521, 'WARD', 'SALESMAN', 7698, to_date('22-02-1981', 'dd-mm-yyyy'), 1250, 500, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7566, 'JONES', 'MANAGER', 7839, to_date('02-04-1981', 'dd-mm-yyyy'), 2975, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-09-1981', 'dd-mm-yyyy'), 1250, 1400, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7698, 'BLAKE', 'MANAGER', 7839, to_date('01-05-1981', 'dd-mm-yyyy'), 2850, null, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7782, 'CLARK', 'MANAGER', 7839, to_date('09-06-1981', 'dd-mm-yyyy'), 2450, null, 10);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7788, 'SCOTT', 'ANALYST', 7566, to_date('19-04-1987', 'dd-mm-yyyy'), 3000, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7839, 'KING', 'PRESIDENT', null, to_date('17-11-1981', 'dd-mm-yyyy'), 5000, null, 10);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7844, 'TURNER', 'SALESMAN', 7698, to_date('08-09-1981', 'dd-mm-yyyy'), 1500, 0, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7876, 'ADAMS', 'CLERK', 7788, to_date('23-05-1987', 'dd-mm-yyyy'), 1100, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7900, 'JAMES', 'CLERK', 7698, to_date('03-12-1981', 'dd-mm-yyyy'), 950, null, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7902, 'FORD', 'ANALYST', 7566, to_date('03-12-1981', 'dd-mm-yyyy'), 3000, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7934, 'MILLER', 'CLERK', 7782, to_date('23-01-1982', 'dd-mm-yyyy'), 1300, null, 10);
commit;
prompt 14 records loaded
prompt Loading OPERATEDATE...
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2031, 'manager', '卡查询', to_date('10-03-2011 12:17:41', 'dd-mm-yyyy hh24:mi:ss'), '卡挂失,卡号为e001已挂失,卡已锁定');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2032, 'manager', '卡查询', to_date('10-03-2011 12:17:43', 'dd-mm-yyyy hh24:mi:ss'), '卡挂失,卡号为e001已解锁,卡已激活');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2033, 'manager', '卡查询', to_date('10-03-2011 12:17:45', 'dd-mm-yyyy hh24:mi:ss'), '卡挂失,卡号为e001已挂失,卡已锁定');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2034, 'manager', '卡查询', to_date('10-03-2011 14:07:15', 'dd-mm-yyyy hh24:mi:ss'), '卡挂失,卡号为e001已挂失,卡已锁定');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2035, 'manager', '卡查询', to_date('10-03-2011 14:07:20', 'dd-mm-yyyy hh24:mi:ss'), '卡挂失,卡号为e001已解锁,卡已激活');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2036, 'manager', '卡查询', to_date('10-03-2011 14:07:25', 'dd-mm-yyyy hh24:mi:ss'), '卡挂失,卡号为e001已挂失,卡已锁定');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2037, 'manager', '卡查询', to_date('10-03-2011 14:07:47', 'dd-mm-yyyy hh24:mi:ss'), '卡挂失,卡号为e001已解锁,卡已激活');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2041, 'manager', '会员信息', to_date('10-03-2011 14:13:41', 'dd-mm-yyyy hh24:mi:ss'), '会员删除，e004已删除');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2024, 'manager', '会员信息', to_date('10-03-2011 12:02:19', 'dd-mm-yyyy hh24:mi:ss'), '会员删除，e027已删除');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2025, 'manager', '会员信息', to_date('10-03-2011 12:02:19', 'dd-mm-yyyy hh24:mi:ss'), '会员删除，e026已删除');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (1038, 'admin', '卡查询', to_date('09-03-2011 16:35:32', 'dd-mm-yyyy hh24:mi:ss'), '卡挂失,卡号为e002已挂失,卡已锁定');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (1039, 'admin', '卡查询', to_date('09-03-2011 16:35:33', 'dd-mm-yyyy hh24:mi:ss'), '卡挂失,卡号为e002已解锁,卡已激活');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (1040, 'admin', '卡查询', to_date('09-03-2011 16:36:05', 'dd-mm-yyyy hh24:mi:ss'), '卡充值，操作员admin为卡号：e006充值了100.0元');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (1041, 'admin', '卡查询', to_date('09-03-2011 16:36:11', 'dd-mm-yyyy hh24:mi:ss'), '卡充值，操作员admin为卡号：e006充值了100.0元');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (1042, 'admin', '卡查询', to_date('09-03-2011 16:36:14', 'dd-mm-yyyy hh24:mi:ss'), '卡充值，操作员admin为卡号：e006充值了100.0元');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (1043, 'admin', '卡查询', to_date('09-03-2011 16:36:17', 'dd-mm-yyyy hh24:mi:ss'), '卡充值，操作员admin为卡号：e006充值了100.0元');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2026, 'manager', '卡查询', to_date('10-03-2011 12:13:00', 'dd-mm-yyyy hh24:mi:ss'), '卡挂失,卡号为e001已挂失,卡已锁定');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2027, 'manager', '卡查询', to_date('10-03-2011 12:13:02', 'dd-mm-yyyy hh24:mi:ss'), '卡挂失,卡号为e001已解锁,卡已激活');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2028, 'manager', '卡查询', to_date('10-03-2011 12:13:22', 'dd-mm-yyyy hh24:mi:ss'), '卡充值，操作员manager为卡号：e001充值了100.0元');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2029, 'manager', '卡查询', to_date('10-03-2011 12:13:45', 'dd-mm-yyyy hh24:mi:ss'), '卡充值，操作员manager为卡号：e001充值了100.0元');
insert into OPERATEDATE (OPE_ID, OPE_NAME, FUNCTION, OPE_DATE, SPECIFIC_OPE)
values (2030, 'manager', '卡查询', to_date('10-03-2011 12:16:24', 'dd-mm-yyyy hh24:mi:ss'), '卡充值，操作员manager为卡号：e001充值了100.0元');
commit;
prompt 21 records loaded
prompt Loading PURCHASETRAINER...
prompt Table is empty
prompt Loading SALGRADE...
insert into SALGRADE (GRADE, LOSAL, HISAL)
values (1, 700, 1200);
insert into SALGRADE (GRADE, LOSAL, HISAL)
values (2, 1201, 1400);
insert into SALGRADE (GRADE, LOSAL, HISAL)
values (3, 1401, 2000);
insert into SALGRADE (GRADE, LOSAL, HISAL)
values (4, 2001, 3000);
insert into SALGRADE (GRADE, LOSAL, HISAL)
values (5, 3001, 9999);
commit;
prompt 5 records loaded
prompt Loading USERS...
insert into USERS (USERID, USERNAME, PASSWORD, REGISTER_TIME, REALNAME, SEX, BIRTHDAY, QQ, TEL, ADDRESS, TYPEID, EMAIL)
values (2040, 'u001', '123456', to_date('05-03-2012', 'dd-mm-yyyy'), 'fafaf', '男', to_date('10-03-2011', 'dd-mm-yyyy'), 'afafaf', '15173814187', 'fafaf', 1, null);
insert into USERS (USERID, USERNAME, PASSWORD, REGISTER_TIME, REALNAME, SEX, BIRTHDAY, QQ, TEL, ADDRESS, TYPEID, EMAIL)
values (2041, 'u002', '123456', to_date('05-03-2012', 'dd-mm-yyyy'), 'fafaf', '男', to_date('10-03-2011', 'dd-mm-yyyy'), 'affa', 'fafaf', 'fafa', 1, null);
insert into USERS (USERID, USERNAME, PASSWORD, REGISTER_TIME, REALNAME, SEX, BIRTHDAY, QQ, TEL, ADDRESS, TYPEID, EMAIL)
values (2042, 'u003', '123456', to_date('10-03-2011', 'dd-mm-yyyy'), 'fafaf', '女', to_date('10-03-2011', 'dd-mm-yyyy'), 'fafafafaf', 'fafafafafa', 'fafafaf', 1, null);
insert into USERS (USERID, USERNAME, PASSWORD, REGISTER_TIME, REALNAME, SEX, BIRTHDAY, QQ, TEL, ADDRESS, TYPEID, EMAIL)
values (1005, 'ccc', 'admin', to_date('05-03-2012', 'dd-mm-yyyy'), null, '男', to_date('05-03-2012', 'dd-mm-yyyy'), '3590802419', null, null, 1, null);
insert into USERS (USERID, USERNAME, PASSWORD, REGISTER_TIME, REALNAME, SEX, BIRTHDAY, QQ, TEL, ADDRESS, TYPEID, EMAIL)
values (1006, 'ddd', 'admin', to_date('05-03-2012', 'dd-mm-yyyy'), null, '男', to_date('05-03-2012', 'dd-mm-yyyy'), '359080419', null, '359080419', 1, null);
insert into USERS (USERID, USERNAME, PASSWORD, REGISTER_TIME, REALNAME, SEX, BIRTHDAY, QQ, TEL, ADDRESS, TYPEID, EMAIL)
values (1011, 'uuu', 'admin', to_date('05-03-2012', 'dd-mm-yyyy'), null, null, to_date('05-03-2012', 'dd-mm-yyyy'), null, null, null, 1, null);
insert into USERS (USERID, USERNAME, PASSWORD, REGISTER_TIME, REALNAME, SEX, BIRTHDAY, QQ, TEL, ADDRESS, TYPEID, EMAIL)
values (1000, 'admin', 'admin', to_date('05-03-2012', 'dd-mm-yyyy'), '春哥', '女', to_date('05-03-2012', 'dd-mm-yyyy'), '359080419', '13973906536', '湖南长沙', 1, null);
insert into USERS (USERID, USERNAME, PASSWORD, REGISTER_TIME, REALNAME, SEX, BIRTHDAY, QQ, TEL, ADDRESS, TYPEID, EMAIL)
values (1001, 'manager', 'manager', to_date('05-03-2012', 'dd-mm-yyyy'), '凤姐', '女', to_date('05-03-2012', 'dd-mm-yyyy'), '359080419', '13973906536', '湖南长沙', 2, null);
commit;
prompt 8 records loaded
prompt Loading VISITORINFO...
insert into VISITORINFO (CARDID, NAME, TEL, ADDRESS, STARTTIME, OVERTIME)
values ('e005', '琳琳', '13573952365', '湖南长沙', to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-03-2011', 'dd-mm-yyyy'));
insert into VISITORINFO (CARDID, NAME, TEL, ADDRESS, STARTTIME, OVERTIME)
values ('v002', 'fafafa', 'fafafaf', 'fafafa', to_date('11-03-2011', 'dd-mm-yyyy'), to_date('12-03-2011', 'dd-mm-yyyy'));
commit;
prompt 2 records loaded
prompt Loading VISITORORDER...
insert into VISITORORDER (ORDERID, ORDERNAME, TIME, TEL)
values (101, '芙蓉姐姐', to_date('01-03-2011', 'dd-mm-yyyy'), '13874522588');
insert into VISITORORDER (ORDERID, ORDERNAME, TIME, TEL)
values (102, '李刚', to_date('01-03-2011', 'dd-mm-yyyy'), '13536966543');
insert into VISITORORDER (ORDERID, ORDERNAME, TIME, TEL)
values (2024, 'afaf', null, null);
commit;
prompt 3 records loaded
prompt Enabling foreign key constraints for MEMBER...
alter table MEMBER enable constraint FK_GROUPID;
prompt Enabling foreign key constraints for CARDINFO...
alter table CARDINFO enable constraint FK_CARD_IDD;
alter table CARDINFO enable constraint FK_STATE_IDD;
alter table CARDINFO enable constraint FK_TYPE_IDD;
prompt Enabling foreign key constraints for COACHINFO...
alter table COACHINFO enable constraint FK_TYPE_ID;
prompt Enabling foreign key constraints for DEVICEINFO...
alter table DEVICEINFO enable constraint FK_ROOMID;
prompt Enabling foreign key constraints for EMAIL...
alter table EMAIL enable constraint F_FK;
prompt Enabling foreign key constraints for EMP...
alter table EMP enable constraint FK_DEPTNO;
prompt Enabling foreign key constraints for USERS...
alter table USERS enable constraint FK_TYPEID;
prompt Enabling triggers for BONUS...
alter table BONUS enable all triggers;
prompt Enabling triggers for CARDSTATE...
alter table CARDSTATE enable all triggers;
prompt Enabling triggers for CARDTYPE...
alter table CARDTYPE enable all triggers;
prompt Enabling triggers for MEMBERGROUP...
alter table MEMBERGROUP enable all triggers;
prompt Enabling triggers for MEMBER...
alter table MEMBER enable all triggers;
prompt Enabling triggers for CARDINFO...
alter table CARDINFO enable all triggers;
prompt Enabling triggers for COACH_TYPE...
alter table COACH_TYPE enable all triggers;
prompt Enabling triggers for COACHINFO...
alter table COACHINFO enable all triggers;
prompt Enabling triggers for COURSE...
alter table COURSE enable all triggers;
prompt Enabling triggers for DEPT...
alter table DEPT enable all triggers;
prompt Enabling triggers for ROOM...
alter table ROOM enable all triggers;
prompt Enabling triggers for DEVICEINFO...
alter table DEVICEINFO enable all triggers;
prompt Enabling triggers for USERTYPE...
alter table USERTYPE enable all triggers;
prompt Enabling triggers for EMAIL...
alter table EMAIL enable all triggers;
prompt Enabling triggers for EMP...
alter table EMP enable all triggers;
prompt Enabling triggers for OPERATEDATE...
alter table OPERATEDATE enable all triggers;
prompt Enabling triggers for PURCHASETRAINER...
alter table PURCHASETRAINER enable all triggers;
prompt Enabling triggers for SALGRADE...
alter table SALGRADE enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for VISITORINFO...
alter table VISITORINFO enable all triggers;
prompt Enabling triggers for VISITORORDER...
alter table VISITORORDER enable all triggers;
set feedback on
set define on
prompt Done.
