package com.csu.gymms.service;

import java.util.ArrayList;

import com.csu.gymms.dao.impl.DaoFactory;

public class FiledInfoService {
	
	public static  ArrayList searchFieldInfo() {
		
		return new DaoFactory().createFieldInfoDao().searchFieldInfo();
		
	}
	
	public static void insertFieldInfo(Object obj) {
		
		new DaoFactory().createFieldInfoDao().insertFieldInfo(obj);
		
	}
	
	public static void deleteFieldInfo(String roomname) {
		
		new DaoFactory().createFieldInfoDao().deleteFieldInfo(roomname);
		
	}
	
	
}
