package com.csu.gymms.dao.impl;

import com.csu.gymms.dao.CardInfoDao;
import com.csu.gymms.dao.CoachInfoDao;
import com.csu.gymms.dao.CourseDao;
import com.csu.gymms.dao.DevicesDao;
import com.csu.gymms.dao.FieldInfoDao;
import com.csu.gymms.dao.MemberDao;
import com.csu.gymms.dao.OperateDao;

public final class DaoFactory {
	
	public static CoachInfoDao createCoachInfoDao() {
		return new CoachInfoDaoImpl();
	}
	
	public static MemberDao createMemberDao(){
		return new MemberDaoImpl();
	}
	
	public static CardInfoDao createCardInfoDao(){
		return new CardInfoDaoImpl();
	}
	
	public static LoginImpl createLoginDao(){
		return new LoginImpl();
	}
	
	public static UserInfoImpl createUserInfoDao(){
		return new UserInfoImpl();
	}
	
	public static SendEmailDaoImpl createSendEmailDao(){
		return new SendEmailDaoImpl();
	}
	
	public static PurchaseTrainerImpl createPurchaseTrainer(){
		return new PurchaseTrainerImpl();
	}
	

	public static CourseDao createCourse(){	
		return new  CourseDaoImpl();	
	}

	public static DevicesDao createDevices(){	
		return new DevicesDaoImpl();
	}
	
	public static OperateDao createOperateDate() {
		return new OperateDaoImpl();
	}
	
	public static FieldInfoDao createFieldInfoDao() {
		return new FieldInfoDaoImpl();
	} 

}
