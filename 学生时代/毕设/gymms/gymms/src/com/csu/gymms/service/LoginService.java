package com.csu.gymms.service;

import com.csu.gymms.dao.impl.DaoFactory;
import com.csu.gymms.entity.UsersBean;

public class LoginService {
      public static boolean validate_login(UsersBean user){
    	  return new  DaoFactory().createLoginDao().validate_login(user);  	  
      }
}
