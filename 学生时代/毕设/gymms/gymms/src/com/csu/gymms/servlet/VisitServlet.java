package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csu.gymms.dao.impl.VisitorInfoImpl;
import com.csu.gymms.entity.VisitOrderBean;
import com.csu.gymms.entity.VisitorInfoBean;

public class VisitServlet extends HttpServlet {

	
	public VisitServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String ids = request.getParameter("ids");
		VisitorInfoImpl vi = new VisitorInfoImpl();
		if("001".equals(ids)) {
			String ordername = request.getParameter("vname");
			String time = request.getParameter("start");
			String tel = request.getParameter("tel");
			VisitOrderBean vb =new VisitOrderBean();
			vb.setName(ordername);
			vi.addVisitorOrder(vb);
			request.getRequestDispatcher("visitor_order.jsp").forward(request, response);
		}
		if("002".equals(ids)) {
			String cardid = request.getParameter("cid");
			String name = request.getParameter("vname");
			String tel = request.getParameter("cardname");
			String address = request.getParameter("cstate");
			String starttime = request.getParameter("start");
			String overtime = request.getParameter("over");
			VisitorInfoBean vb =new VisitorInfoBean();
			vb.setCardid(cardid);
			vb.setName(name);
			vb.setTel(tel);
			vb.setAddress(address);
			vb.setStarttime(starttime);
			vb.setOvertime(overtime);
			vi.addVisitorInfo(vb);
			request.getRequestDispatcher("visitor_register.jsp").forward(request, response);
		}
	}

	
	public void init() throws ServletException {
		
	}

}
