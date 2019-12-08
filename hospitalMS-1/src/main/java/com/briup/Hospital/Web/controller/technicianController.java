package com.briup.Hospital.Web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.Hospital.Service.PhysicalExamService;
import com.briup.Hospital.Service.UserPatientService;
import com.briup.Hospital.bean.Physicalexam;
import com.briup.Hospital.bean.UserPatient;

@Controller
public class technicianController {
    
	@Autowired
	public PhysicalExamService physicalExamService;
	@Autowired
	public UserPatientService userPatientService;
	
	@RequestMapping("/physicalexam/findAllphysicalExam")
	public String findAllphysicalExam(HttpSession session) {
		List<Physicalexam> allPhysicalexam = physicalExamService.findAllPhysicalexam();
		session.setAttribute("peList", allPhysicalexam);
		return "dictionary/physicalexam";
	}
	
	/**
	 * 保存或修改
	 * @param physicalexam
	 * @return
	 */
	@RequestMapping("/physicalexam/saveOrUpdatePe")
	public String saveOrUpdatePe(Physicalexam physicalexam) {
		physicalExamService.saveOrUpdatePhysicalexam(physicalexam);
		return "dictionary/physicalexam";
	}
	/**
	 * 批量删除
	 * @param physicalexam
	 * @return
	 */
	@RequestMapping("/physicalexam/deletePhysicalExams")
	@ResponseBody
	public String deletePhysicalExams(int[] ids) {
		for (int id : ids) {
			physicalExamService.deletePhysicalexam(id);
		}
		return "操作成功";
	}
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/physicalexam/deletePhysicalExam")
	@ResponseBody
	public String deletePhysicalExam(int id) {
			physicalExamService.deletePhysicalexam(id);
		return "操作成功";
	}
	/**
	 * 修改
	 * @param id
	 * @return
	 */
	@RequestMapping("/physicalexam/findphysicalExamById")
	@ResponseBody
	public Physicalexam findphysicalExamById(int id) {
		System.out.println("controllwr"+id);
		return physicalExamService.findPhysicalexamById(id);
	}
	/**
	 * 录入检查结果
	 * @param id
	 * @return
	 */
	@RequestMapping("/physicalexam/entryCheckResult")
	public String entryCheckResult() {
		return "medicalTechnology/enterInspectionResult";
	}

	@RequestMapping("/physicalexam/findphysicalExams")
	@ResponseBody
	public List<Physicalexam> findphysicalExams() {
		return physicalExamService.findAllPhysicalexam();
	}
	
	/**
	 * 录入信息
	 */
	@RequestMapping("/physicalexam/saveOrUpdateUserPatient")
	public String saveOrUpdateUserPatient(UserPatient userPatient) {
		userPatientService.updateUserPatient_Technician(userPatient);
		return "medicalTechnology/enterInspectionResult";
	}
}
