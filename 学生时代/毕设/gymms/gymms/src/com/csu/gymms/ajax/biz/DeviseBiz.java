package com.csu.gymms.ajax.biz;

import java.util.ArrayList;

import com.csu.gymms.entity.DeviceInfoBean;
import com.csu.gymms.service.DevicesService;

public class DeviseBiz {
	
	public boolean check_aname(String cno){
		
		ArrayList al = DevicesService.getDevices();
		boolean flag=false;
		for(int i=0;i<al.size();i++){
			DeviceInfoBean db=(DeviceInfoBean)al.get(i);
			if(cno.equals(db.getDevicename())){
				flag=true;
				return flag;
			}
			
		}
		   return flag;
	}
	
	public boolean check_aid(String id){
		System.out.println("------------------------------>");
		ArrayList al = DevicesService.getDevices();
		boolean flag=false;
		for(int i=0;i<al.size();i++){
			DeviceInfoBean db=(DeviceInfoBean)al.get(i);
			if(id.equals(db.getDeviceid())){
				flag=true;
				return flag;
			}
			
		}
		   return flag;
		
	}
}
