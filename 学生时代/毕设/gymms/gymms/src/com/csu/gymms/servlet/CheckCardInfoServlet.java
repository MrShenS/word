package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csu.gymms.entity.CardInfoBean;
import com.csu.gymms.service.CardInfoService;

public class CheckCardInfoServlet extends HttpServlet {

	public CheckCardInfoServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String info = request.getParameter("info");
		System.out.println(info);
		String op = request.getParameter("op");
		System.out.println(op);
		String id = request.getParameter("id");
		ArrayList clist = new CardInfoService().getCardInfo();
		for(int i = 0; i <clist.size(); i++) {
			CardInfoBean cb = (CardInfoBean)clist.get(i);
			if("1".equals(op)) {
				System.out.println(cb.getCardid());
				if(info.equals(cb.getCardid())) {
					System.out.println(cb.getCardid());
					request.getSession().setAttribute("cb", cb);	
					response.sendRedirect("v-c-set-1.jsp");
				}
			} 
			if("2".equals("op")){
				if(info.equals(cb.getMid())) {
					request.getSession().setAttribute("cb", cb);
					response.sendRedirect("v-c-set-1.jsp");
				}
			}
		}
		
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	public void init() throws ServletException {
		
	}

}
