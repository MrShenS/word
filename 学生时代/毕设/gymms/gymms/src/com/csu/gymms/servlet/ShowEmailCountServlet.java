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
import com.csu.gymms.service.SendEmailService;

public class ShowEmailCountServlet extends HttpServlet {
	
	/**
	 * Constructor of the object.
	 */
	public ShowEmailCountServlet() {
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
	//	System.out.println("request===" +request);
	//	System.out.println("response===" +response);
        if(request != null && response != null)
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
		   int count =0;
		   
		   request.setCharacterEncoding("UTF-8");
		      response.setContentType("text/html;charset=UTF-8 ");
		      String userType =(String)request.getSession().getAttribute("userType");
		      UsersBean user=(UsersBean)request.getSession().getAttribute("user");
		      ArrayList<EmailBean> eal = null;
		      if("1".equals(userType)){
		    	 eal =SendEmailService.reserveEmail("2",user.getUserid());
		      }else if("2".equals(userType)){
		    	  eal =SendEmailService.reserveEmail("1",user.getUserid());
		      }
		      if(eal != null){
		      request.getSession().setAttribute("EmailList", eal);
		      request.getSession().setAttribute("EmailListSize", eal.size());
		      } else {
		    	  request.getSession().setAttribute("EmailList", null);
		    	  request.getSession().setAttribute("EmailListSize", 0);
		      }
    if(eal != null){
		 for(EmailBean e : eal){
			 if("0".equals(e.getRead())){
				 count++ ;				 
			 }
		 }		  
     } 
		PrintWriter out= response.getWriter();
		out.write(String.valueOf(count));
		out.close();
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
