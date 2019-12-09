package com.csu.gymms.dao;

public interface SQLStatement {
	
	//���ҽ���������Ϣ
	String SQL_COACH_INFO = "select cno,cname,cid,sex,birthday,address,qq,email,b.tname,tel,description,photofile from coachinfo a,coach_type b where a.type=b.tid";
	//���ӽ�����Ϣ
	String SQL_ADD_COACH = "insert into coachinfo(cno,cname,cid,sex,birthday,address,qq,email,type,tel,description,photofile) values(?,?,?,?,to_date(?,'yyyy-mm-dd'),?,?,?,?,?,?,?)";
	//�޸Ľ�����Ϣ
	String SQL_MODIFY_COACH = "update coachinfo set cname=?,cid=?,sex=?,birthday=to_date(?,'yyyy-mm-dd') ,address=? ,qq=? ,email=? ,type=? ,tel=? ,description=? ,photofile = ? where cno = ?";
	//�޸Ľ�����Ϣ
	String SQL_MODIFY_PCOACH = "update coachinfo set cname=?,cid=?,sex=?,birthday=to_date(?,'yyyy-mm-dd') ,address=? ,qq=? ,email=? ,type=? ,tel=? ,description=? where cno = ?";
	//ɾ������������Ϣ
	String SQL_DELETE_COACH = "delete coachinfo where cno=?";
	//������ģ����ѯ����������Ϣ
	String SQL_SEARCH_COACHNAME = "select cno,cname,cid,b.tname,tel from coachinfo a,coach_type b where a.type=b.tid and cname like ?";
	//�����֤ģ����ѯ
	String SQL_SEARCH_COACHID = "select cno,cname,cid,b.tname,tel from coachinfo a,coach_type b where a.type=b.tid and cid like ?";
	//����ɾ��
	String SQL_BULK_COACHINFO = "delete  coachinfo where cno =?";
	 /*********************************************************************/
	
	//���һ�Ա��Ϣ
	String SQL_MEMBER = "select a.mno,a.mname,a.id,a.email,b.groupname,a.sex,a.birthday,a.qq,a.telphone,a.phone,a.address,a.description from member a,membergroup b where a.mgroup = b.groupid";
	//���ӻ�Ա��Ϣ
	String SQL_INSERT_MEMBER = "insert into member values(?,?,?,?,?,?,to_date(?,'yyyy-mm-dd'),?,?,?,?,?)";
	//�޸Ļ�Ա��Ϣ
	String SQL_UPDATE_MEMBER = "update member set mname=?,id=?,email=?,mgroup=?,sex=?,birthday=to_date(?,'yyyy-mm-dd'),qq=?,telphone=?,phone=?,address=?,description=? where mno=?";
	//ɾ����Ա������Ϣ
	String SQL_DELETE_MEMBER = "delete member where mno = ?";
	//ģ����ѯ
	String SQL_SEARCH_MEMBERNAME = "select a.mno, a.mname, a.id,b.groupname,a.email from member a,membergroup b where a.mgroup = b.groupid and a.mname like ? ";
	String SQL_SEARCH_MEMBERID = "select a.mno, a.mname, a.id,b.groupname,a.email from member a,membergroup b where a.mgroup = b.groupid and a.id like ?";
	//����˽����Ϣ
	String SQL_PURCHASE_TRAINER = "insert into purchasetrainer values(?,?,?,?,?,?,?)";
	//����ɾ����Ա��Ϣ
	String SQL_BULK_MEMBER = "delete member where mno = ?";
	 /*********************************************************************/
	
	//��ӿ���Ϣ
	String SQL_ADD_CARD = "insert into cardinfo values(?,?,?,?,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?)";
	//��ѯ���Ļ�����Ϣ
	String SQL_CARD_INFO = "select a.cardid,d.mname,d.id,b.typename,c.statename,money,startdate,overdate,content from cardinfo a,cardtype b,cardstate c,member d where a.cardtype=b.typeid and a.cardstate=c.stateid and a.cardid=d.mno";
	//����ֵ
	String SQL_RECHARGE_CARD = "update cardinfo set money=money+? where cardid=?";
	//���ݿ���ɾ����Ϣ
	String SQL_DELETE_CARD = "delete  cardinfo where cardid=?";
	//���ݿ����޸Ļ�Ա��Ϣ
	String SQL_UPDATEMEMBER = "update member set mno=? where mno=?";
	//���ݿ����޸Ŀ�����Ϣ
	String SQL_INSERT_CARD = "insert into cardinfo values(?,?,?,?,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?)";
	//���ݿ����޸Ŀ���״̬
	String SQL_UPDATE_CARDSTATE = "update cardinfo set cardstate=? where cardid=?";
	//���ݿ��Ų�����Ϣ
	String SQL_CARDID_INFO = "select a.cardid,d.mname,d.id,b.typename,c.statename,money,startdate,overdate,content from cardinfo a,cardtype b,cardstate c,member d where cardid = ? and a.cardtype=b.typeid and a.cardstate=c.stateid and a.cardid=d.mno";
	//���ݿ��Ų��ҿ�״̬
	String SQL_SEARCH_CARDSTATE = "select statename from cardinfo a,cardstate b where a.cardid=? and a.cardstate=b.stateid";
	
