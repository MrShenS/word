package com.csu.gymms.dao;

import java.util.ArrayList;

import com.csu.gymms.entity.DeviceInfoBean;

public interface DevicesDao {
	
	 //����
	ArrayList seachDevices();
	
	 //����
	 void insertDevices(Object obj);
	
	 //�޸�
	 boolean amendDivicesDao(DeviceInfoBean db);
	 
	 //�h��
	 boolean deleteDevicesSucessDao(int cno);

	   
}
