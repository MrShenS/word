package com.briup.Hospital.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.briup.Hospital.bean.Department;
import com.briup.Hospital.util.ServiceException;
import com.github.pagehelper.PageInfo;

@Service
public interface DepartmentService {
	public PageInfo<Department> findAllDept(int curPage,int size)throws ServiceException;
	public void saveOrUpdate(Department dept);
	public void deleteDept(Integer id)throws ServiceException;
	public Department findDeptById(Integer id)throws ServiceException;
	public List<Department> findAllDepts();
}
