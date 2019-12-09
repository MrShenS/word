package com.csu.gymms.dao;

public interface SQLStatement {
	
	//查找教练基本信息
	String SQL_COACH_INFO = "select cno,cname,cid,sex,birthday,address,qq,email,b.tname,tel,description,photofile from coachinfo a,coach_type b where a.type=b.tid";
	//增加教练信息
	String SQL_ADD_COACH = "insert into coachinfo(cno,cname,cid,sex,birthday,address,qq,email,type,tel,description,photofile) values(?,?,?,?,to_date(?,'yyyy-mm-dd'),?,?,?,?,?,?,?)";
	//修改教练信息
	String SQL_MODIFY_COACH = "update coachinfo set cname=?,cid=?,sex=?,birthday=to_date(?,'yyyy-mm-dd') ,address=? ,qq=? ,email=? ,type=? ,tel=? ,description=? ,photofile = ? where cno = ?";
	//修改教练信息
	String SQL_MODIFY_PCOACH = "update coachinfo set cname=?,cid=?,sex=?,birthday=to_date(?,'yyyy-mm-dd') ,address=? ,qq=? ,email=? ,type=? ,tel=? ,description=? where cno = ?";
	//删除教练基本信息
	String SQL_DELETE_COACH = "delete coachinfo where cno=?";
	//按名字模糊查询教练基本信息
	String SQL_SEARCH_COACHNAME = "select cno,cname,cid,b.tname,tel from coachinfo a,coach_type b where a.type=b.tid and cname like ?";
	//按身份证模糊查询
	String SQL_SEARCH_COACHID = "select cno,cname,cid,b.tname,tel from coachinfo a,coach_type b where a.type=b.tid and cid like ?";
	//批量删除
	String SQL_BULK_COACHINFO = "delete  coachinfo where cno =?";
	 /*********************************************************************/
	
	//查找会员信息
	String SQL_MEMBER = "select a.mno,a.mname,a.id,a.email,b.groupname,a.sex,a.birthday,a.qq,a.telphone,a.phone,a.address,a.description from member a,membergroup b where a.mgroup = b.groupid";
	//增加会员信息
	String SQL_INSERT_MEMBER = "insert into member values(?,?,?,?,?,?,to_date(?,'yyyy-mm-dd'),?,?,?,?,?)";
	//修改会员信息
	String SQL_UPDATE_MEMBER = "update member set mname=?,id=?,email=?,mgroup=?,sex=?,birthday=to_date(?,'yyyy-mm-dd'),qq=?,telphone=?,phone=?,address=?,description=? where mno=?";
	//删除会员基本信息
	String SQL_DELETE_MEMBER = "delete member where mno = ?";
	//模糊查询
	String SQL_SEARCH_MEMBERNAME = "select a.mno, a.mname, a.id,b.groupname,a.email from member a,membergroup b where a.mgroup = b.groupid and a.mname like ? ";
	String SQL_SEARCH_MEMBERID = "select a.mno, a.mname, a.id,b.groupname,a.email from member a,membergroup b where a.mgroup = b.groupid and a.id like ?";
	//插入私教信息
	String SQL_PURCHASE_TRAINER = "insert into purchasetrainer values(?,?,?,?,?,?,?)";
	//批量删除会员信息
	String SQL_BULK_MEMBER = "delete member where mno = ?";
	 /*********************************************************************/
	
	//添加卡信息
	String SQL_ADD_CARD = "insert into cardinfo values(?,?,?,?,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?)";
	//查询卡的基本信息
	String SQL_CARD_INFO = "select a.cardid,d.mname,d.id,b.typename,c.statename,money,startdate,overdate,content from cardinfo a,cardtype b,cardstate c,member d where a.cardtype=b.typeid and a.cardstate=c.stateid and a.cardid=d.mno";
	//卡充值
	String SQL_RECHARGE_CARD = "update cardinfo set money=money+? where cardid=?";
	//根据卡号删除信息
	String SQL_DELETE_CARD = "delete  cardinfo where cardid=?";
	//根据卡号修改会员信息
	String SQL_UPDATEMEMBER = "update member set mno=? where mno=?";
	//根据卡号修改卡的信息
	String SQL_INSERT_CARD = "insert into cardinfo values(?,?,?,?,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?)";
	//根据卡号修改卡的状态
	String SQL_UPDATE_CARDSTATE = "update cardinfo set cardstate=? where cardid=?";
	//根据卡号查找信息
	String SQL_CARDID_INFO = "select a.cardid,d.mname,d.id,b.typename,c.statename,money,startdate,overdate,content from cardinfo a,cardtype b,cardstate c,member d where cardid = ? and a.cardtype=b.typeid and a.cardstate=c.stateid and a.cardid=d.mno";
	//根据卡号查找卡状态
	String SQL_SEARCH_CARDSTATE = "select statename from cardinfo a,cardstate b where a.cardid=? and a.cardstate=b.stateid";
	
