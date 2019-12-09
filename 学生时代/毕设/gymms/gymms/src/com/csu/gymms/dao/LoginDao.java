package com.csu.gymms.dao;

import com.csu.gymms.entity.UsersBean;

public interface LoginDao {
	
   boolean validate_login(UsersBean user);
	     
}
