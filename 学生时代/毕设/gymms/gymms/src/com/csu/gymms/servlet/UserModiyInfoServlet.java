package com.csu.gymms.servlet;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.csu.gymms.dao.impl.PageOperationDaoImpl;
import com.csu.gymms.entity.UsersBean;
import com.csu.gymms.service.CoachInfoService;
import com.csu.gymms.service.MangerUserService;

public class UserModiyInfoServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public UserModiyInfoServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy();

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		HttpSession session = request.getSession();
		 int umi_countpage = -1;

		MangerUserService ms = new MangerUserService();
		ArrayList userlist = ms.getAllUserInfo(10,1);
		PageOperationDaoImpl podi= (PageOperationDaoImpl)userlist.get(userlist.size() - 1);
		umi_countpage =podi.getPagecount();
		
		
		session.setAttribute("umi_countpage",umi_countpage);
		session.setAttribute("podi", podi);
		
		userlist.remove(userlist.size() - 1);
		session.setAttribute("userlist", userlist);
	
		request.getRequestDispatcher("user_list.jsp").forward(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8 ");
        HttpSession session = request.getSession();
        
        String hidden = request.getParameter("hidden");

        
        if("000".equals(hidden)) {	
			//System.out.println("pageNo====" + request.getParameter("pageNo"));
			int umi_curpage = 1;
			int umi_countpage = -1;
			String pageno = request.getParameter("pageNo");
			if(session.getAttribute("umi_curpage")== null){
				umi_curpage = 1;
			}else {
			   umi_curpage = (Integer)session.getAttribute("umi_curpage");
			}
			
			umi_countpage = (Integer)session.getAttribute("umi_countpage");
			
		    int pagesize = Integer.parseInt(request.getParameter("pagesize"));
		    
		    if(pageno.startsWith("0000")){
		    	umi_curpage = Integer.parseInt(request.getParameter("pageNo"));
		    } else {
			switch(Integer.parseInt(request.getParameter("pageNo"))){
			case 1: {umi_curpage = 1; break;}
			case 2: {if(umi_curpage==1)break; umi_curpage--; break;}
			case 3: {if(umi_curpage < umi_countpage)umi_curpage++; break;}
			case 4: {if(umi_curpage == -1) break; umi_curpage=-1;break;}
				default:{
					throw new IllegalArgumentException("错误的参数!");
				}
			  }
		    }
			
			ArrayList userlist = MangerUserService.getAllUserInfo(pagesize,umi_curpage);
			
			System.out.println("pagesize===="+pagesize);
			System.out.println("clistsize===="+userlist.size());
			
			PageOperationDaoImpl podi= (PageOperationDaoImpl)userlist.get(userlist.size() - 1);
		    umi_curpage =	podi.getCurpage();
		    umi_countpage = podi.getPagecount();
		    
		    session.setAttribute("umi_countpage", umi_countpage);
		    session.setAttribute("umi_curpage", new Integer(umi_curpage));
			session.setAttribute("podi", podi);
			
			userlist.remove(userlist.size() - 1);
			session.setAttribute("userlist", userlist);
			request.getRequestDispatcher("user_list.jsp").forward(request, response);
			return;
		}if("000".equals(hidden)) {	
			//System.out.println("pageNo====" + request.getParameter("pageNo"));
			int umi_curpage = 1;
			int umi_countpage = -1;
			String pageno = request.getParameter("pageNo");
			if(session.getAttribute("umi_curpage")== null){
				umi_curpage = 1;
			}else {
			   umi_curpage = (Integer)session.getAttribute("umi_curpage");
			}
			
			umi_countpage = (Integer)session.getAttribute("umi_countpage");
			
		    int pagesize = Integer.parseInt(request.getParameter("pagesize"));
		    
		    if(pageno.startsWith("0000")){
		    	umi_curpage = Integer.parseInt(request.getParameter("pageNo"));
		    } else {
			switch(Integer.parseInt(request.getParameter("pageNo"))){
			case 1: {umi_curpage = 1; break;}
			case 2: {if(umi_curpage==1)break; umi_curpage--; break;}
			case 3: {if(umi_curpage < umi_countpage)umi_curpage++; break;}
			case 4: {if(umi_curpage == -1) break; umi_curpage=-1;break;}
				default:{
					throw new IllegalArgumentException("错误的参数!");
				}
			  }
		    }
			
			ArrayList userlist = MangerUserService.getAllUserInfo(pagesize,umi_curpage);
			
			System.out.println("pagesize===="+pagesize);
			System.out.println("clistsize===="+userlist.size());
			
			PageOperationDaoImpl podi= (PageOperationDaoImpl)userlist.get(userlist.size() - 1);
		    umi_curpage =	podi.getCurpage();
		    umi_countpage = podi.getPagecount();
		    
		    session.setAttribute("umi_countpage", umi_countpage);
		    session.setAttribute("umi_curpage", new Integer(umi_curpage));
			session.setAttribute("podi", podi);
			
			userlist.remove(userlist.size() - 1);
			session.setAttribute("userlist", userlist);
			request.getRequestDispatcher("user_list.jsp").forward(request, response);
			return;
		}
        
        
       
        String username = request.getParameter("username");
        String email= request.getParameter("email");
        String password= request.getParameter("password");
        String repassword= request.getParameter("repassword");
        String realname= request.getParameter("realname");
        String sex= request.getParameter("gender");       
        String birthday= request.getParameter("birthday");
        String address= request.getParameter("comefrom");
        String qq= request.getParameter("qq");
        String typeid = request.getParameter("typeId");
        String tel= request.getParameter("tel");
        String userid = request.getParameter("userid");
        String register_time = request.getParameter("register_time");
        System.out.println(register_time);
         
      	UsersBean user = new UsersBean();
      	user.setUsername(username);
    	user.setEmail(email);
    	user.setPassword(password);
        user.setRealname(realname);
    	user.setSex(sex);
    	user.setBirthday(birthday);
    	user.setAddress(address);
    	user.setQq(qq);
    	user.setTel(tel);
    	user.setTypeid(typeid);
    	user.setUserid(userid);
    	user.setRegister_time(register_time);
    	
    	if("001".equals(hidden)) {
    		new MangerUserService().insertUserInfo(user);
    		request.getRequestDispatcher("user_add.jsp").forward(request, response);
    	}
    	if("002".equals(hidden)) {
    		new MangerUserService().modifyUserInfo(user);
    		request.getRequestDispatcher("userinfo.jsp").forward(request, response);
    	}
         
//        if(!password.equals(repassword)){
//        	response.getWriter().print("<script>alert('两次密码不一致，请重新填写！');window.location='userinfo.jsp'</script>");
//        	return;
//        }else{
//       
//        	boolean  isOk =MangerUserService.modifyUserInfo(user);
//        	if(isOk){
//        		 ArrayList<UsersBean> al =MangerUserService.getAllUserInfo();
//    			 request.getSession().setAttribute("userList", al);
//    			 
//        		response.getWriter().print("<script>alert('修改用户信息成功！');window.location='user_list.jsp'</script>");
//        	
//        	}else{
//        		response.getWriter().print("<script>alert('修改用户信息失败，请从新输入！');window.location='userinfo.jsp'</script>");
//        	}
//        }
	}

	
	public void init() throws ServletException {
		
	}

}
