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
import com.csu.gymms.service.MangerUserService;
import com.csu.gymms.service.SendEmailService;

public class SendEmailServelt extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SendEmailServelt() {
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
	    
	    UsersBean user =(UsersBean)request.getSession().getAttribute("user");
		String send_username = (String)request.getSession().getAttribute("username");
		String user_grop =request.getParameter("groupId");
		String msgTitle =request.getParameter("msgTitle");
		String msgContent =request.getParameter("msgContent");
		if(!user_grop.equals("-1")&&!msgTitle.equals("")&&!msgContent.trim().equals("")){
			EmailBean email = new EmailBean();
			email.setSend_name(send_username);
			email.setSend_grop(user_grop);
			email.setTitle(msgTitle);
			email.setContext(msgContent);
			
			
			 ArrayList<UsersBean> als =MangerUserService.getAllUserInfo();
			 ArrayList userIdList = new ArrayList();
			 for(UsersBean senduser : als){
				if(user_grop.equals(senduser.getTypeid())){
					if(!senduser.getUserid().equals(user.getUserid())){
						userIdList.add(senduser.getUserid());
					}
					
				}else{
					if(!senduser.getUserid().equals(user.getUserid())){
						userIdList.add(senduser.getUserid());
					}
				}			 
			 }
			 
			if(SendEmailService.sendEmail(userIdList,email)){
				 response.getWriter().print("<script>alert('邮件发送成功！');window.location='email_list.jsp'</script>");	
				 
			}else{
				 response.getWriter().print("<script>alert('邮件发送失败！，请重新发送');window.location='send_email.jsp'</script>");
			}		
		}
	    else{
			 response.getWriter().print("<script>alert('请填写邮件必填项');window.location='send_email.jsp'</script>");	
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
