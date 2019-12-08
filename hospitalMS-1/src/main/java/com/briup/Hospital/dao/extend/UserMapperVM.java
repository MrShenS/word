package com.briup.Hospital.dao.extend;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.briup.Hospital.bean.User;
import com.briup.Hospital.bean.extend.UserVm;

@Mapper
public interface UserMapperVM {
	public List<UserVm> findUserWithDept();
	public UserVm findUserWithDeptAndRoleById(Integer id);
	public UserVm findUserByName(String name);
}
