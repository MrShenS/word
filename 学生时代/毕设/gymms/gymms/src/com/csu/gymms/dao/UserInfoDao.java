package com.csu.gymms.dao;

import java.util.ArrayList;

import com.csu.gymms.entity.UsersBean;
//���ߣ�ë  �� 
//�������ܣ��û��������ݿ�ӿڣ�
public interface UserInfoDao {
	//
    ArrayList  getAllUserInfo();
    
    boolean modifyUserInfo(UsersBean user);
    
    boolean deleteUserInfo(int userid);
    
    boolean insertUserInfo(UsersBean user); 
    
    ArrayList fuzzyUserInfo(int flag,String op);
    
    void bulkDeleteUserInfo(int userid);
}
