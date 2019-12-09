package com.csu.gymms.dao;

import java.util.ArrayList;

public interface OperateDao {
	
	ArrayList searchOperateInfo();
	
	void insertOperateInfo(Object obj);
	
	void deleteOperateInfo(int ope_id);
	
	ArrayList fuzzyOperateInfo(int flag,String op);

	ArrayList searchOperateInfo(int pagesize, int curpage);
}
