package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.csu.gymms.dao.impl.PageOperationDaoImpl;
import com.csu.gymms.service.CoachInfoService;
import com.csu.gymms.service.MangerUserService;
import com.csu.gymms.service.MemberService;

public class UserBulkDeleteServlet extends HttpServlet {

	
	public UserBulkDeleteServlet() {
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

		String mno[] = request.getParameterValues("ids"); 
		System.out.println(mno);
		if(mno != null) {   
			for(int i = mno.length-1;i >= 0 ; i--) {   
				System.out.println("++++++++++++++"+mno[i]);
				MangerUserService.bulkDeleteUserInfo(Integer.parseInt(mno[i].trim()));
		    } 
			HttpSession session = request.getSession();
			
//			ArrayList userlist = null;
//			if(session.getAttribute("pagesize")!=null || session.getAttribute("umi_curpage")!=null){
//				int pagesize = Integer.parseInt((String)session.getAttribute("pagesize"));
//				int umi_curpage = Integer.parseInt((String)session.getAttribute("umi_curpage"));
//				 userlist = MangerUserService.getAllUserInfo(pagesize, umi_curpage);
//			} else  {
//			     userlist = MangerUserService.getAllUserInfo(10, 1);
//			}
			ArrayList userlist = MangerUserService.getAllUserInfo(10, 1);
			 int umi_countpage = -1;
			
			
			PageOperationDaoImpl podi= (PageOperationDaoImpl)userlist.get(userlist.size() - 1);
			
			umi_countpage =podi.getPagecount();
			
			session.setAttribute("umi_countpage",umi_countpage);
			session.setAttribute("podi", podi);
			
			userlist.remove(userlist.size() - 1);
		    session.setAttribute("userlist", userlist);

		    ArrayList mList= MemberService.getMember();
			request.getSession().setAttribute("userlist", userlist);
			request.getRequestDispatcher("user_list.jsp").forward(request, response);
		}
	}

	
	public void init() throws ServletException {
		
	}

}