	/*********************************************************************/
	
	
	String SQL_USERINFO="select userid,username,password,register_time,realname,sex,birthday,qq,tel,address,b.typename ,email from users a,usertype b where a.typeid = b.typeid";
	
	String SQL_USERINFO_DELETE="delete from users where userid=?";
	
	String SQL_USERINFO_INSERT ="insert into users values(SEQ_FIRST.NEXTVAL,?,?,to_date(?,'yyyy-mm-dd'),?,?,to_date(?,'yyyy-mm-dd'),?,?,?,?,?)";
	
	String SQL_USERINFO_MODIFY="update users set password=?,realname=?,sex=?,birthday=to_date(?,'yyyy-mm-dd'),qq=?,tel=?,address=?,email=?, register_time=to_date(?,'yyyy-mm-dd') ,typeid=? where userid=?";
	//���ݻ�Ա���ģ����ѯ
	String SQL_USERID_USERINFO = "select * from users where userid like ?";
	String SQL_USERNAME_USERINFO = "select * from users where username like ?";
	//�û�����ɾ��
	String SQL_BULK_USER = "delete from users where userid = ?";
	
	String SQL_LOGIN="select count(*) from users where username=? and password=? and typeid=?";
	//0����Ϊδ�Ķ���1�����Ķ�
	//�ʼ��Ľ���
	String SQL_EMAIL_RESERVER="Select e_id, send_name,e_title,e_context,send_date,send_usergrop,is_read from email where send_usergrop not in(?) and userid=? order by send_date DESC";
	//�ʼ��ķ���
	String SQL_EMAIL_SEND="insert into  email values(seq_first.nextval,?,?,?,?,sysdate,'0',?)";
	//�ʼ���״̬�޸�
	String SQL_EMAIL_MODIFIYSTATE="update email set is_read='1' where e_id=? and userid=?";
	//�ʼ���ɾ��
	String SQL_EMAIL_DELETE="delete from email where e_id=? and userid=?";
	
	 /*********************************************************************/
	
	  //���γ���ģ�����ҿγ���Ϣ
	String SQL_CUR_CHECK = "select courseid,coursename,roomname,coachname,carpnumber,devicename,benifits from course where coursename like ?";
	//
	String SQL_CUR_CHECKNAME = "select courseid,coursename,roomname,coachname,carpnumber,devicename,benifits from course ";
     //���ݽ���ID�Ų������
    String SQL_COACH_CHECK = "select cname from coachinfo where cno=?";


    //���ݿγ̲���ҳ�����ӿγ���Ϣ
    String SQL_CURRICULUM_ADD = "insert into course (courseid,coursename,roomname,coachname,carpnumber,devicename,benifits) values(SEQ_COURSE.nextval,?,?,?,?,?,?)";
   
 //��ѯ��е����Ϣ
    
    String SQL_DEVICES_CHECK ="select deviceid,devicename,principal,room,entrancetime,usetime,brief from deviceinfo";
    
   //������е��Ϣ
    String SQL_DEVICES_ADD = "insert into deviceinfo values(?,?,?,?,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?)";
    
    //ɾ����е��Ϣ
    
   String SQL_DEVICES_DELETE="delete from deviceinfo where deviceid=?"; 
   
   //�޸���е��Ϣ
   
   String SQL_DEVICES_UPDATE="update deviceinfo set devicename=?, principal=?,room=?, entrancetime=to_date(?,'yyyy-mm-dd'),usetime=to_date(?,'yyyy-mm-dd'),brief=? where deviceid=?";
   
   //������Ϣ��ѯ
   String SQL_FIELD_INFO = "select * from room";
   //ɾ��������Ϣ
   String SQL_DELETE_FIELD = "delete room where roomname = ?";
   //���ӳ�����Ϣ
   String SQL_ADD_FIELD = "insert into room values(seq_course.nextval,?,?,?)";
   /*********************************************************************/
   //���Ҳ�����־��Ϣ
   String SQL_SEARCH_OPERATE = "select * from operatedate";
   //���Ӳ�����־��Ϣ
   String SQL_ADD_OPERATE = "insert into operatedate values(SEQ_SECOND.nextval,?,?,to_date(?,'yyyy-mm-dd hh24:mi:ss'),?)";
   //ɾ��������־��Ϣ
   String SQL_DELETE_OPERATEDATE = "delete from operatedate where ope_id =��?";
   //������־ģ����ѯ
   String SQL_OPERATE_OPERATOR= "select * from operatedate where ope_name like ?";
   String SQL_OPERATE_FUNCTION="select * from operatedate where function like ?";
}

