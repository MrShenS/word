package com.csu.gymms.dao;

import java.util.ArrayList;

import com.csu.gymms.entity.DeviceInfoBean;

public interface DevicesDao {
	
	 //查找
	ArrayList seachDevices();
	
	 //增加
	 void insertDevices(Object obj);
	
	 //修改
	 boolean amendDivicesDao(DeviceInfoBean db);
	 
	 //刪除
	 boolean deleteDevicesSucessDao(int cno);

	   
}
