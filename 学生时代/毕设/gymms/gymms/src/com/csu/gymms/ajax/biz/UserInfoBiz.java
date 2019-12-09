package com.csu.gymms.ajax.biz;

import java.util.ArrayList;

import com.csu.gymms.entity.UsersBean;
import com.csu.gymms.service.MangerUserService;

public class UserInfoBiz {
	public Boolean check_uname(String username) {
		ArrayList clist = new MangerUserService().getAllUserInfo();
		Boolean flag = false;
		for(int i = 0; i < clist.size(); i++) {
			UsersBean ub = (UsersBean)clist.get(i);
			if(username.equals(ub.getUsername())) {
				flag = true;
				return flag;
			} else {
				flag = false;
			}
		}
		return flag;
	}
	
}
