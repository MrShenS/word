package com.csu.gymms.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.csu.gymms.dao.impl.PageOperationDaoImpl;
import com.csu.gymms.service.OperateDateService;

public class OperateDateServlet extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public OperateDateServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy();
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		String ids = request.getParameter("ids");
		System.out.println(ids);
		if("5".equals(ids)) {
			String ope_id = request.getParameter("ope_id");
			System.out.println(ope_id);
			OperateDateService.deleteOperateInfo(Integer.parseInt(ope_id));
		} 
			ArrayList odlist = OperateDateService.searchOperateInfo(10,1);		
			
			HttpSession session = request.getSession();
			int od_countpage = -1;
	        PageOperationDaoImpl podi= (PageOperationDaoImpl)odlist.get(odlist.size() - 1);
			
			od_countpage =podi.getPagecount();
			
			session.setAttribute("od_countpage",od_countpage);
			session.setAttribute("podi", podi);
			
			
			odlist.remove(odlist.size() - 1);
		    session.setAttribute("odlist", odlist);
	
			request.getRequestDispatcher("operate.jsp").forward(request, response);

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 request.setCharacterEncoding("UTF-8");
		 String ids = request.getParameter("ids");
		 String hidden = request.getParameter("hidden");
		 HttpSession session = request.getSession();
		 System.out.println(ids);
		 String pageno = request.getParameter("pageNo");
		  int od_curpage = 1;
		  int od_countpage = -1;
		 
		 if("001".equals(hidden) && (pageno.startsWith("0000")||"1".equals(pageno) ||"2".equals(pageno) || "3".equals(pageno) ||"4".equals(pageno) )){
			  
				
				if(session.getAttribute("od_curpage")== null){
					od_curpage = 1;
				}else {
				   od_curpage = (Integer)session.getAttribute("od_curpage");
				}
				
				od_countpage = (Integer)session.getAttribute("od_countpage");
			    int pagesize = Integer.parseInt(request.getParameter("pagesize"));
			    
			    if(pageno.startsWith("0000")){
			    	od_curpage = Integer.parseInt(request.getParameter("pageNo"));
			    } else {
				switch(Integer.parseInt(request.getParameter("pageNo"))){
				case 1: {od_curpage = 1; break;}
				case 2: {if(od_curpage==1)break; od_curpage--; break;}
				case 3: {if(od_curpage < od_countpage)od_curpage++; break;}
				case 4: {if(od_curpage == -1) break; od_curpage=-1;break;}
					default:{
						throw new IllegalArgumentException("´íÎóµÄ²ÎÊý!");
					}
				  }
			    }
				
				ArrayList odlist = OperateDateService.searchOperateInfo(pagesize,od_curpage);
				
				System.out.println("pagesize===="+pagesize);
				System.out.println("odlistsize===="+odlist.size());
				
				PageOperationDaoImpl podi= (PageOperationDaoImpl)odlist.get(odlist.size() - 1);
			    od_curpage =	podi.getCurpage();
			    od_countpage = podi.getPagecount();
			    
			    session.setAttribute("od_countpage", od_countpage);
			    session.setAttribute("od_curpage", new Integer(od_curpage));
				session.setAttribute("podi", podi);
				
				odlist.remove(odlist.size() - 1);
				session.setAttribute("odlist", odlist);
				request.getRequestDispatcher("operate.jsp").forward(request, response);
				
		 }
		 
		 
		 if("3".equals(ids)) {
				String ope_id[] = request.getParameterValues("ids"); 
				
				if(ope_id != null) {   
					for(int i = ope_id.length-1;i >= 0 ; i--) {   
						System.out.println(ope_id[i]);
						OperateDateService.deleteOperateInfo(Integer.parseInt(ope_id[i]));
					}
					
					
					ArrayList odlist = OperateDateService.searchOperateInfo(10,1);		
					PageOperationDaoImpl podi= (PageOperationDaoImpl)odlist.get(odlist.size() - 1);
					od_curpage =	podi.getCurpage();
				    od_countpage = podi.getPagecount();
				    
				    session.setAttribute("od_countpage", od_countpage);
				    session.setAttribute("od_curpage", new Integer(od_curpage));
					session.setAttribute("podi", podi);
					
					odlist.remove(odlist.size() - 1);
					request.setAttribute("odlist", odlist);
					request.getRequestDispatcher("operate.jsp").forward(request, response);
				}
				return;
			}
		 if("2".equals(ids)) {
			 String op = request.getParameter("text");
			 int flag = Integer.parseInt(request.getParameter("flag"));
			 ArrayList odlist =  OperateDateService.fuzzyOperateInfo(flag, op);
			 request.getSession().setAttribute("odlist", odlist);
			 request.getRequestDispatcher("operate.jsp").forward(request, response);
			 return;
		 }
		 
	}

	
	public void init() throws ServletException {
		
	}

}