	/*********************************************************************/
	
	
	String SQL_USERINFO="select userid,username,password,register_time,realname,sex,birthday,qq,tel,address,b.typename ,email from users a,usertype b where a.typeid = b.typeid";
	
	String SQL_USERINFO_DELETE="delete from users where userid=?";
	
	String SQL_USERINFO_INSERT ="insert into users values(SEQ_FIRST.NEXTVAL,?,?,to_date(?,'yyyy-mm-dd'),?,?,to_date(?,'yyyy-mm-dd'),?,?,?,?,?)";
	
	String SQL_USERINFO_MODIFY="update users set password=?,realname=?,sex=?,birthday=to_date(?,'yyyy-mm-dd'),qq=?,tel=?,address=?,email=?, register_time=to_date(?,'yyyy-mm-dd') ,typeid=? where userid=?";
	//根据会员编号模糊查询
	String SQL_USERID_USERINFO = "select * from users where userid like ?";
	String SQL_USERNAME_USERINFO = "select * from users where username like ?";
	//用户批量删除
	String SQL_BULK_USER = "delete from users where userid = ?";
	
	String SQL_LOGIN="select count(*) from users where username=? and password=? and typeid=?";
	//0代表为未阅读，1代表阅读
	//邮件的接收
	String SQL_EMAIL_RESERVER="Select e_id, send_name,e_title,e_context,send_date,send_usergrop,is_read from email where send_usergrop not in(?) and userid=? order by send_date DESC";
	//邮件的发送
	String SQL_EMAIL_SEND="insert into  email values(seq_first.nextval,?,?,?,?,sysdate,'0',?)";
	//邮件的状态修改
	String SQL_EMAIL_MODIFIYSTATE="update email set is_read='1' where e_id=? and userid=?";
	//邮件的删除
	String SQL_EMAIL_DELETE="delete from email where e_id=? and userid=?";
	
	 /*********************************************************************/
	
	  //按课程名模糊查找课程信息
	String SQL_CUR_CHECK = "select courseid,coursename,roomname,coachname,carpnumber,devicename,benifits from course where coursename like ?";
	//
	String SQL_CUR_CHECKNAME = "select courseid,coursename,roomname,coachname,carpnumber,devicename,benifits from course ";
     //根据教练ID号查教练名
    String SQL_COACH_CHECK = "select cname from coachinfo where cno=?";


    //根据课程查找页面增加课程信息
    String SQL_CURRICULUM_ADD = "insert into course (courseid,coursename,roomname,coachname,carpnumber,devicename,benifits) values(SEQ_COURSE.nextval,?,?,?,?,?,?)";
   
 //查询器械的信息
    
    String SQL_DEVICES_CHECK ="select deviceid,devicename,principal,room,entrancetime,usetime,brief from deviceinfo";
    
   //增加器械信息
    String SQL_DEVICES_ADD = "insert into deviceinfo values(?,?,?,?,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?)";
    
    //删除器械信息
    
   String SQL_DEVICES_DELETE="delete from deviceinfo where deviceid=?"; 
   
   //修改器械信息
   
   String SQL_DEVICES_UPDATE="update deviceinfo set devicename=?, principal=?,room=?, entrancetime=to_date(?,'yyyy-mm-dd'),usetime=to_date(?,'yyyy-mm-dd'),brief=? where deviceid=?";
   
   //房间信息查询
   String SQL_FIELD_INFO = "select * from room";
   //删除场地信息
   String SQL_DELETE_FIELD = "delete room where roomname = ?";
   //增加场地信息
   String SQL_ADD_FIELD = "insert into room values(seq_course.nextval,?,?,?)";
   /*********************************************************************/
   //查找操作日志信息
   String SQL_SEARCH_OPERATE = "select * from operatedate";
   //增加操作日志信息
   String SQL_ADD_OPERATE = "insert into operatedate values(SEQ_SECOND.nextval,?,?,to_date(?,'yyyy-mm-dd hh24:mi:ss'),?)";
   //删除操作日志信息
   String SQL_DELETE_OPERATEDATE = "delete from operatedate where ope_id =　?";
   //操作日志模糊查询
   String SQL_OPERATE_OPERATOR= "select * from operatedate where ope_name like ?";
   String SQL_OPERATE_FUNCTION="select * from operatedate where function like ?";
}

