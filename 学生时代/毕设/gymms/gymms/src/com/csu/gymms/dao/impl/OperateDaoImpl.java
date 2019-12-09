package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.csu.gymms.dao.OperateDao;
import com.csu.gymms.dao.SQLStatement;
import com.csu.gymms.entity.DeviceInfoBean;
import com.csu.gymms.entity.OperateDateBean;
import com.csu.gymms.util.ConnectionManager;

public class OperateDaoImpl implements OperateDao {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public void deleteOperateInfo(int ope_id) {
		conn = ConnectionManager.getConnection();
		try {
			ps=conn.prepareStatement(SQLStatement.SQL_DELETE_OPERATEDATE);
			ps.setInt(1, ope_id);					
			ps.executeQuery();					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			ConnectionManager.closeConnection(conn, ps, null);
		}
	}

	public void insertOperateInfo(Object obj) {
		OperateDateBean odb = null;
		if(obj instanceof OperateDateBean) {
			odb = (OperateDateBean)obj;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		System.out.println(date);
		conn = ConnectionManager.getConnection();
		 try {
				ps=conn.prepareStatement(SQLStatement.SQL_ADD_OPERATE);
				ps.setString(1, odb.getOpe_name());
				ps.setString(2, odb.getFunction());
				ps.setString(3, date);
				ps.setString(4,odb.getSpecific_ope());

				ps.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				
				ConnectionManager.closeConnection(conn, ps, rs);
			}
	}

	public ArrayList searchOperateInfo() {
		
		conn = ConnectionManager.getConnection();
		ArrayList opeList = new ArrayList();
		try {
			ps=conn.prepareStatement(SQLStatement.SQL_SEARCH_OPERATE);
				
			rs=ps.executeQuery();
			
			while(rs.next()){
				OperateDateBean db = new OperateDateBean();
				db.setOpe_id(String.valueOf(rs.getInt(1)));
				db.setOpe_name(rs.getString(2));
				db.setFunction(rs.getString(3));
				db.setOpe_date(rs.getString(4));
				db.setSpecific_ope(rs.getString(5));
				opeList.add(db);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return opeList;
	}

	
public ArrayList searchOperateInfo(int pagesize,int curpage) {
		
		conn = ConnectionManager.getConnection();
		ArrayList opeList = new ArrayList();
		try {

			PageOperationDaoImpl podi = new PageOperationDaoImpl(SQLStatement.SQL_SEARCH_OPERATE);
			podi.setPagesize(pagesize);
		    podi.setCurpage(curpage);
			ps = conn.prepareStatement(podi.CreatePageSql());
				
			rs=ps.executeQuery();
			
			while(rs.next()){
				OperateDateBean db = new OperateDateBean();
				db.setOpe_id(String.valueOf(rs.getInt(1)));
				db.setOpe_name(rs.getString(2));
				db.setFunction(rs.getString(3));
				db.setOpe_date(rs.getString(4));
				db.setSpecific_ope(rs.getString(5));
				opeList.add(db);
			}
			opeList.add(podi);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return opeList;
	}
	
	public static void main(String[] args) {
		
	}

	public ArrayList fuzzyOperateInfo(int flag, String op) {
		conn = ConnectionManager.getConnection();
		ArrayList opeList = new ArrayList();
		try {
			if(flag==1) {
				ps = conn.prepareStatement(SQLStatement.SQL_OPERATE_OPERATOR);
			}
			if(flag==2) {
				ps = conn.prepareStatement(SQLStatement.SQL_OPERATE_FUNCTION);				
			}	
			ps.setString(1,op+"%");
			rs = ps.executeQuery();
			while(rs.next()){
				OperateDateBean db = new OperateDateBean();
				db.setOpe_id(String.valueOf(rs.getInt(1)));
				db.setOpe_name(rs.getString(2));
				db.setFunction(rs.getString(3));
				db.setOpe_date(rs.getString(4));
				db.setSpecific_ope(rs.getString(5));
				opeList.add(db);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return opeList;
	}

}
