package com.csu.gymms.ajax.biz;

import java.util.ArrayList;

import com.csu.gymms.entity.MemberBean;
import com.csu.gymms.service.MemberService;

public class MemberBiz {

	public Boolean check_mname(String mname){
		ArrayList mList = new MemberService().getMember();
		Boolean flag = false;
		for(int i = 0; i < mList.size(); i++) {
			MemberBean mb = (MemberBean)mList.get(i);
			if(mname.equals(mb.getMname())) {
				flag = true;
				return flag;
			} else {
				flag = false;
			}
		}
		return flag;
	}
	
	public Boolean check_id(String id){
		Boolean flag = false;
		if(id.matches("^(\\d{15}|\\d{18}|\\d{17}[Xx])$")) {
			flag = false;
		} else {
			flag = true;
			return flag;
		}	
		return flag;
	}
}
