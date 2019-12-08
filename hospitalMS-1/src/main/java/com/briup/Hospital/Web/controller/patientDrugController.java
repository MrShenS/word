package com.briup.Hospital.Web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.Hospital.Service.PatientDrugService;
import com.briup.Hospital.bean.PatientDrug;

@Controller
@RequestMapping("/patientDrug")
public class patientDrugController {

	@Autowired
	private PatientDrugService patientDrugService;
	@RequestMapping("/savePatientDrug")
	@ResponseBody
	public String savePatientDrug(PatientDrug patientDrug) {
	       patientDrugService.savePatientDrug(patientDrug);
	       return "操作成功";
	    		   
	}
}
