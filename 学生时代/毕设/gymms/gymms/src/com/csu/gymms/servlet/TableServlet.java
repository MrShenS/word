package com.csu.gymms.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.jfree.chart.JFreeChart;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;


import com.csu.gymms.util.BarChart3D;
import com.csu.gymms.util.LineChart;
import com.csu.gymms.util.NullChartException;
import com.csu.gymms.util.PieChart3D;


public class TableServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public TableServlet() {
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
		 
		   HttpSession  session = request.getSession();
		   ArrayList<String> al = new ArrayList<String>();
		   ArrayList<Double> al_data;
		   HashMap<String, ArrayList<Double>> hm = new HashMap<String,ArrayList<Double>>();
		   String flag;
		   flag =  request.getParameter("id");
		   
		   if(flag != null)
			   session.setAttribute("flag", flag);
		   
		   flag = (String)session.getAttribute("flag");
		   String di = (String)request.getParameter("di");
		   JFreeChart chart = null;
		   
		   System.out.println("flag==="+flag);
		   System.out.println("di==="+di);
		   
	   if("1".equals(flag) && "0".equals(di)) {
		  String [] name = {"次卡","月卡","季卡","半年卡","年卡"};
		   for (int i = 0; i < name.length; i++)
		    {
		      al.add(name[i]);
		      al_data = new ArrayList<Double>();
		      for (int j = 1; j <= 12; j++)
		    	  al_data.add(Math.random() * 100.0D);
		      hm.put(name[i], al_data);
		    }
		   LineChart lc = new LineChart();
		  
		 try {
			chart = lc.CreateLineChart(lc.createDataset(al, hm),"卡信息统计","月份","张数");
		  } catch (NullChartException e) {
			e.printStackTrace();
		 }
		}
	   
	   if("1".equals(flag) && "1".equals(di)) {
		   
		   String [] name = {"次卡","月卡","季卡","半年卡","年卡"};
		   for (int i = 0; i < name.length; i++)
		    {
		      al.add(name[i]);
		      al_data = new ArrayList<Double>();
		      for (int j = 1; j <= 5; j++)
		    	  al_data.add(Math.random() * 1000.0D);
		      hm.put(name[i], al_data);
		    }
		   LineChart lc = new LineChart();
		  
		 try {
			chart = lc.CreateLineChart(lc.createDatasetYear(al, hm),"卡信息统计","年度","总张数");
		  } catch (NullChartException e) {
			e.printStackTrace();
		 }
		}
	   
	   if("2".equals(flag) && "0".equals(di)) {
		   BarChart3D bc = new BarChart3D();
		 try {
			chart = bc.CreateBarChart3D(bc.createDataset(),null,null,null);
		  } catch (NullChartException e) {
			e.printStackTrace();
		 }
		}
	   
	   if("2".equals(flag) && "1".equals(di)) {
		   for (int i = 0; i < 5; i++)
		    {
		      al.add("S" + i);
		      al_data = new ArrayList<Double>();
		      for (int j = 1; j <= 12; j++)
		    	  al_data.add(Math.random() * 100.0D);
		      hm.put("S" + i, al_data);
		    }
		   LineChart lc = new LineChart();
		  
		 try {
			chart = lc.CreateLineChart(lc.createDataset(al, hm),"测试","X","Y");
		  } catch (NullChartException e) {
			e.printStackTrace();
		 }
		}
	   
	   if("3".equals(flag) && "0".equals(di)) {
		   PieChart3D pc = new PieChart3D();
		  
		 try {
			chart = pc.CreatePieChart3D(pc.createDataset(),"月份各器材百分比");
		  } catch (NullChartException e) {
			e.printStackTrace();
		 }
		}
	   
	   
	   if("3".equals(flag) && "1".equals(di)) {
		   PieChart3D pc = new PieChart3D();
			  
			 try {
				chart = pc.CreatePieChart3D(pc.createDataset(),"年度各器材百分比");
			  } catch (NullChartException e) {
				e.printStackTrace();
			 }
		}
	   
	   
	   if("4".equals(flag) && "0".equals(di)) {
		   String[] name = {"收入","支出"};
		   for (int i = 0; i < 2; i++)
		    {
		      al.add(name[i]);
		      al_data = new ArrayList<Double>();
		      for (int j = 1; j <= 12; j++)
		    	  al_data.add(Math.random() * 100.0D);
		      hm.put(name[i], al_data);
		    }
		   LineChart lc = new LineChart();
		  
		 try {
			chart = lc.CreateLineChart(lc.createDataset(al, hm),"月收入与支出","月份","万元");
		  } catch (NullChartException e) {
			e.printStackTrace();
		 }
		}
	   
	   
	   if("4".equals(flag) && "1".equals(di)) {
		   String[] name = {"收入","支出"};
		   for (int i = 0; i < 2; i++)
		    {
		      al.add(name[i]);
		      al_data = new ArrayList<Double>();
		      for (int j = 1; j <= 12; j++)
		    	  al_data.add(Math.random() * 1000.0D);
		      hm.put(name[i], al_data);
		    }
		   LineChart lc = new LineChart();
		  
		 try {
			chart = lc.CreateLineChart(lc.createDatasetYear(al, hm),"年收入与支出","年度","万元");
		  } catch (NullChartException e) {
			e.printStackTrace();
		 }
		}
	   
		   String filename = ServletUtilities.saveChartAsPNG(chart, 600, 400, null, session);
		   session.setAttribute("filename", filename);
		   String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;
		   session.setAttribute("graphURL", graphURL);
		   request.getRequestDispatcher("v_chart.jsp").forward(request, response);
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

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
