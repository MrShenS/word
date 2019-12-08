package com.briup.Hospital.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.Hospital.Service.RoleService;
import com.briup.Hospital.bean.Role;
import com.briup.Hospital.bean.RoleExample;
import com.briup.Hospital.bean.RoleExample.Criteria;
import com.briup.Hospital.dao.RoleMapper;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	public RoleMapper roleMapper;
	@Override
	public List<Role> findAllRole() {
		// TODO Auto-generated method stub
		return roleMapper.selectByExample(new RoleExample());
	}

	@Override
	public Role findRoleById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Role findRoleByName(String name) {
		// TODO Auto-generated method stub
		System.out.println("是谁："+name);
		RoleExample roleExample = new RoleExample();
		Criteria criteria = roleExample.createCriteria();
		criteria.andNameEqualTo(name);
		List<Role> list = roleMapper.selectByExample(roleExample);
		System.out.println("role:"+list);
		return list.get(0);
	}

}
