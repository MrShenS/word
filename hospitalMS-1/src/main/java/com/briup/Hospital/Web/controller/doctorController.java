package com.briup.Hospital.Web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.Hospital.Service.PhysicalExamService;
import com.briup.Hospital.Service.UserPatientService;
import com.briup.Hospital.bean.Physicalexam;
import com.briup.Hospital.bean.User;
import com.briup.Hospital.bean.UserPatient;
import com.briup.Hospital.bean.extend.UserPatientVM;

@Controller
@RequestMapping("/doctor")
public class doctorController {
   @Autowired
   private UserPatientService userPatientService;
   
   @Autowired
   private PhysicalExamService physicalExamService;
   /**
    * 查询未处理的病人   
    * @param session
    * @return
    */ 
   @RequestMapping("/findUnDealdPatient")
   public String findUnDealdPatient(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
	   
	   

/*		//获取所有cookie
		Cookie[] cookies = request.getCookies();
		System.out.println(cookies);
		//遍历cookie
		for(Cookie cookie : cookies){
			//获取cookie的名字
			String cookieName = cookie.getName();
			System.out.println(cookieName);  //新浪的cookie文件会传过来给你吗？
			if("JSESSIONID".equalsIgnoreCase(cookieName)){
				//获取cookie 的数据
				System.out.println(cookieName+" : "+ cookie.getValue() );
			}
		}*/
	   
	   
	   System.out.println("设置cook在之后之后"+session.equals(request.getSession()));
	   System.out.println("session.getAttribute(\"JSESSIONID\"):"+session.getAttribute("JSESSIONID"));
	   User user = (User) session.getAttribute("user");
	   List<UserPatientVM> UserPatientVMList = userPatientService.findUndealdPatient(user.getId());
	   session.setAttribute("UserPatientVMList", UserPatientVMList);
	   return "doctor/unDealdPatient";
	   
   }
   /**
    * 查询已处理的病人
    * */
   @RequestMapping("/findDealdPatient")
   public String findDealdPatient(HttpSession session) {
	   User user = (User) session.getAttribute("user");
	   System.out.println(user);
	   List<UserPatientVM> UserPatientVMList = userPatientService.finddealdPatient(user.getId());
	   session.setAttribute("findDealdPatient", UserPatientVMList);
	return "doctor/dealdPatient";
	   
   }
   /**
    * 开处方
    * @param session
    * @return
    */
   @RequestMapping("/toOpenRecipe")
   public String toOpenRecipe(HttpSession session) {
	   System.out.println("开处方");
	  /* User user = (User) session.getAttribute("user");
	   List<UserPatientVM> UserPatientVMList = userPatientService.finddealdPatient(user.getId());
	   session.setAttribute("findDealdPatient", UserPatientVMList);*/
	   return "doctor/openRecipe";
	   
   }
   
   
   @RequestMapping("/toRecipeSelect")
   public String toRecipeSelect(HttpSession session) {
	   return "nurse/recipeSelect";
   }
   
   /**
    * 开检查
    */
   @RequestMapping("/toOpenInspection")
   public String OpenInspection() {
	return "doctor/openInspection";
	   
   }
   
   @RequestMapping("/findphysicalExams")
   @ResponseBody
   /*   physicalexam*/
   public  List<Physicalexam>  findphysicalExams() {
	return physicalExamService.findAllPhysicalexam();
   }
   
   
   /**
    * 診斷病人
    */
   @RequestMapping("/toDiagnosePatient")
   public String diagnosePatient(HttpSession session) {
	return "doctor/diagnosePatient";
   }
   
   @RequestMapping("/saveOrUpdateUserPatient")
   @ResponseBody
   public  String  saveOrUpdateUserPatient(UserPatient userPatient) {
	   System.out.println(userPatient);
	   userPatient.setDate(new Date());
	   userPatientService.saveOrUpdateUserPatient(userPatient);
	return "诊断完成";
   }
   
   /**
    * 处理病人
    */
  @RequestMapping("/updatePatientStatus")
  public String updatePatientStatus(int[] ids) {
	  System.out.println("处理病人");
	  for (int id : ids) {
		userPatientService.updateUndealdPatient(id);
	}
	  return "redirect:/doctor/findUnDealdPatient";
  }
   
	
}
