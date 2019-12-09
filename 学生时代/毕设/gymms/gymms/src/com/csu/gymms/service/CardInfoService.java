package com.csu.gymms.service;

import java.util.ArrayList;

import com.csu.gymms.dao.impl.DaoFactory;
import com.csu.gymms.entity.CardInfoBean;

public class CardInfoService {
	
	public static ArrayList getCardInfo() {
		return new DaoFactory().createCardInfoDao().searchCardInfo();	
	}
	
	public static void insertCard(Object obj) {
		new DaoFactory().createCardInfoDao().insertCard(obj);
	}
	
	public static void updatCardMondy(String cardid, double money) {
		new DaoFactory().createCardInfoDao().updatCardMondy(cardid, money);
	}
	
	public static void deleteCardInfo(String newcardid) {
		new DaoFactory().createCardInfoDao().deleteCardInfo(newcardid);
	}
	
	public static void updateMemberInfo(String cardid,String newcardid) {
		new DaoFactory().createCardInfoDao().updateMemberInfo(cardid, newcardid); 
	}
	
	public static void insertCardInfo(Object obj) {
		new DaoFactory().createCardInfoDao().insertCardInfo(obj);
	}
	
	public static void updateCardState(int cardstate,String cardid) {
		new DaoFactory().createCardInfoDao().updateCardState(cardstate, cardid);
	}
	
	public static ArrayList searchByCardId(String cardid) {
		return new DaoFactory().createCardInfoDao().searchByCardId(cardid);
	}
	
	public static String searchCardState(String cardid) {
		return new DaoFactory().createCardInfoDao().searchCardState(cardid);
	}

}
