package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csu.gymms.entity.CardInfoBean;
import com.csu.gymms.entity.MemberBean;
import com.csu.gymms.service.CardInfoService;
import com.csu.gymms.service.MemberService;

public class SellCardServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SellCardServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		MemberBean mb = new MemberBean();
		mb.setMno(request.getParameter("cardid"));
		mb.setMname(request.getParameter("mname"));
		mb.setId(request.getParameter("id"));
		if("1".equals(request.getParameter("mgroup"))) {
			mb.setMgroup("1");
		} else {
			mb.setMgroup("2");
		}
		mb.setSex(request.getParameter("sex"));
		mb.setBirthday(request.getParameter("birthday"));
		mb.setQq(request.getParameter("qq"));
		mb.setTelphone(request.getParameter("telphone"));
		mb.setPhone(request.getParameter("phone"));
		
		CardInfoBean cib = new CardInfoBean();
		cib.setCardid(request.getParameter("cardid"));
		cib.setCardtype(request.getParameter("cardtype"));
		cib.setCardstate(request.getParameter("cardstate"));
		cib.setMoney(request.getParameter("money"));
		cib.setStartdate(request.getParameter("startdate"));
		cib.setOverdate(request.getParameter("overdate"));
		cib.setContent(request.getParameter("content"));
		
		MemberService mbs = new MemberService(); 
		CardInfoService cis = new CardInfoService();
		
		mbs.addMember(mb);
		cis.insertCard(cib);
		request.getRequestDispatcher("v_c_sell.jsp").forward(request, response);
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
