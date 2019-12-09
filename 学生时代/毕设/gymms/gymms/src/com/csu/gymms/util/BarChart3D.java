package com.csu.gymms.util;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DatasetUtilities;


public class BarChart3D {

	 public  JFreeChart CreateBarChart3D() throws NullChartException{
		 CategoryDataset data = createDataset();
		 JFreeChart chart  = createChart(data,null,null,null);
	     if(chart == null){
	    	 throw new NullChartException("chart 创建失败!");
	     }
	      return chart;
	 }
	 
	 public  JFreeChart CreateBarChart3D(CategoryDataset data,String BarChart3DTitle,String X_name,String Y_name) throws NullChartException{
		
		 JFreeChart chart  = createChart(data,BarChart3DTitle,X_name,Y_name);
	     if(chart == null){
	    	 throw new NullChartException("chart 创建失败!");
	     }
	      return chart;
	 }
	 
	 /*
	  * 例子
	  */
	 public CategoryDataset createDataset()
	  {
		 double [][] data = new double[][]{{1310},{562},{652},{321},{698}};
	      String[] rowKeys = {"瑜伽","有氧搏击","肚皮舞","动感单车","哑铃"};
	      String[] columKey = {""};
	      CategoryDataset dataset = DatasetUtilities.createCategoryDataset(rowKeys,columKey,data);
	      return dataset;
	  }
	 
	 /*
	  * 初始化数据
	  */
	 public CategoryDataset createDataset(String[] rowKeys,String[] columKey,double [][] data)
	  {
	      CategoryDataset dataset = DatasetUtilities.createCategoryDataset(rowKeys,columKey,data);
	      return dataset;
	  }
	 
	 private JFreeChart createChart(CategoryDataset dataset,String BarChart3DTitle,String X_name,String Y_name)
	  {
		 JFreeChart chart = null;
		 if(BarChart3DTitle == null || X_name == null || Y_name ==null)
		 chart = ChartFactory.createBarChart3D("课程统计图","课程名称","选修人数",dataset,PlotOrientation.VERTICAL
			       ,true,false,false);
		 else {
	     chart = ChartFactory.createBarChart3D(BarChart3DTitle,X_name,Y_name,dataset,PlotOrientation.VERTICAL
				       ,true,false,false); 	 
		 }
	    return chart;
	  }
}
