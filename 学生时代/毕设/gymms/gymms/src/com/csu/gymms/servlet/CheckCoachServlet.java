package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csu.gymms.service.CoachInfoService;

public class CheckCoachServlet extends HttpServlet {

	
	public CheckCoachServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String  cno = request.getParameter("cno");
		CoachInfoService cis = new CoachInfoService();
		cis.deleteCoachInfo(cno);
		ArrayList clist = cis.getCoachInfo();
		request.getSession().setAttribute("clist", clist);
		request.getRequestDispatcher("coach_list.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String op = request.getParameter("text");
			int flag = Integer.parseInt(request.getParameter("flag"));
			CoachInfoService cis = new CoachInfoService();
			ArrayList clist = cis.fuzzySearchCoachInfo(flag, op);
			request.getSession().setAttribute("clist", clist);
			request.getRequestDispatcher("coach_list.jsp").forward(request, response);
	}

	
	public void init() throws ServletException {
		
	}

}
