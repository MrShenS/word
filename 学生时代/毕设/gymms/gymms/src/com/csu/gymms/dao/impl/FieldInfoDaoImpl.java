package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csu.gymms.dao.FieldInfoDao;
import com.csu.gymms.dao.SQLStatement;
import com.csu.gymms.entity.FieldInfoBean;
import com.csu.gymms.util.ConnectionManager;

public class FieldInfoDaoImpl implements FieldInfoDao {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public void deleteFieldInfo(String roomname) {
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_DELETE_FIELD);
			ps.setString(1, roomname);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
	}

	public void insertFieldInfo(Object obj) {
		FieldInfoBean fib = null;;
		if(obj instanceof FieldInfoBean) {
			fib = (FieldInfoBean)obj;
		}
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_ADD_FIELD);
			ps.setString(1, fib.getRoomname());
			ps.setInt(2, Integer.parseInt(fib.getAccountnumber()));
			ps.setString(3, fib.getRoomphoto());
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
	}

	public ArrayList searchFieldInfo() {
		conn = ConnectionManager.getConnection();
		ArrayList flist = new ArrayList();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_FIELD_INFO);
			rs = ps.executeQuery();
			while(rs.next()) {
				FieldInfoBean fb = new FieldInfoBean();
				fb.setRoomid(String.valueOf(rs.getInt(1)));
				fb.setRoomname(rs.getString(2));
				fb.setAccountnumber(String.valueOf(rs.getInt(3)));
				fb.setRoomphoto(rs.getString(4));
				flist.add(fb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return flist;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
