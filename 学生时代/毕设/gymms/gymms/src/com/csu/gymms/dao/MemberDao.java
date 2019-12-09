package com.csu.gymms.dao;

import java.util.ArrayList;

public interface MemberDao {
	
	ArrayList searchMember();
	
	void insertMember(Object obj);
	
	void updateMember(Object obj);
	
	void deleteMember(String mno);
	
	ArrayList fuzzySearchMember(int flag,String op);

	ArrayList searchMember(int pagesize, int curpage);
	
	void bulkDeleteMember(String mno);

}
