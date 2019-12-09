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
import com.csu.gymms.entity.OperateDateBean;
import com.csu.gymms.service.CardInfoService;
import com.csu.gymms.service.CoachInfoService;
import com.csu.gymms.service.MemberService;
import com.csu.gymms.service.OperateDateService;

public class AllDeleteServlet extends HttpServlet {

	public AllDeleteServlet() {
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
		
		
		String mid = request.getParameter("mid");
		
		if("001".equals(mid)){
			String mno[] = request.getParameterValues("ids");
			if(mno != null) {   
				for(int i = mno.length-1;i >= 0 ; i--) {   
					 CardInfoService.deleteCardInfo(mno[i]);
					 MemberService.bulkDeleteMember(mno[i]);
					 
					 OperateDateBean odp = new OperateDateBean();
					 odp.setOpe_name(request.getSession().getAttribute("username").toString());
					 odp.setFunction("会员信息");
					 odp.setSpecific_ope("会员删除，"+mno[i]+"已删除");
					 OperateDateService.insertOperateInfo(odp);
						
						request.getRequestDispatcher("c_lost_2.jsp").forward(request, response);
			    }   
				 HttpSession session = request.getSession();
				 ArrayList mlist = MemberService.getMember(10, 1);
				 int s_countpage = -1;
				
				
				PageOperationDaoImpl podi= (PageOperationDaoImpl)mlist.get(mlist.size() - 1);
				
				s_countpage =podi.getPagecount();
				
				session.setAttribute("s_countpage",s_countpage);
				session.setAttribute("podi", podi);
				
				mlist.remove(mlist.size() - 1);
			    session.setAttribute("mlist", mlist);
   
			    ArrayList mList= MemberService.getMember();
				request.getSession().setAttribute("mList", mList);
				request.getRequestDispatcher("v_list.jsp").forward(request, response);
			}
		} else {
			String cno[] = request.getParameterValues("ids");
			if(cno != null) {   
				for(int i = cno.length-1;i >= 0 ; i--) {   
					 CoachInfoService.bulkDeleteCoachInfo(cno[i]);
			    }   
				 HttpSession session = request.getSession();
			    ArrayList clist = CoachInfoService.getCoachInfo(10,1);
				int s_countpage = -1;
				
				
				PageOperationDaoImpl podi= (PageOperationDaoImpl)clist.get(clist.size() - 1);
				
				s_countpage =podi.getPagecount();
				
				session.setAttribute("s_countpage",s_countpage);
				session.setAttribute("podi", podi);
				
				clist.remove(clist.size() - 1);
			    session.setAttribute("clist", clist);
				
				request.getRequestDispatcher("coach_list.jsp").forward(request, response);
			}
		}
		
	}
	
	public void init() throws ServletException {
		
	}

}
