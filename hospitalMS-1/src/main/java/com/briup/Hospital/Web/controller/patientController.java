package com.briup.Hospital.Web.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.Hospital.Service.PatientService;
import com.briup.Hospital.bean.Patient;
import com.briup.Hospital.util.ServiceException;

@Controller
public class patientController {
 
	@Autowired
	private PatientService patientService;
	
	@RequestMapping("/patient/findAllPatient")
	public String findAllPatient(HttpSession httpSession) {
		List<Patient> list = patientService.findAllPatients();
		httpSession.setAttribute("patientList", list);
		return "patientInfo/patient";
	}
/*	@RequestMapping("/patient/findAllPatient_1")
	@ResponseBody
	public String findAllPatient_1(HttpSession httpSession) {
		findAllPatient(httpSession);
		return "patientInfo/patient";
	}*/
	
	
	
	/**
	 * 添加修改病人信息
	 * @param patient
	 * @return
	 * @throws ServiceException
	 */
	@RequestMapping("/patient/saveOrUpdatePatient")
	public String saveOrUpdatePatient(Patient patient,String birthS) throws ServiceException {
		System.out.println("birthS:"+birthS);
		Date valueOf = Date.valueOf(birthS);
		System.out.println("val:"+valueOf);
		patient.setBirth(valueOf);
		patientService.SaveOrUpdatePatient(patient);
		return "redirect:/patient/findAllPatient";
	}
	
	/**
	 * 批量删除病人信息
	 */
	@RequestMapping("/patient/deletePatients")
	public String deletePatients(int[] ids) {
		for (int id : ids) {
			patientService.deletePatient(id);
		}
		return "redirect:/patient/findAllPatient";
	}
	/**
	 * 删除病人信息
	 * @param id
	 * @return
	 */
	@RequestMapping("/patient/deletePatient")
	public String deletePatient(int id) {
			patientService.deletePatient(id);
		return "redirect:/patient/findAllPatient";
	}
	/**
	 * 查询病人信息
	 */
	@RequestMapping("/patient/findPatientById")
	@ResponseBody
	public Patient findPatientById(int id) {
		Patient patient = patientService.findPatientById(id);
		/*java.util.Date date = patient.getBirth();
		long time = date.getTime();
		Date date2 = new Date(time);
		int month = date.getMonth();
		int year = date.getYear();
		int date3 = date.getDate();
		String date4=year+"-"+month+"-"+date3;*/
		
		return patient;
	}
	
	
	
	
	
}
