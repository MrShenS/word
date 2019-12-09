package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csu.gymms.service.CoachInfoService;
import com.csu.gymms.service.MemberService;

public class CheckMemberServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CheckMemberServlet() {
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

		String  mno = request.getParameter("mno");
		MemberService ms = new MemberService();
		ms.deleteMember(mno);
		ArrayList mList = ms.getMember();
		request.getSession().setAttribute("mList", mList);
		request.getRequestDispatcher("v_list.jsp").forward(request, response);
	
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
		String op = request.getParameter("text");
		int flag = Integer.parseInt(request.getParameter("flag"));
		MemberService ms = new MemberService();
		ArrayList mList = ms.fuzzySearchMember(flag, op);
		request.getSession().setAttribute("mList", mList);
		request.getRequestDispatcher("v_list.jsp").forward(request, response);
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
