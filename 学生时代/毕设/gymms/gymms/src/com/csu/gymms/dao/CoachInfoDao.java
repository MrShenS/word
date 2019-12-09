package com.csu.gymms.dao;

import java.util.ArrayList;

public interface CoachInfoDao {
	
	ArrayList searchCoachInfo();
	

	ArrayList searchCoachInfo(int pagesize,int curpage);
	
	void insertCoachInfo(Object obj);
	
	void modifyCoachInfo(Object obj);
	
	void modifyPartCoachInfo(Object obj);
	
	void deleteCoachInfo(String cno);
	
	ArrayList fuzzySearchCoachInfo(int flag,String op);
	
	void bulkDeleteCoachInfo(String cno);
}
