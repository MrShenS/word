package com.csu.gymms.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.csu.gymms.dao.impl.PageOperationDaoImpl;
import com.csu.gymms.service.CoachInfoService;
import com.csu.gymms.service.MangerUserService;

public class UserInfoServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public UserInfoServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String userid = request.getParameter("userid");
			System.out.println(userid);
			
			HttpSession session = request.getSession();
			 int s_countpage = -1;

			MangerUserService ms = new MangerUserService();
			ms.deleteUserInfo(Integer.parseInt(userid));
			ArrayList userlist = ms.getAllUserInfo(10,1);
			PageOperationDaoImpl podi= (PageOperationDaoImpl)userlist.get(userlist.size() - 1);
			s_countpage =podi.getPagecount();
			
			
			userlist.remove(userlist.size()-1);
			session.setAttribute("s_countpage",s_countpage);
			session.setAttribute("podi", podi);
			
			request.getSession().setAttribute("userlist", userlist);
			request.getRequestDispatcher("user_list.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		    request.setCharacterEncoding("UTF-8");
		    String op = request.getParameter("text");
			int flag = Integer.parseInt(request.getParameter("flag"));
			MangerUserService mus = new MangerUserService();
			ArrayList userlist = mus.fuzzyUserInfo(flag, op);
			request.getSession().setAttribute("userlist", userlist);
			request.getRequestDispatcher("user_list.jsp").forward(request, response);
	}

	
	public void init() throws ServletException {
		
	}

}
