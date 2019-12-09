package com.csu.gymms.service;

import java.util.ArrayList;

import com.csu.gymms.dao.impl.DaoFactory;

public class CoachInfoService {
	
	public static ArrayList getCoachInfo() {
		return new DaoFactory().createCoachInfoDao().searchCoachInfo();
	}
	
	public static ArrayList getCoachInfo(int pagesize,int curpage) {
		return new DaoFactory().createCoachInfoDao().searchCoachInfo(pagesize,curpage);
	}
	
	public static void insertCoachInfo(Object obj) {
		new DaoFactory().createCoachInfoDao().insertCoachInfo(obj);
	}
	
	public static void modifyCoachInfo(Object obj) {
		new DaoFactory().createCoachInfoDao().modifyCoachInfo(obj);
	}
	
	public static void modifyPartCoachInfo(Object obj) {
		new DaoFactory().createCoachInfoDao().modifyPartCoachInfo(obj);
	}
	
	public static void deleteCoachInfo(String cno) {
		new DaoFactory().createCoachInfoDao().deleteCoachInfo(cno);
	}
	
	public static ArrayList fuzzySearchCoachInfo(int flag,String op) {
		return new DaoFactory().createCoachInfoDao().fuzzySearchCoachInfo(flag,op);
	}
	
	public static void bulkDeleteCoachInfo(String cno) {
		new DaoFactory().createCoachInfoDao().bulkDeleteCoachInfo(cno);
	}
	
	
}
