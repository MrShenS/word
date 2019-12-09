package com.csu.gymms.service;

import java.util.ArrayList;

import com.csu.gymms.dao.impl.DaoFactory;
import com.csu.gymms.entity.UsersBean;

public class MangerUserService{
      public static ArrayList  getAllUserInfo(){
    	  return new  DaoFactory().createUserInfoDao().getAllUserInfo();  	   
    	  
      }
      
      public static ArrayList  getAllUserInfo(int pagesize,int curpage){
    	  return new  DaoFactory().createUserInfoDao().getAllUserInfo(pagesize,curpage);  	   
    	  
      }
      
      public static boolean  deleteUserInfo(int userid){
    	  return new  DaoFactory().createUserInfoDao().deleteUserInfo(userid);  	   
    	  
      }
      public static boolean  insertUserInfo(UsersBean user){
    	  return new  DaoFactory().createUserInfoDao().insertUserInfo(user);  	   
    	  
      }
      public static boolean  modifyUserInfo(UsersBean user){
    	  return new  DaoFactory().createUserInfoDao().modifyUserInfo(user);  	   
    	  
      }
      public static ArrayList fuzzyUserInfo(int flag, String op) {
    	  return new DaoFactory().createUserInfoDao().fuzzyUserInfo(flag, op);
      }
      
      public static void bulkDeleteUserInfo(int userid) {
    	  new DaoFactory().createUserInfoDao().bulkDeleteUserInfo(userid);
      }
}
