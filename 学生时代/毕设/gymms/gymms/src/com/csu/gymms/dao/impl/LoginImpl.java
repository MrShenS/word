package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.csu.gymms.dao.LoginDao;
import com.csu.gymms.dao.SQLStatement;
import com.csu.gymms.entity.UsersBean;
import com.csu.gymms.util.ConnectionManager;

public class LoginImpl implements LoginDao {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public boolean validate_login(UsersBean user) {
		// TODO Auto-generated method stub
		conn =ConnectionManager.getConnection();
		boolean flag=false;
		try {
			ps =conn.prepareStatement(SQLStatement.SQL_LOGIN);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getTypeid());
			rs  =ps.executeQuery();
			while(rs.next()){
				if((rs.getString(1).equals("1"))){
					flag =true;
				}			
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return flag;
	}

}
