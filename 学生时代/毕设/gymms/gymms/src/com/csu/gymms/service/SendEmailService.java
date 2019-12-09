package com.csu.gymms.service;

import java.util.ArrayList;

import com.csu.gymms.dao.impl.DaoFactory;
import com.csu.gymms.entity.EmailBean;

public class SendEmailService {
	public static ArrayList reserveEmail(String notTypeId,String UserId){
		return new DaoFactory().createSendEmailDao().reserveEmail(notTypeId, UserId);
	}
	
	public static boolean modifyReadState(String e_id,String userId){
		return new DaoFactory().createSendEmailDao().modifyReadState(e_id,userId);
	}
	
	public static boolean sendEmail(ArrayList userIdList ,EmailBean email){
		return new DaoFactory().createSendEmailDao().sendEmail(userIdList,email);
	}
	
	public static boolean deleteEmail(String e_id,String userId){
		return new DaoFactory().createSendEmailDao().deleteEmail(e_id,userId);
	}
}
