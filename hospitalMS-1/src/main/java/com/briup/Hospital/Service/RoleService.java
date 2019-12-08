package com.briup.Hospital.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.briup.Hospital.bean.Department;
import com.briup.Hospital.bean.Role;
import com.briup.Hospital.util.ServiceException;
import com.github.pagehelper.PageInfo;
@Service
public interface RoleService {
	public List<Role> findAllRole();
	public Role findRoleById(int id);
	public Role findRoleByName(String name);
}
