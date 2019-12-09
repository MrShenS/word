package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.csu.gymms.entity.EmailBean;
import com.csu.gymms.entity.UsersBean;
import com.csu.gymms.service.SendEmailService;

public class EmailOperateServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EmailOperateServlet() {
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
        
        String operate = request.getParameter("cz");
        HttpSession session =request.getSession();     
		PrintWriter out = response.getWriter();
		String e_id=request.getParameter("ids");
		 String userType =(String)request.getSession().getAttribute("userType");
		 UsersBean user=(UsersBean)request.getSession().getAttribute("user");
		//查看邮件
		if(operate.equals("1")){
			
			if(SendEmailService.modifyReadState(e_id,user.getUserid())){
				ArrayList<EmailBean> al =(ArrayList<EmailBean>)session.getAttribute("EmailList");
				for(EmailBean email : al ){
					if(email.getE_id().equals(e_id)){
						request.setAttribute("email_show", email);
					}
				}
				request.getRequestDispatcher("readEmail.jsp").forward(request, response);
			}
		}else if(operate.equals("0")){ //删除邮件
			if(SendEmailService.deleteEmail(e_id,user.getUserid())){
			     
			      ArrayList<EmailBean> eal = null;
			      if(userType.equals("1")){
			    	 eal =SendEmailService.reserveEmail("2",user.getUserid());
			      }else if(userType.equals("2")){
			    	  eal =SendEmailService.reserveEmail("1",user.getUserid());
			      }
			      request.getSession().setAttribute("EmailList", eal);	
				
			      out.write("<script>;window.location='email_list.jsp'</script>");
			}
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
