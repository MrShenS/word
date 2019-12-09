package com.csu.gymms.util;




import java.util.ArrayList;
import java.util.HashMap;

import org.jfree.chart.ChartFactory;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.util.Rotation;

public class PieChart3D 
{


   /** 
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * ����
	 */
	public JFreeChart CreatePieChart3D() throws NullChartException
	  {
	  
	    PieDataset pd = createDataset();
	    JFreeChart chart = createChart(pd,null);
	    if(chart == null){
	   	 throw new NullChartException("chart ����ʧ��!");
	    }
	      return chart;
	  }

 
	public JFreeChart CreatePieChart3D(PieDataset data,String PieChart3DTitle) throws NullChartException
	{
	
	  JFreeChart chart = createChart(data,PieChart3DTitle);
	  if(chart == null){
	 	 throw new NullChartException("chart ����ʧ��!");
	  }
	    return chart;
	}

	/*
	 * ����
	 */
	 public PieDataset createDataset()
	  {
	    DefaultPieDataset localDefaultPieDataset = new DefaultPieDataset();
	    localDefaultPieDataset.setValue("����", new Double(43.200000000000003D));
	    localDefaultPieDataset.setValue("���е���", new Double(10.0D));
	    localDefaultPieDataset.setValue("��ɽ��", new Double(10.5D));
	    localDefaultPieDataset.setValue("����", new Double(30.5D));
	    localDefaultPieDataset.setValue("������", new Double(9.5D));
	    return localDefaultPieDataset;
	  }
	 
	 /*
	  * alΪ�����ƣ�hmΪ�����ƶ�Ӧ�ı��ٷֱ�
	  */
	 public PieDataset createDataset(ArrayList al_title,HashMap<String,Double> hm)
	  {
		DefaultPieDataset localDefaultPieDataset = null;
		if(al_title.size() >= hm.size()){
	    localDefaultPieDataset = new DefaultPieDataset();
	    String itemname ;
	    for(int i =0 ; i < al_title.size(); i++){
	    	itemname = (String)al_title.get(i);
	    	localDefaultPieDataset.setValue(itemname,hm.get(itemname));
	    }
	  }
	    return localDefaultPieDataset;
	  }

  private JFreeChart createChart(PieDataset paramPieDataset,String PieChart3DTitle)
  {
	JFreeChart localJFreeChart = null;
	if(PieChart3DTitle == null)
    localJFreeChart = ChartFactory.createPieChart3D("Pie Chart 3D Demo", paramPieDataset, true, true, false);
	else {
     localJFreeChart = ChartFactory.createPieChart3D(PieChart3DTitle, paramPieDataset, true, true, false);
	}
    PiePlot3D localPiePlot3D = (PiePlot3D)localJFreeChart.getPlot();
    localPiePlot3D.setStartAngle(290.0D);
    localPiePlot3D.setDirection(Rotation.CLOCKWISE);
    localPiePlot3D.setForegroundAlpha(0.5F);
    localPiePlot3D.setNoDataMessage("No data to display");
    return localJFreeChart;
  }

}
