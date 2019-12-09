package com.csu.gymms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csu.gymms.entity.FieldInfoBean;
import com.csu.gymms.service.FiledInfoService;
import com.csu.gymms.util.Tools;

public class FieldInfoServlet extends HttpServlet {

	
	public FieldInfoServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html; charset=UTF-8");
		String id = request.getParameter("did");
		System.out.println(id);
		if("003".equals(id)) {
			String roomname = request.getParameter("roomname");
			String name= Tools.convert(roomname);
			System.out.println(name);
			FiledInfoService.deleteFieldInfo(name);
			ArrayList flist = new FiledInfoService().searchFieldInfo();
			for(int i = 0; i < flist.size(); i++) {
				FieldInfoBean fib = (FieldInfoBean)flist.get(i);
			}
			request.getSession().setAttribute("flist", flist);
			request.getRequestDispatcher("file_check.jsp").forward(request, response);
		} else {
			ArrayList flist = new FiledInfoService().searchFieldInfo();
			for(int i = 0; i < flist.size(); i++) {
				FieldInfoBean fib = (FieldInfoBean)flist.get(i);
			}
			request.getSession().setAttribute("flist", flist);
			request.getRequestDispatcher("file_check.jsp").forward(request, response);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String ids = request.getParameter("ids");
		if("001".equals(ids)) {
			String roomname = request.getParameter("roomname");
			ArrayList flist = new FiledInfoService().searchFieldInfo();
			for(int i = 0; i < flist.size(); i++) {
				FieldInfoBean fib = (FieldInfoBean)flist.get(i);
				if(roomname.equals(fib.getRoomname())) {
					request.getSession().setAttribute("fib", fib);
					request.getRequestDispatcher("file_check.jsp").forward(request, response);
				}
			}
		}
		if("002".equals(ids)) {
			String roomname = request.getParameter("roomname");
			String accountnumber = request.getParameter("accountnumber");
			String roomphoto = "";
			roomphoto = request.getParameter("photo");
			roomphoto = "coach/" + roomphoto.substring(roomphoto.lastIndexOf("\\")+1, roomphoto.length());
			FieldInfoBean fib = new FieldInfoBean();
			fib.setRoomname(roomname);
			fib.setAccountnumber(accountnumber);
			fib.setRoomphoto(roomphoto);
			FiledInfoService.insertFieldInfo(fib);
			request.getRequestDispatcher("add_field.jsp").forward(request, response);
		}
		
		
	}

	
	public void init() throws ServletException {
		
	}

}
