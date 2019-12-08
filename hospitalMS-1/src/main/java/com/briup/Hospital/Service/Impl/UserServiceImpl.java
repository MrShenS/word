package com.briup.Hospital.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.Hospital.Service.UserService;
import com.briup.Hospital.bean.User;
import com.briup.Hospital.bean.UserExample;
import com.briup.Hospital.bean.extend.UserVm;
import com.briup.Hospital.dao.RoleMapper;
import com.briup.Hospital.dao.UserMapper;
import com.briup.Hospital.dao.extend.UserMapperVM;
import com.briup.Hospital.util.ServiceException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserServiceImpl implements UserService {
@Autowired
public UserMapper userMapper;

@Autowired
public UserMapperVM userVmMapper;

@Autowired
public RoleMapper roleMapper;
	@Override
	public User login(String name, String password) throws ServiceException {
		// TODO Auto-generated method stub
		System.out.println(name);
		UserExample userExample = new UserExample();
		userExample.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
		List<User> list = userMapper.selectByExample(userExample);
		System.out.println("login:"+list);
		if(list!=null&&list.size()!=0) {
			return list.get(0);
		}
		return null; 
	}

	@Override
	public PageInfo<UserVm> findUserWithDept(int curPage, int size) {
		// TODO Auto-generated method stub
		PageHelper.startPage(curPage, size);
		return new PageInfo<>(userVmMapper.findUserWithDept());
	}

	@Override
	public void deleteUser(Integer id) throws ServiceException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveOrUpdate(User user) {
		User key = userMapper.selectByPrimaryKey(user.getId());
		if(key==null) {
			userMapper.insertSelective(user);
		}
		else {
			userMapper.updateByPrimaryKeySelective(user);
		}
		// TODO Auto-generated method stub
	}

	@Override
	public UserVm findUserWithDeptAndRoleById(Integer id) {
		// TODO Auto-generated method stub
		return userVmMapper.findUserWithDeptAndRoleById(id);
	}

	@Override
	public List<User> findUserByDeptId(Integer id) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		example.createCriteria().andDepartmentIdEqualTo(id);
		return userMapper.selectByExample(example);
	}

	@Override
	public List<UserVm> findUserVmByPatientId(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
