package com.briup.Hospital.Web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.Hospital.Service.DepartmentService;
import com.briup.Hospital.Service.RoleService;
import com.briup.Hospital.Service.UserService;
import com.briup.Hospital.bean.Department;
import com.briup.Hospital.bean.Role;
import com.briup.Hospital.bean.User;
import com.briup.Hospital.bean.extend.UserVm;
import com.briup.Hospital.util.ServiceException;
import com.github.pagehelper.PageInfo;

@Controller
public class DictionaryManagerManController {
   @Autowired
   private DepartmentService departmentService;
   @Autowired
   private UserService userService;
   
   @Autowired
   private RoleService roleService;
   
   
   
   
   
   @RequestMapping("/dept/findAllDept/{id}")
   public String findAllDept(@PathVariable int id,HttpSession session ) throws ServiceException {
	   PageInfo<Department> findAllDept = departmentService.findAllDept(id, 4);
	   session.setAttribute("deptInfo", findAllDept);
	return "dictionary/dept";
	   
   }
   
   @RequestMapping("/dept/saveOrupdateDept")
   public String saveOrupdateDept(Department department) {
	   departmentService.saveOrUpdate(department);
	return "redirect:/dept/findAllDept/1";
   }
   
   @RequestMapping("/dept/deleteDepts")
   public String deleteDepts(int[] ids) throws ServiceException {
	   for (int id : ids) {
		departmentService.deleteDept(id);
	}
	   return "redirect:/dept/findAllDept/1";
   }
   @RequestMapping("/dept/deleteDept")
   public String deleteDept(int id) throws ServiceException {
		   departmentService.deleteDept(id);
	   return "redirect:/dept/findAllDept/1";
   }
   /**
    * 查询需要修改的信息
    * @param id
    * @return
    * @throws ServiceException
    */
   @RequestMapping("/dept/findDeptById")
   @ResponseBody
   public Department findDeptById(int id) throws ServiceException {
	  return departmentService.findDeptById(id);
   }
   
   
   
   /**
    * 职工去留
    */
   @RequestMapping("/user/findUserWithDept/{id}")
   public String findUserWithDept(@PathVariable int id,HttpSession httpSession) {
	   PageInfo<UserVm> info = userService.findUserWithDept(id, 4);
	   httpSession.setAttribute("userInfo", info);
	return "/dictionary/user";
   }
   
   /**
    * 添加员工
    */
   @RequestMapping("/user/saveOrUpdate")
   public String saveOrUpdate(User user,String birthS) {
	   user.setBirth(java.sql.Date.valueOf(birthS));
	   userService.saveOrUpdate(user);
	return "redirect:/user/findUserWithDept/1";
	   
   }
   
   @RequestMapping("/role/findAllRole")
   @ResponseBody
   public List<Role> findAllRole() {
	   return roleService.findAllRole();
   }
   /**
    * 批量删除
 * @throws ServiceException 
    */
   @RequestMapping("/user/deleteUsers")
   public String deleteUsers  (int[] ids) throws ServiceException {
	   for (int id : ids) {
		userService.deleteUser(id);
	}
	   return "redirect:/user/findUserWithDept/1";
   }
   
   
   
   /**
    * 单行删除
    * @param ids
    * @return
    * @throws ServiceException
    */
   @RequestMapping("/user/deleteUser")
   public String deleteUser(int id) throws ServiceException {
		   userService.deleteUser(id);
	   return "redirect:/user/findUserWithDept/1";
   }
   
   /**
    * 修改前的查询
    */
   @RequestMapping("/user/findUserWithDeptAndRoleById")
   @ResponseBody
   public UserVm findUserWithDeptAndRoleById(int id) {
	   return userService.findUserWithDeptAndRoleById(id);
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}
