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
import com.csu.gymms.entity.MemberBean;
import com.csu.gymms.service.CoachInfoService;
import com.csu.gymms.service.MemberService;

public class MemberServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MemberServlet() {
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

		ArrayList mList = MemberService.getMember(10,1);
		HttpSession session = request.getSession();
	    int m_countpage = -1;
		 
		PageOperationDaoImpl podi= (PageOperationDaoImpl)mList.get(mList.size() - 1);
			
	    m_countpage =podi.getPagecount();
			
		session.setAttribute("m_countpage",m_countpage);
		session.setAttribute("podi", podi);
		
		mList.remove(mList.size() - 1);
	    session.setAttribute("mList", mList);
	    
//		System.out.println(mlist);
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
		String hidden = request.getParameter("hidden");
		HttpSession session = request.getSession();
		
		
		if("000".equals(hidden)) {	
			//System.out.println("pageNo====" + request.getParameter("pageNo"));
			int m_curpage = 1;
			int m_countpage = -1;
			String pageno = request.getParameter("pageNo");
			if(session.getAttribute("m_curpage")== null){
				m_curpage = 1;
			}else {
			   m_curpage = (Integer)session.getAttribute("m_curpage");
			}
			m_countpage = (Integer)session.getAttribute("m_countpage");
		    int pagesize = Integer.parseInt(request.getParameter("pagesize"));
		    
		    if(pageno.startsWith("0000")){
		    	m_curpage = Integer.parseInt(request.getParameter("pageNo"));
		    } else {
			switch(Integer.parseInt(request.getParameter("pageNo"))){
			case 1: {m_curpage = 1; break;}
			case 2: {if(m_curpage==1)break; m_curpage--; break;}
			case 3: {if(m_curpage < m_countpage)m_curpage++; break;}
			case 4: {if(m_curpage == -1) break; m_curpage=-1;break;}
				default:{
					throw new IllegalArgumentException("´íÎóµÄ²ÎÊý!");
				}
			  }
		    }
			
			ArrayList mList = MemberService.getMember(pagesize,m_curpage);
	
			
			System.out.println("pagesize===="+pagesize);
			System.out.println("mlistsize===="+mList.size());
			
			PageOperationDaoImpl podi= (PageOperationDaoImpl)mList.get(mList.size() - 1);
		    m_curpage =	podi.getCurpage();
		    m_countpage = podi.getPagecount();
		    
		    session.setAttribute("m_countpage", m_countpage);
		    session.setAttribute("m_curpage", new Integer(m_curpage));
			session.setAttribute("podi", podi);
			
			mList.remove(mList.size() - 1);
			session.setAttribute("mList", mList);
			request.getRequestDispatcher("v_list.jsp").forward(request, response);
			return;
		}
		
		
		MemberBean mb = new MemberBean();
		mb.setMno(request.getParameter("mno"));
		mb.setMname(request.getParameter("mname"));
		mb.setId(request.getParameter("id"));
		mb.setEmail(request.getParameter("email"));
		mb.setMgroup(request.getParameter("mgroup"));
		mb.setSex(request.getParameter("sex"));
		mb.setBirthday(request.getParameter("birthday"));
		mb.setQq(request.getParameter("qq"));
		mb.setTelphone(request.getParameter("telphone"));
		mb.setPhone(request.getParameter("phone"));
		mb.setAddress(request.getParameter("address"));
		mb.setDescription(request.getParameter("description"));
		
		MemberService mbs = new MemberService();
		
		if("001".equals(hidden)){
			mbs.addMember(mb);
			request.getRequestDispatcher("v_add.jsp").forward(request, response);
		}else if("002".equals(hidden)){
			mbs.modifyMember(mb);
			request.getRequestDispatcher("v_list.jsp").forward(request, response);
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
