package com.csu.gymms.dao;

import java.util.ArrayList;

import com.csu.gymms.entity.UsersBean;
//作者：毛  忠 
//描述功能：用户管理数据库接口；
public interface UserInfoDao {
	//
    ArrayList  getAllUserInfo();
    
    boolean modifyUserInfo(UsersBean user);
    
    boolean deleteUserInfo(int userid);
    
    boolean insertUserInfo(UsersBean user); 
    
    ArrayList fuzzyUserInfo(int flag,String op);
    
    void bulkDeleteUserInfo(int userid);
}
