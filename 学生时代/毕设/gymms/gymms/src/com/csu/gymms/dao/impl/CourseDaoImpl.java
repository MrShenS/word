package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csu.gymms.dao.CourseDao;
import com.csu.gymms.dao.SQLStatement;
import com.csu.gymms.entity.CourseBean;
import com.csu.gymms.entity.MemberBean;
import com.csu.gymms.util.ConnectionManager;

public class CourseDaoImpl implements CourseDao {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;


	public void insertCourse(Object obj) {
		CourseBean cb= new CourseBean();
		if(obj instanceof CourseBean) {
			cb = (CourseBean)obj;
		}
		
		 conn= ConnectionManager.getConnection();
					try {
						ps=conn.prepareStatement(SQLStatement.SQL_CURRICULUM_ADD);
						
						ps.setString(1, cb.getCoursename());
						ps.setString(2, cb.getRoomname());
						ps.setString(3, cb.getCoachname());
						ps.setString(5, cb.getDevicename());
						ps.setString(6, cb.getBenifits());
						ps.execute();
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						ConnectionManager.closeConnection(conn, ps, null);
					}
	}
	
	public ArrayList searchCourse(String coursename) {
		  ArrayList courseList = new ArrayList();
		    
		   conn= ConnectionManager.getConnection();
		    
		    try {
				ps=conn.prepareStatement(SQLStatement.SQL_CUR_CHECK);
				ps.setString(1,coursename+"%");				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					CourseBean cb= new CourseBean();
					
					cb.setCoursename(rs.getString("coursename"));
					cb.setCarpnumber(rs.getString("carpnumber"));
					cb.setCoachname(rs.getString("coachname"));
					cb.setCourseid(rs.getString("courseid"));
					cb.setDevicename(rs.getString("devicename"));
					cb.setRoomname(rs.getString("roomname"));
					cb.setBenifits(rs.getString("benifits"));
					
					courseList.add(cb);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				ConnectionManager.closeConnection(conn, ps, rs);
			}
		    
		  
		  return courseList;
	  }

	public ArrayList searchCourseName() {
		ArrayList courseNameList = new ArrayList();
	    
		   conn= ConnectionManager.getConnection();
		    
		    try {
				ps=conn.prepareStatement(SQLStatement.SQL_CUR_CHECKNAME);		
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					CourseBean cb= new CourseBean();
					
					cb.setCoursename(rs.getString("coursename"));
					cb.setCarpnumber(rs.getString("carpnumber"));
					cb.setCoachname(rs.getString("coachname"));
					cb.setCourseid(rs.getString("courseid"));
					cb.setDevicename(rs.getString("devicename"));
					cb.setRoomname(rs.getString("roomname"));
					cb.setBenifits(rs.getString("benifits"));
					
					courseNameList.add(cb);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				ConnectionManager.closeConnection(conn, ps, rs);
			}
		    
		  
		  return courseNameList;
	}

	
}
