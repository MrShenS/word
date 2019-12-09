package com.csu.gymms.dao;

import java.util.ArrayList;

public interface FieldInfoDao {
	
	ArrayList searchFieldInfo();
	
	void deleteFieldInfo(String  roomname);
	
	void insertFieldInfo(Object obj);
}
