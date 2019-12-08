package com.briup.Hospital.Web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.Hospital.Service.DepartmentService;
import com.briup.Hospital.Service.PatientService;
import com.briup.Hospital.Service.UserPatientService;
import com.briup.Hospital.Service.UserService;
import com.briup.Hospital.bean.Department;
import com.briup.Hospital.bean.Patient;
import com.briup.Hospital.bean.User;
import com.briup.Hospital.bean.UserPatient;
import com.briup.Hospital.bean.extend.UserPatientVM;
import com.briup.Hospital.util.ServiceException;

@Controller
public class ChargeManController {

	@Autowired
	private UserPatientService userPatientService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private PatientService patientService;
	@Autowired
	private UserService  userService;
	
	@RequestMapping("ChargeMan/findUserPatient")
	public String findUserPatient(HttpSession session) {
		List<UserPatientVM> userPatientVM = userPatientService.findAllUserPatientVM();
		session.setAttribute("userPatientVM", userPatientVM);
		return "charge/registration";
	}
	
	@RequestMapping("dept/findDepts")
	@ResponseBody
	public List<Department> findDepts() {
		return departmentService.findAllDepts();
	}
	
	@RequestMapping("patient/findPatients")
	@ResponseBody
	public List<Patient> findPatients() {
		return patientService.findAllPatients();
	}
	
	@RequestMapping("user/findUserByDeptId")
	@ResponseBody
	public List<User> findUserByDeptId(int id) {
		return userService.findUserByDeptId(id);
	}
	
	@RequestMapping("ChargeMan/saveOrUpdateUserPatient")
	@ResponseBody
	public String saveOrUpdateUserPatient(UserPatient userPatientVM) {
		System.out.println(userPatientVM.getId());
		userPatientService.saveUserPatient_ChargeMan(userPatientVM);
		System.out.println("門診存儲成功");
		return "操作成功";
	}
	
	@RequestMapping("ChargeMan/findAllPatient")
	public String findAllPatient(HttpSession session) {
		/*patientList*/
		List<Patient> list = patientService.findAllPatients();
		session.setAttribute("patientList", list);
		return "charge/rechargeAndBackFee";
	}
	
	@RequestMapping("ChargeMan/rechargeAndBackFee")
	@ResponseBody
	public String rechargeAndBackFee(Double price,int id,String operation) throws ServiceException {
		System.out.println(id);
		System.out.println(price);
       		Patient patient = patientService.findPatientById(id);
       		System.out.println(patient.getId());
       		if(operation.equals("充值")) {
       			patient.setBalance(patient.getBalance()+price);
       			patientService.SaveOrUpdatePatient(patient);
       		}else {
       			patient.setBalance(patient.getBalance()-price);
       			patientService.SaveOrUpdatePatient(patient);
       		}
       		return "操作成功";
	}
	
	@RequestMapping("/userPatient/deleteUserPatients")
	@ResponseBody
	public String deleteUserPatients(int[] ids) {
		for (int id : ids) {
			userPatientService.deleteUserPatient(id);
		}
		return "批量删除成功";
	}
	@RequestMapping("/userPatient/deleteUserPatient")
	@ResponseBody
	public String deleteUserPatient(int id) {
			userPatientService.deleteUserPatient(id);
		return "删除成功";
	}
	
/*	@RequestMapping("/ChargeMan/findUserPatient_JS")
	@ResponseBody
	public UserPatient findUserByDeptId(int id) {
		return userService.findUserByDeptId(id)
	}*/
}
