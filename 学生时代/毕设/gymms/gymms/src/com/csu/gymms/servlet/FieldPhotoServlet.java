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

public class FieldPhotoServlet extends HttpServlet {

	
	public FieldPhotoServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String src = request.getParameter("src");
		ArrayList flist = FiledInfoService.searchFieldInfo();
		for(int i = 0; i < flist.size(); i++) {
			FieldInfoBean fib = (FieldInfoBean)flist.get(i);
			if(src.equals(fib.getRoomphoto())) {
				request.getSession().setAttribute("fib", fib);
				request.getRequestDispatcher("deviceinfo.jsp").forward(request, response);
			}
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void init() throws ServletException {
		
	}

}
