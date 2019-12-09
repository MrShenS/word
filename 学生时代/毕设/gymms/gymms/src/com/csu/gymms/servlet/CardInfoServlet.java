package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.csu.gymms.entity.CardInfoBean;
import com.csu.gymms.entity.OperateDateBean;
import com.csu.gymms.service.CardInfoService;
import com.csu.gymms.service.OperateDateService;

public class CardInfoServlet extends HttpServlet {

	
	public CardInfoServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cardid = request.getParameter("cardid");
		String id = request.getParameter("id");
		ArrayList clist = new CardInfoService().getCardInfo();
		for(int i = 0; i < clist.size(); i++) {
			CardInfoBean cib = (CardInfoBean)clist.get(i);
			if(cardid.equals(cib.getCardid())) {
				System.out.println(cardid);
				System.out.println(cib.getCardid());
				request.getSession().setAttribute("cib",cib);
				if("cardReissue".equals(id)) {
					
					response.sendRedirect("c_reissue_1.jsp");
				}
				if("cardManager".equals(id)) {
					response.sendRedirect("c_recharge1.jsp");
				}
				if("cardLost".equals(id)) {
					System.out.println(id);
					response.sendRedirect("c_lost_1.jsp");
				}
				break;
			}
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String recharge_hidden = request.getParameter("recharge_hidden");
		String cardid = request.getParameter("cardid");
		CardInfoService cis = new CardInfoService();
		
		if("r002".equals(recharge_hidden)) {
			//String cardid = request.getParameter("cardid");
			double money = Double.parseDouble(request.getParameter("recharge_cmoney"));
			String cardstate = cis.searchCardState(cardid);
			System.out.println(cardstate);
			if("激活".equals(cardstate)) {
				cis.updatCardMondy(cardid, money);
				ArrayList clist = cis.getCardInfo();
				for(int i = 0; i < clist.size(); i++) {
					CardInfoBean cb = (CardInfoBean)clist.get(i);
					if(cb.getCardid().equals(cardid)) {
						request.getSession().setAttribute("cb",cb);
						OperateDateBean odp = new OperateDateBean();
						odp.setOpe_name(request.getSession().getAttribute("username").toString());
						odp.setFunction("卡查询");
						odp.setSpecific_ope("卡充值，操作员"+request.getSession().getAttribute("username")+"为卡号："+cardid+"充值了"+money+"元");
						OperateDateService.insertOperateInfo(odp);
						request.getRequestDispatcher("c_recharge_1.jsp").forward(request, response);
					} 				
				}
			} else {
				ArrayList clist = cis.getCardInfo();
				for(int i = 0; i < clist.size(); i++) {
					CardInfoBean cb = (CardInfoBean)clist.get(i);
					if(cb.getCardid().equals(cardid)) {
						request.getSession().setAttribute("cb",cb);
					}
				}
				response.getWriter().print("<script>alert('卡已锁定，请重新激活后再使用！');window.location='c_recharge.jsp'</script>");
			}
			
		}
		if("r001".equals(recharge_hidden)) {
			String newcardid = request.getParameter("newcardid");
			if(newcardid.trim().equals("")|| newcardid.trim().length()==0) {
				ArrayList list = cis.searchByCardId(cardid);
				CardInfoBean cib = (CardInfoBean)list.get(0);
				request.getSession().setAttribute("cb",cib);
				response.getWriter().print("<script>alert('请输入新的卡号！');window.location='c_reissue_2.jsp'</script>");
				return ;
			} else {
				ArrayList clist = cis.getCardInfo();
				for(int j = 0; j < clist.size(); j++) {
					CardInfoBean cb = (CardInfoBean)clist.get(j);
					if(newcardid.equals(cb.getCardid())) {
						ArrayList list = cis.searchByCardId(cardid);
						CardInfoBean cib = (CardInfoBean)list.get(0);
						request.getSession().setAttribute("cb",cib);
						response.getWriter().print("<script>alert('卡号已存在，请重新输入卡号！');window.location='c_reissue_2.jsp'</script>");
						return ;
					}
				}
				for(int i=0; i < clist.size(); i++) {
					CardInfoBean cb = (CardInfoBean)clist.get(i);
					if(cb.getCardid().equals(cardid)) {
						cis.deleteCardInfo(cardid);
						cis.updateMemberInfo(cardid, newcardid);
						cb.setCardid(newcardid);
						cis.insertCardInfo(cb);
						request.getSession().setAttribute("cb",cb);
						
						OperateDateBean odp = new OperateDateBean();
						odp.setOpe_name(request.getSession().getAttribute("username").toString());
						odp.setFunction("卡查询");
						odp.setSpecific_ope("卡补发，旧卡号是："+cardid+",新卡号是："+newcardid);
						OperateDateService.insertOperateInfo(odp);
						
						request.getRequestDispatcher("c_reissue_2.jsp").forward(request, response);
					}
					
					
				}
			}
			
		}
		
		if("r003".equals(recharge_hidden)) {
			String cardstate = request.getParameter("state");
			String state = request.getParameter("lost");
			if("挂失".equals(state)) {
				cis.updateCardState(2, cardid);
				ArrayList clist = cis.getCardInfo();
				for(int i = 0; i < clist.size(); i++) {
					CardInfoBean cb = (CardInfoBean)clist.get(i);
					if(cb.getCardid().equals(cardid)) {
						request.getSession().setAttribute("cb",cb);
						
						OperateDateBean odp = new OperateDateBean();
						odp.setOpe_name(request.getSession().getAttribute("username").toString());
						odp.setFunction("卡查询");
						odp.setSpecific_ope("卡挂失,卡号为"+cardid+"已挂失,卡已锁定");
						OperateDateService.insertOperateInfo(odp);
						
						request.getRequestDispatcher("c_lost_2.jsp").forward(request, response);
					}
				}
			} else {
				cis.updateCardState(1, cardid);
				ArrayList clist = cis.getCardInfo();
				for(int i = 0; i < clist.size(); i++) {
					CardInfoBean cb = (CardInfoBean)clist.get(i);
					if(cb.getCardid().equals(cardid)) {
						request.getSession().setAttribute("cb",cb);
						
						OperateDateBean odp = new OperateDateBean();
						odp.setOpe_name(request.getSession().getAttribute("username").toString());
						odp.setFunction("卡查询");
						odp.setSpecific_ope("卡挂失,卡号为"+cardid+"已解锁,卡已激活");
						OperateDateService.insertOperateInfo(odp);
						
						request.getRequestDispatcher("c_lost_2.jsp").forward(request, response);
					}
				}
			}
		}
		if("r004".equals(recharge_hidden)){
			String info = request.getParameter("info");
			String carssearch = request.getParameter("carssearch");
			System.out.println(info);
			System.out.println(carssearch);
		}
		

	}

	public void init() throws ServletException {
		
	}

}
