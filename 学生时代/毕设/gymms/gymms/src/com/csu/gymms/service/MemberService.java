package com.csu.gymms.service;

import java.util.ArrayList;

import com.csu.gymms.dao.impl.DaoFactory;

public class MemberService {
	
	public static ArrayList getMember(){
		return new DaoFactory().createMemberDao().searchMember();
	}
	
	public static ArrayList getMember(int pagesize,int curpage){
		return new DaoFactory().createMemberDao().searchMember(pagesize,curpage);
	}
	
	public static void addMember(Object obj){
		new DaoFactory().createMemberDao().insertMember(obj);
	}
	
	public static void modifyMember(Object obj){
		new DaoFactory().createMemberDao().updateMember(obj);
	}
	
	public static void deleteMember(String mno) {
		new DaoFactory().createMemberDao().deleteMember(mno);
	}
	
	public static ArrayList fuzzySearchMember(int flag,String op) {
		return new DaoFactory().createMemberDao().fuzzySearchMember(flag, op);
	}
	
	public static void bulkDeleteMember(String mno) {
		new DaoFactory().createMemberDao().bulkDeleteMember(mno);
	}

}
