package com.briup.Hospital.Web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("nurse")
public class nurseController {
   
	@RequestMapping("toInspectionSelect")
	public String toInspectionSelect() {
		return "nurse/insepectionSelect";
	}
	
	@RequestMapping("toMedicalRecordSelect")
	public String toMedicalRecordSelect() {
		return "nurse/medicalRecordSelect";
	}
	

	
}
