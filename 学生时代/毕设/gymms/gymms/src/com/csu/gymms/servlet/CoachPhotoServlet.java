package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csu.gymms.entity.CoachBean;
import com.csu.gymms.service.CoachInfoService;

public class CoachPhotoServlet extends HttpServlet {

	
	public CoachPhotoServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy();
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList clist = CoachInfoService.getCoachInfo();
		String src = request.getParameter("src");
		System.out.println(src);
		for(int i = 0; i < clist.size(); i++) {
			CoachBean cb = (CoachBean)clist.get(i);
			if(src.equals(cb.getPhotofile())) {
				System.out.println(src);
				request.getSession().setAttribute("cb", cb);
				request.getRequestDispatcher("coachinfo.jsp").forward(request, response);
			}
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	
	public void init() throws ServletException {
		
	}

}
