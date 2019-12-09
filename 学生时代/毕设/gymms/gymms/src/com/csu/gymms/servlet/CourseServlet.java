package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csu.gymms.entity.CourseBean;
import com.csu.gymms.service.CoachInfoService;
import com.csu.gymms.service.CourseService;
import com.csu.gymms.service.DevicesService;
import com.csu.gymms.service.FiledInfoService;

public class CourseServlet extends HttpServlet {


	public CourseServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CourseService cs = new CourseService();
		ArrayList courseNameList = cs.getCourseName();
		request.getSession().setAttribute("courseNameList", courseNameList);
		request.getRequestDispatcher("curriculum-check.jsp").forward(request, response);

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		if("001".equals(id)){			
		    String text = request.getParameter("coursename");
		    CourseService cs = new CourseService();
		    ArrayList courseList = cs.getCourse(text);
		    for(int i = 0; i < courseList.size(); i++) {		    
			    CourseBean cb = (CourseBean)courseList.get(i);
			    if(text.equals(cb.getCoursename())) {		    	
				    request.getSession().setAttribute("cb", cb);
				    request.getRequestDispatcher("curriculum-check.jsp").forward(request, response);
			    }
		    }
		}	
		if("002".equals(id)){			
		    ArrayList coachList = CoachInfoService.getCoachInfo();
		    ArrayList roomList = FiledInfoService.searchFieldInfo();
		    ArrayList deviceList = DevicesService.getDevices();
		   
		    request.getSession().setAttribute("coachList", coachList);
		    request.getSession().setAttribute("roomList", roomList );
		    request.getSession().setAttribute("deviceList",deviceList );
		    
			request.getRequestDispatcher("add_curr.jsp").forward(request, response);
		}
		if("003".equals(id)){
			CourseBean cb = new CourseBean();
			cb.setCoursename(request.getParameter("coursename"));
			cb.setRoomname(request.getParameter("roomname"));
			cb.setCoachname(request.getParameter("coachname"));
			cb.setCarpnumber(request.getParameter("carpnumber"));
			cb.setDevicename(request.getParameter("devicename"));
			cb.setBenifits(request.getParameter("benifits"));
			CourseService cs = new CourseService();
			cs.addCourse(cb);
			request.getRequestDispatcher("add_curr.jsp").forward(request, response);
		}
	}  

	
	public void init() throws ServletException {
		
	}

}
