package com.csu.gymms.service;

import java.util.ArrayList;

import com.csu.gymms.dao.impl.DaoFactory;

public class OperateDateService {
	
	public static void deleteOperateInfo(int ope_id) {
		new DaoFactory().createOperateDate().deleteOperateInfo(ope_id);
	}
	
	public static void insertOperateInfo(Object obj) {
		new DaoFactory().createOperateDate().insertOperateInfo(obj);
	}
	
	public static ArrayList searchOperateInfo() {
		return new DaoFactory().createOperateDate().searchOperateInfo();
	} 
	
	public static ArrayList searchOperateInfo(int pagesize,int curpage) {
		return new DaoFactory().createOperateDate().searchOperateInfo(pagesize,curpage);
	} 
	
	public static ArrayList fuzzyOperateInfo(int flag, String op) {
		return new DaoFactory().createOperateDate().fuzzyOperateInfo(flag, op);
	}
}
