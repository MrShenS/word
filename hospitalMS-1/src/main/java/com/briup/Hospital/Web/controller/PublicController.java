package com.briup.Hospital.Web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.briup.Hospital.Service.PatientDrugService;
import com.briup.Hospital.Service.PatientPhysicalexamService;
import com.briup.Hospital.Service.UserPatientService;
import com.briup.Hospital.bean.UserPatient;
import com.briup.Hospital.bean.extend.PatientDrugVM;
import com.briup.Hospital.bean.extend.PatientPhysicalexamVM;
import com.briup.Hospital.bean.extend.UserPatientVM;


@Controller
public class PublicController {
   
	@Autowired
	private PatientDrugService patientDrugService;
	@Autowired
	private PatientPhysicalexamService patientPhysicalexamService;
	
	@Autowired
	private UserPatientService userPatientService;
	
	@RequestMapping("/recipe/findPatientDrugById")
	public String findPatientDrugById(int id,HttpSession session) {
//		System.out.println(id);
		List<PatientDrugVM> list = patientDrugService.findPatientDrugVMByPatientId(id);
		session.setAttribute("findPatientDrugVMByPatientId", list);
		return "nurse/recipeResult"; 
	}
	@RequestMapping("/inspection/findPatientPhysicalExam")
	public String findPatientPhysicalExam(int id,HttpSession session) {
//		System.out.println(id);
		List<PatientPhysicalexamVM> list = patientPhysicalexamService.selectPatientPhysicalexamByPatientId(id);
		session.setAttribute("findPatientPhysicalExam", list);
		return "nurse/inspectionResult"; 
	}
	
	@RequestMapping("/medicalRecord/findUserPatientByPatientId")
	public String findUserPatientByPatientId(int id,HttpSession session) {
//		System.out.println(id);
		UserPatientVM findUserPatientByPatientId = userPatientService.findUserPatientByPatientId_1(id);
		session.setAttribute("userPatient", findUserPatientByPatientId);
		return "nurse/medicalRecordResult"; 
	}
	
	
	
}
