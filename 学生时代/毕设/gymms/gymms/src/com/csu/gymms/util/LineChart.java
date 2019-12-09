package com.csu.gymms.util;



import java.util.ArrayList;
import java.util.HashMap;


import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;


public class LineChart
{
   /**@author zifei 
	 *@多条曲线图 例子
	 */
  private static final long serialVersionUID = 1L;

  public JFreeChart CreateLineChart() throws NullChartException
  {
	 XYDataset pd = createDataset();
    JFreeChart chart = createChart(pd,null,null,null);
    if(chart == null){
   	 throw new NullChartException("chart 创建失败!");
    }
      return chart;
  }
  
  
  public JFreeChart CreateLineChart(XYDataset pd,String LineChartTitle,String X_name,String Y_name) throws NullChartException
  {
    JFreeChart chart = createChart(pd,LineChartTitle,X_name,Y_name);
    if(chart == null){
   	 throw new NullChartException("chart 创建失败!");
    }
      return chart;
  }
  
  
  /**
   * 例子
   * @return
   */
  public  XYDataset createDataset()
  {
    XYSeriesCollection localXYSeriesCollection = new XYSeriesCollection();
    for (int i = 0; i < 10; i++)
    {
      XYSeries localXYSeries = new XYSeries("S" + i);
      for (int j = 0; j < 10; j++)
        localXYSeries.add(j, Math.random() * 100.0D);
      localXYSeriesCollection.addSeries(localXYSeries);
    }
    return localXYSeriesCollection;
  }
   
  /*
   * 生成数据集
   * @al_title 数据头
   * @hm_data  由数据头映射的一年中每个月的数据量(其中hashmap里的每个arraylist必须为12个数据项)
   */
  public  XYDataset createDataset(ArrayList al_title,HashMap<String,ArrayList<Double>> hm_data)
  {
	 if(al_title.size() != hm_data.size()){
		 throw new IllegalArgumentException("两项数据项个数不相等");
	 }
    XYSeriesCollection localXYSeriesCollection = new XYSeriesCollection();
    for(int i = 0 ; i < al_title.size(); i++){
    	String title = al_title.get(i).toString();
    	XYSeries localXYSeries = new XYSeries(title);
    	ArrayList data = hm_data.get(title);
    	 for (int j = 0; j <= 11; j++)
    	        localXYSeries.add(new Double(j),(Double)data.get(j));
          localXYSeriesCollection.addSeries(localXYSeries);
    }
    
    return localXYSeriesCollection;
  }
  
  
  /*
   * 生成数据集
   * @al_title 数据头
   * @hm_data  由数据头映射的每年的数据量()
   */
  public  XYDataset createDatasetYear(ArrayList al_title,HashMap<String,ArrayList<Double>> hm_data)
  {
	 if(al_title.size() != hm_data.size()){
		 throw new IllegalArgumentException("两项数据项个数不相等");
	 }
//    String [] year = {"2007","2008","2009","2010","2011"};
    XYSeriesCollection localXYSeriesCollection = new XYSeriesCollection();
    for(int i = 0 ; i < al_title.size(); i++){
    	String title = al_title.get(i).toString();
    	XYSeries localXYSeries = new XYSeries(title);
    	ArrayList data = hm_data.get(title);
    	 for (int j = 0; j <= 4; j++)
    	        localXYSeries.add(new Double(j+2007),(Double)data.get(j));
          localXYSeriesCollection.addSeries(localXYSeries);
    }
    
    return localXYSeriesCollection;
  }
  
  private  JFreeChart createChart(XYDataset paramXYDataset,String LineChartTitle,String X_name,String Y_name)
  {
	  JFreeChart localJFreeChart = null;
	  if(LineChartTitle == null || X_name == null || Y_name ==null)
       localJFreeChart = ChartFactory.createXYLineChart("Line Chart Demo", "X", "Y", paramXYDataset, PlotOrientation.VERTICAL, true, true, false);
	  else
	  {
	   localJFreeChart = ChartFactory.createXYLineChart(LineChartTitle, X_name, Y_name, paramXYDataset, PlotOrientation.VERTICAL, true, true, false);
	  }
    XYPlot localXYPlot = (XYPlot)localJFreeChart.getPlot();
    XYLineAndShapeRenderer localXYLineAndShapeRenderer = (XYLineAndShapeRenderer)localXYPlot.getRenderer();
    localXYLineAndShapeRenderer.setShapesVisible(true);
    localXYLineAndShapeRenderer.setBaseShapesFilled(true);
    localXYLineAndShapeRenderer.setDrawOutlines(true);
    NumberAxis localNumberAxis = (NumberAxis)localXYPlot.getRangeAxis();
    localNumberAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
    return localJFreeChart;
  }
}