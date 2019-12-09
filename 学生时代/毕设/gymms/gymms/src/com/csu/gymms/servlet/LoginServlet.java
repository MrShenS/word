package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csu.gymms.entity.EmailBean;
import com.csu.gymms.entity.UsersBean;
import com.csu.gymms.service.LoginService;
import com.csu.gymms.service.MangerUserService;
import com.csu.gymms.service.SendEmailService;

public class LoginServlet extends HttpServlet {
  
	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
           doPost(request,response);
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
         response.setContentType("text/html;charset=UTF-8 ");
         String username =request.getParameter("username");
         String password =request.getParameter("password");
         String in_validate=request.getParameter("validate");
         String user_type=request.getParameter("grant");
         request.getSession().setAttribute("userType",user_type);
         String validate=(String)request.getSession().getAttribute("code");
          if(!(validate.toUpperCase().trim().equals(in_validate.toUpperCase()))){
        	  response.getWriter().print("<script>alert('ÑéÖ¤ÂëÊäÈë´íÎó£¬ÇëÖØÐÂµÇÂ½£¡');window.location='login.jsp'</script>");	
        	  return;
          }
         UsersBean user = new UsersBean();
         user.setUsername(username);
         user.setPassword(password);
         user.setTypeid(user_type);
         boolean flag= LoginService.validate_login(user);
		 if(flag){
			 ArrayList<UsersBean> als =MangerUserService.getAllUserInfo();
			 for(UsersBean senduser : als){
				if(senduser.getUsername().equals(username)){
					request.getSession().setAttribute("user",senduser);
				}
				 
			 }
			 
			 request.getSession().setAttribute("Is_login",true);
			 request.getSession().setAttribute("username",username);
			 
			 ArrayList<UsersBean> al =MangerUserService.getAllUserInfo();
			 request.getSession().setAttribute("userList", al);		 
			 request.getRequestDispatcher("index.jsp").forward(request,response);
		 }else{			 
			 response.getWriter().print("<script>alert('µÇÂ½Ê§°ÜÇëÖØÐÂµÇÂ½£¡');window.location='login.jsp'</script>");	
		 }
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
