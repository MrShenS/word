package com.csu.gymms.service;

import java.util.ArrayList;

import com.csu.gymms.dao.impl.DaoFactory;
import com.csu.gymms.entity.DeviceInfoBean;

//²éÑ¯Æ÷ÐµÐÅÏ¢
public class DevicesService {

	public static ArrayList getDevices(){		
		return new DaoFactory().createDevices().seachDevices();		
	}

	public static void addDevices(Object obj){
		new DaoFactory().createDevices().insertDevices(obj);
	}
	
	public static void amendDivices(DeviceInfoBean db){
		new DaoFactory().createDevices().amendDivicesDao(db);
	}
	
	public static boolean deleteDevicesSucessDao(int cno) {
		return new DaoFactory().createDevices().deleteDevicesSucessDao(cno);
	}
	
}
