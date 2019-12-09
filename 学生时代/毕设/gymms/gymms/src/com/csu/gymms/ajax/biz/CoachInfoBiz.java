package com.csu.gymms.ajax.biz;

import java.util.ArrayList;

import com.csu.gymms.entity.CoachBean;
import com.csu.gymms.service.CoachInfoService;
import org.directwebremoting.servlet.DwrServlet;

public class CoachInfoBiz {
	
	public Boolean check_cname(String cno) {
		ArrayList clist = new CoachInfoService().getCoachInfo();
		Boolean flag = false;
		for(int i = 0; i < clist.size(); i++) {
			CoachBean cb = (CoachBean)clist.get(i);
			if(cno.equals(cb.getCno())) {
				flag = true;
				return flag;
			} else {
				flag = false;
			}
		}
		return flag;
	}
	
//	public static void main(String args[]) {
//		CoachInfoBiz ci = new CoachInfoBiz();
//		System.out.println(ci.check_cname("aa"));
//	} 
}
