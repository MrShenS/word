package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csu.gymms.entity.DeviceInfoBean;
import com.csu.gymms.service.DevicesService;
import com.csu.gymms.util.Tools;

public class DeviceServlet extends HttpServlet {

	public DeviceServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 删除信息
		String id1 = request.getParameter("id");
		String id2 = request.getParameter("ids");
		System.out.println(id2);
		
		if (id1 != null) {
			String cno = Tools.convert(id1);
			int cn = Integer.valueOf(cno);
			
			System.out.println(cn);
			new DevicesService().deleteDevicesSucessDao(cn);

			request.setCharacterEncoding("UTF-8");
			
			response.setCharacterEncoding("text/html; charset=UTF-8");
			ArrayList al = DevicesService.getDevices();
			request.getSession().setAttribute("al", al);
			request.getRequestDispatcher("apparatus-check.jsp").forward(request,
					response);


		}
		
		//修改信息
		else if(id2!=null){
			String cno = Tools.convert(id2);
			
			ArrayList al = DevicesService.getDevices();
			for (int i = 0; i < al.size(); i++) {

				DeviceInfoBean db = (DeviceInfoBean) al.get(i);

				if (db.getDeviceid().equals(cno)){
					request.getSession().setAttribute("db", db);
					request.getRequestDispatcher("revamp_app.jsp").forward(
							request, response);
				}
			}
			
			
			
		}
		
		else{
			

			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("text/html; charset=UTF-8");
			ArrayList al = DevicesService.getDevices();
			System.out.println(al.size());
			request.getSession().setAttribute("al", al);
			request.getRequestDispatcher("apparatus-check.jsp").forward(request,
					response);

			
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		// String name= Tools.convert(name);
		
		ArrayList al = DevicesService.getDevices();

		System.out.println(al.size());
		
		for (int i = 0; i < al.size(); i++) {

			DeviceInfoBean db = (DeviceInfoBean) al.get(i);

			if (db.getDevicename().equals(name)) {
				request.getSession().setAttribute("db", db);
				request.getRequestDispatcher("apparatus-check-1.jsp").forward(
						request, response);
			}
		}

		// 增加信息
		request.setCharacterEncoding("UTF-8");

		response.setCharacterEncoding("text/html; charset=UTF-8");

		String hidden = request.getParameter("hidden");

		String name1 = request.getParameter("ap");
		String hao = request.getParameter("hao");

		String principal = request.getParameter("principal");
		String number = request.getParameter("number");
		String entertime = request.getParameter("entertime");

		String lifetime = request.getParameter("lifetime");
		String news = request.getParameter("news");

		DeviceInfoBean db = new DeviceInfoBean();

		db.setDevicename(name1);
		db.setDeviceid(hao);
		db.setPrincipal(principal);
		System.out.println(principal);
		db.setRoom(number);
		db.setEntrancetime(entertime);
		db.setUsetime(lifetime);
		db.setBrief(news);

     System.out.println("*********************************"+news);
		
		if ("001".equals(hidden)) {
			new DevicesService().addDevices(db);

			
			request.getRequestDispatcher("apparatus-check.jsp").forward(
					request, response);

		}

		// 修改信息
		if ("002".equals(request.getParameter("hidd"))) {
  
			System.out.println("修改信息------------------------->");
			
			new DevicesService().amendDivices(db);
               request.getRequestDispatcher("revamp_app.jsp").forward(request,
		      response);

		}

	}

	public void init() throws ServletException {

	}

}
