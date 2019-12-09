package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.csu.gymms.dao.PageOperationDao;
import com.csu.gymms.util.ConnectionManager;

public class PageOperationDaoImpl implements PageOperationDao {
	
	private int curpage;
	private int pagesize;
	private int pagecount = -1;
	private String sql;
	private int itemcount;
	
	
	public int getItemcount() {
		return itemcount;
	}


	public PageOperationDaoImpl(String sql) {
		this.curpage = 1;
		this.pagesize = 10;
		this.sql = sql;
		if(sql == null){
			throw new IllegalArgumentException("字符串不能为空或不是sql查询语句");
		}
		RecomputeData();
	}
	
	public void RecomputeData(){
		this.itemcount = getPageCount();
		if(itemcount % pagesize ==0){
			this.pagecount = itemcount / pagesize;
		}else {
		    this.pagecount = (itemcount / pagesize) + 1;
		}
	}
	
	public PageOperationDaoImpl(int curpage, int pagesize) {
		this.curpage = curpage;
		this.pagesize = pagesize;
		RecomputeData();
	}

	
	public  String CreatePageSql() {
		String newsql = "SELECT * FROM (SELECT MY_TABLE.*,ROWNUM AS MY_ROWNUM FROM (" + this.sql + ")  MY_TABLE WHERE ROWNUM <= "+ curpage*pagesize + ") WHERE MY_ROWNUM >= "+((curpage-1)*pagesize+1)+"";     
		return newsql;
	}
	
	private int getPageCount(){
		Connection conn= ConnectionManager.getConnection();
		ResultSet rs = null;
		Statement st = null;	 
		int i = -1;
		try {
			String newsql = "select count(*) from ("+sql+") my_table";
		    st=conn.createStatement();
		    rs = st.executeQuery(newsql);
			rs.next();
		    i = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			ConnectionManager.closeConnection(conn, st, rs);
		}
		return i;
	}
	
	/*
	 * @see com.csu.gymms.dao.PageOperationDao#CreatePageSql(java.lang.String) 必须为查询语句
	 */
//	public  String CreatePageSql(String sql,int curpage,int pagesize) {
//		if(sql == null || sql.toLowerCase().startsWith("select")){
//			throw new IllegalArgumentException("字符串不能为空或不是sql查询语句");
//		}
//		String newsql = "SELECT * FROM (SELECT MY_TABLE.*,ROWNUM AS MY_ROWNUM FROM (" + sql + ")  MY_TABLE WHERE ROWNUM <= ?) WHERE MY_ROWNUM >= ?";     
//		return newsql;
//	}

	

	public int getCurpage() {
		return curpage;
	}

	public void setCurpage(int curpage) {
		if(curpage == -1) {
			this.curpage = pagecount;
		    return;	
		}
		this.curpage = curpage;
		RecomputeData();
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
		RecomputeData();
	}


	public int getPagecount() {
		return pagecount;
	}


	public String CreateNextPageSql() {
		if(curpage == pagecount)
			return null;
		curpage++;
		return CreatePageSql();
	}


	public String CreatePrePageSql() {
		if(curpage == 1)
			return null;
		curpage--;
		return CreatePageSql();
	}


	public void setSql(String sql) {
		this.sql = sql;
	}

}
