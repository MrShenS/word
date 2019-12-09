package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csu.gymms.dao.DevicesDao;
import com.csu.gymms.dao.SQLStatement;
import com.csu.gymms.entity.DeviceInfoBean;
import com.csu.gymms.entity.MemberBean;
import com.csu.gymms.util.ConnectionManager;

public class DevicesDaoImpl implements DevicesDao {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	boolean al=false;

	//增加
	public void insertDevices(Object obj) {
		DeviceInfoBean db = null;
		if(obj instanceof DeviceInfoBean) {
			db = (DeviceInfoBean)obj;
		}
		conn = ConnectionManager.getConnection();
		 try {
				ps=conn.prepareStatement(SQLStatement.SQL_DEVICES_ADD);
				ps.setString(1, db.getDeviceid());
				ps.setString(2, db.getDevicename());
				ps.setString(3, db.getPrincipal());
				ps.setString(4, db.getRoom());
				ps.setString(5, db.getEntrancetime());
				ps.setString(6, db.getUsetime());
				ps.setString(7, db.getBrief());
				
			
				
				
				ps.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				
				ConnectionManager.closeConnection(conn, ps, rs);
			}
		
	}

	//查找
	public ArrayList seachDevices() {
		conn = ConnectionManager.getConnection();
		ArrayList devicesList = new ArrayList();
		try {
			ps=conn.prepareStatement(SQLStatement.SQL_DEVICES_CHECK);
				
			rs=ps.executeQuery();
			
			while(rs.next()){
			    DeviceInfoBean db = new DeviceInfoBean();
			  	db.setBrief(rs.getString("brief"));	
			  	db.setDeviceid(rs.getString("deviceid"));
			  	db.setDevicename(rs.getString("devicename"));
			  	db.setEntrancetime(rs.getString("entrancetime"));
			  	db.setPrincipal(rs.getString("principal"));
			  	db.setRoom(rs.getString("room"));
			  	db.setUsetime(rs.getString("usetime"));
			  	
			  	devicesList.add(db);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return devicesList;
	}
	

	//刪除
	public boolean deleteDevicesSucessDao(int cno) {
			// TODO Auto-generated method stub
			
			conn= ConnectionManager.getConnection();		   
			try {
				ps=conn.prepareStatement(SQLStatement.SQL_DEVICES_DELETE);
				ps.setInt(1, cno);
				
				al=ps.execute();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				
				ConnectionManager.closeConnection(conn, ps, rs);
			}
		  return al;
			
	}

    //修改

	
	
	public boolean amendDivicesDao(DeviceInfoBean db) {
		// TODO Auto-generated method stub
		 
		 Connection conn= ConnectionManager.getConnection();  
		  try {
			ps=conn.prepareStatement(SQLStatement.SQL_DEVICES_UPDATE);
			ps.setString(1,db.getDevicename());
			ps.setString(2,db.getPrincipal());
			ps.setInt(3,Integer.parseInt(db.getRoom()));
			ps.setString(4,db.getEntrancetime().substring(0, 10));
			ps.setString(5,db.getUsetime().substring(0, 10));
			ps.setString(6,db.getBrief());
			ps.setInt(7, Integer.parseInt(db.getDeviceid().trim()));
		
            
		
			
			al=ps.execute();
			
			
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			 
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		
		 
		return al;
	}

}
