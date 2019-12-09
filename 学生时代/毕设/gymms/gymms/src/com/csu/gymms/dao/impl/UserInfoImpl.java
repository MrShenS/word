package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csu.gymms.dao.SQLStatement;
import com.csu.gymms.dao.UserInfoDao;
import com.csu.gymms.entity.UsersBean;
import com.csu.gymms.util.ConnectionManager;

public class UserInfoImpl implements UserInfoDao {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	@SuppressWarnings("unchecked")
	public ArrayList getAllUserInfo() {
		conn =ConnectionManager.getConnection();
		ArrayList al=null;
		try {
			ps=	conn.prepareStatement(SQLStatement.SQL_USERINFO);
			rs =ps.executeQuery();
		    al =new ArrayList();
			while(rs.next()){
				UsersBean user = new UsersBean();
				String id =rs.getString(1);
				String userName=rs.getString(2);
				String password=rs.getString(3);
				String register_time=rs.getString(4).substring(0, 10);
				String realname=rs.getString(5);
				String sex=rs.getString(6);
				String birthday=rs.getString(7).substring(0, 10);
				String qq=rs.getString(8);
				String tel=rs.getString(9);
				String address=rs.getString(10);
				String typename=rs.getString(11);
				String email = rs.getString(12);
				user.setUserid(id);
				user.setUsername(userName);
				user.setPassword(password);
				user.setRegister_time(register_time);
				user.setSex(sex);
				user.setAddress(address);
				user.setBirthday(birthday);
				user.setQq(qq);
				user.setTel(tel);
				user.setTypeid(typename);
				user.setRealname(realname);
				user.setEmail(email);
				al.add(user);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return al;
	}

	
	public ArrayList getAllUserInfo(int pagesize,int curpage) {
		conn =ConnectionManager.getConnection();
		ArrayList al=null;
		try {
			PageOperationDaoImpl podi = new PageOperationDaoImpl(SQLStatement.SQL_USERINFO);
			podi.setPagesize(pagesize);
		    podi.setCurpage(curpage);
			ps=	conn.prepareStatement(podi.CreatePageSql());
			rs =ps.executeQuery();
		    al =new ArrayList();
			while(rs.next()){
				UsersBean user = new UsersBean();
				String id =rs.getString(1);
				String userName=rs.getString(2);
				String password=rs.getString(3);
				String register_time=rs.getString(4).substring(0, 10);
				String realname=rs.getString(5);
				String sex=rs.getString(6);
				String birthday=rs.getString(7).substring(0, 10);
				String qq=rs.getString(8);
				String tel=rs.getString(9);
				String address=rs.getString(10);
				String typename=rs.getString(11);
				String email = rs.getString(12);
				user.setUserid(id);
				user.setUsername(userName);
				user.setPassword(password);
				user.setRegister_time(register_time);
				user.setSex(sex);
				user.setAddress(address);
				user.setBirthday(birthday);
				user.setQq(qq);
				user.setTel(tel);
				user.setTypeid(typename);
				user.setRealname(realname);
				user.setEmail(email);
				al.add(user);
			}
			al.add(podi);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return al;
	}
	
	
	public boolean deleteUserInfo(int userid) {
		conn =ConnectionManager.getConnection();
		int num =0;
		boolean flag =false;
		try {
			ps=	conn.prepareStatement(SQLStatement.SQL_USERINFO_DELETE);
			ps.setInt(1, userid);
			num =ps.executeUpdate();
		   if(num>0){
			   flag =true;		   
		   }		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return flag;
	}

	public boolean insertUserInfo(UsersBean user) {
		conn =ConnectionManager.getConnection();
		int num =0;
		boolean flag =false;
		try {
			ps=	conn.prepareStatement(SQLStatement.SQL_USERINFO_INSERT);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getRegister_time());
			ps.setString(4, user.getRealname());
			ps.setString(5, user.getSex());
			ps.setString(6, user.getBirthday());
			ps.setString(7, user.getQq());
			ps.setString(8, user.getTel());
			ps.setString(9, user.getAddress());
			ps.setInt(10, Integer.parseInt(user.getTypeid()));
			ps.setString(11,null);
			num =ps.executeUpdate();
		   if(num>0){
			   flag =true;		   
		   }		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return flag;
	}

	public boolean modifyUserInfo(UsersBean user) {
		conn =ConnectionManager.getConnection();
		int num =0;
		boolean flag =false;
		try {
			ps=	conn.prepareStatement(SQLStatement.SQL_USERINFO_MODIFY);
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getRealname());
			ps.setString(3, user.getSex());
			ps.setString(4, user.getBirthday());
			ps.setString(5, user.getQq());
			ps.setString(6, user.getTel());
			ps.setString(7, user.getAddress());
			ps.setString(8, user.getEmail());
			ps.setString(9, user.getRegister_time());
			ps.setInt(10, Integer.parseInt(user.getTypeid()));
			ps.setString(11, user.getUserid());
			num =ps.executeUpdate();
		   if(num>0){
			   flag =true;		   
		   }		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return flag;
	}

	public ArrayList fuzzyUserInfo(int flag, String op) {
		conn =ConnectionManager.getConnection();
		ArrayList userlist = new ArrayList();
		try {
			if(flag==1) {
				ps = conn.prepareStatement(SQLStatement.SQL_USERID_USERINFO);
				ps.setString(1, op+"%");
			} else {
				ps = conn.prepareStatement(SQLStatement.SQL_USERNAME_USERINFO);
				ps.setString(1, op+"%");
			}
			rs = ps.executeQuery();
			while(rs.next()) {
				UsersBean user = new UsersBean();
				user.setUserid(String.valueOf(rs.getInt(1)));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setRegister_time(rs.getDate(4).toString().substring(0, 10));
				user.setRealname(rs.getString(5));
				user.setSex(rs.getString(6));
				user.setBirthday(rs.getDate(7).toString().substring(0, 10));
				user.setQq(rs.getString(8));
				user.setTel(rs.getString(9));
				user.setAddress(rs.getString(10));
				user.setTypeid(String.valueOf(rs.getInt(11)));
				user.setEmail(rs.getString(12));
				userlist.add(user);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return userlist;
	}
	
	public static void main(String args[]) {
		UserInfoImpl ui = new UserInfoImpl();
		System.out.println(ui.fuzzyUserInfo(1, "10").size());
	}

	public void bulkDeleteUserInfo(int userid) {
		conn = ConnectionManager.getConnection();  
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_BULK_USER);
			ps.setInt(1, userid);
			ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
	}
}
