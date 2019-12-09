package com.csu.gymms.dao;

import java.util.ArrayList;

import com.csu.gymms.entity.EmailBean;

public interface SendEmailDao {
	 boolean sendEmail(ArrayList userIdList,EmailBean email);
	 
     ArrayList reserveEmail(String notTypeId,String userId);
     
     boolean modifyReadState(String e_id,String userId);
     
     boolean deleteEmail(String e_id,String userId);
}
