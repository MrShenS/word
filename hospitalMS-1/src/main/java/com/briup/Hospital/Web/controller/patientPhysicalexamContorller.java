package com.briup.Hospital.Web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.Hospital.Service.PatientPhysicalexamService;
import com.briup.Hospital.bean.PatientPhysicalexam;

@Controller
public class patientPhysicalexamContorller {
   
	@Autowired
	private PatientPhysicalexamService patientPhysicalexamService;
	
	@RequestMapping("/patientPhysicalexam/savePatientPhysicalexam")
	@ResponseBody
	public String savePatientPhysicalexam(PatientPhysicalexam pp) {
		patientPhysicalexamService.savePatientPhysicalexam(pp);
		return "操作成功";
	}
	
}
