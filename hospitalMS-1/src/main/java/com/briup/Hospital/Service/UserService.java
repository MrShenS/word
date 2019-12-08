package com.briup.Hospital.Service;

import java.util.List;

import com.briup.Hospital.bean.User;
import com.briup.Hospital.bean.extend.UserVm;
import com.briup.Hospital.util.ServiceException;
import com.github.pagehelper.PageInfo;

public interface UserService {
	public User login(String name,String password)throws ServiceException;
	public PageInfo<UserVm> findUserWithDept(int curPage,int size);
	public void deleteUser(Integer id)throws ServiceException;
	public void saveOrUpdate(User user);
	public UserVm findUserWithDeptAndRoleById(Integer id);
	//根据部门id查询员工
	public List<User> findUserByDeptId(Integer id);
	public List<UserVm> findUserVmByPatientId(Integer id);
}
