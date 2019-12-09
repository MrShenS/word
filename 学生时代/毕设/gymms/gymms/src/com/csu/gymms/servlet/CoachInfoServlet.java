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
import com.csu.gymms.entity.CoachBean;
import com.csu.gymms.service.CoachInfoService;

public class CoachInfoServlet extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public CoachInfoServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 	
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	   //ArrayList clist = cis.getCoachInfo();
		 HttpSession session = request.getSession();
		 ArrayList clist = CoachInfoService.getCoachInfo(10,1);
		 int s_countpage = -1;
		 String ss = request.getParameter("id");
		
		System.out.println("1111111111");
		PageOperationDaoImpl podi= (PageOperationDaoImpl)clist.get(clist.size() - 1);
		
		s_countpage =podi.getPagecount();
		
		session.setAttribute("s_countpage",s_countpage);
		session.setAttribute("podi", podi);
		
		
		clist.remove(clist.size() - 1);
	    session.setAttribute("clist", clist);
	
			request.getRequestDispatcher("coach_list.jsp").forward(request, response);
	
	
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String hidden = request.getParameter("hidden");
		System.out.println("pageNo====" + request.getParameter("pageNo"));
		if("003".equals(hidden)) {	
			//System.out.println("pageNo====" + request.getParameter("pageNo"));
			int s_curpage = 1;
			int s_countpage = -1;
			String pageno = request.getParameter("pageNo");
			if(session.getAttribute("s_curpage")== null){
				s_curpage = 1;
			}else {
			   s_curpage = (Integer)session.getAttribute("s_curpage");
			}
			s_countpage = (Integer)session.getAttribute("s_countpage");
		    int pagesize = Integer.parseInt(request.getParameter("pagesize"));
		    
		    if(pageno.startsWith("0000")){
		    	s_curpage = Integer.parseInt(request.getParameter("pageNo"));
		    } else {
			switch(Integer.parseInt(request.getParameter("pageNo"))){
			case 1: {s_curpage = 1; break;}
			case 2: {if(s_curpage==1)break; s_curpage--; break;}
			case 3: {if(s_curpage < s_countpage)s_curpage++; break;}
			case 4: {if(s_curpage == -1) break; s_curpage=-1;break;}
				default:{
					throw new IllegalArgumentException("´íÎóµÄ²ÎÊý!");
				}
			  }
		    }
			
			ArrayList clist = CoachInfoService.getCoachInfo(pagesize,s_curpage);
			
			System.out.println("pagesize===="+pagesize);
			System.out.println("clistsize===="+clist.size());
			
			PageOperationDaoImpl podi= (PageOperationDaoImpl)clist.get(clist.size() - 1);
		    s_curpage =	podi.getCurpage();
		    s_countpage = podi.getPagecount();
		    
		    session.setAttribute("s_countpage", s_countpage);
		    session.setAttribute("s_curpage", new Integer(s_curpage));
			session.setAttribute("podi", podi);
			
			clist.remove(clist.size() - 1);
			session.setAttribute("clist", clist);
			request.getRequestDispatcher("coach_list.jsp").forward(request, response);
			return;
		}
		
		CoachBean cb = new CoachBean();
		String cno = request.getParameter("cno");
		String cID = request.getParameter("ID");
		String cname = request.getParameter("realname");
		String sex = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String address = request.getParameter("comefrom");
		String qq = request.getParameter("qq");
		String email = request.getParameter("email");
		String type = request.getParameter("typeId");
		String tel = request.getParameter("mobile");
		String description = request.getParameter("intro");
		String photofile = "";
		photofile = request.getParameter("photofile");
		photofile = "coach/" + photofile.substring(photofile.lastIndexOf("\\")+1, photofile.length());

		cb.setCno(cno);
		cb.setCname(cname);
		cb.setCid(cID);
		cb.setSex(sex);
		cb.setBirthday(birthday);
		cb.setAddress(address);
		cb.setQq(qq);
		cb.setEmail(email);
		cb.setTel(tel);
		cb.setType(type);
		cb.setDescription(description);
		cb.setPhotofile(photofile);
		System.out.println(photofile);
		if("001".equals(hidden)) {
			if(photofile=="" || photofile.length()==0) {
				new CoachInfoService().modifyPartCoachInfo(cb);
			} else {
				
				new CoachInfoService().modifyCoachInfo(cb);
			}
			
			request.getRequestDispatcher("coach_list.jsp").forward(request, response);
			return ;
		}

		if("002".equals(hidden)) {
			new CoachInfoService().insertCoachInfo(cb);
			request.getRequestDispatcher("coach_add.jsp").forward(request, response);
			return;
		}
		
	}


	public void init() throws ServletException {
		
	}

}
