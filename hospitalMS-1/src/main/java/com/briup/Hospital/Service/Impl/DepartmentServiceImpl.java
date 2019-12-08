package com.briup.Hospital.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.Hospital.Service.DepartmentService;
import com.briup.Hospital.bean.Department;
import com.briup.Hospital.bean.DepartmentExample;
import com.briup.Hospital.dao.DepartmentMapper;
import com.briup.Hospital.util.ServiceException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Override
	public PageInfo<Department> findAllDept(int curPage, int size) throws ServiceException {
		PageHelper.startPage(curPage, size);
		return new PageInfo<>(departmentMapper.selectByExample(new DepartmentExample()));
	}

	@Override
	public void saveOrUpdate(Department dept) {
		// TODO Auto-generated method stub
		Department key = departmentMapper.selectByPrimaryKey(dept.getId());
		if(key==null) {
			departmentMapper.insertSelective(dept);
		}else {
			departmentMapper.updateByPrimaryKeySelective(dept);
		}
		
	}

	@Override
	public void deleteDept(Integer id) throws ServiceException {
		// TODO Auto-generated method stub
		departmentMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public Department findDeptById(Integer id) throws ServiceException {
		// TODO Auto-generated method stub
		return departmentMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Department> findAllDepts() {
		// TODO Auto-generated method stub
		return departmentMapper.selectByExample(new DepartmentExample());
	}

}
