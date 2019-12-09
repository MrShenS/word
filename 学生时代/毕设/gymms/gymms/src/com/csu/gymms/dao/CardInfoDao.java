package com.csu.gymms.dao;

import java.util.ArrayList;

import com.csu.gymms.entity.CardInfoBean;

public interface CardInfoDao {
	
	ArrayList searchCardInfo();
	
	void insertCard(Object obj);
	
	void updatCardMondy(String cardid,double money);
	
	void deleteCardInfo(String newcardid);
	
	void updateMemberInfo(String cardid,String newcardid);
	
	void insertCardInfo(Object obj);
	
	void updateCardState(int cardstate,String cardid);
	
	ArrayList searchByCardId(String cardid);
	
	String searchCardState(String cardid);

}
