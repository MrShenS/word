package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.csu.gymms.entity.VisitOrderBean;
import com.csu.gymms.entity.VisitorInfoBean;
import com.csu.gymms.util.ConnectionManager;

public class VisitorInfoImpl {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public void addVisitorOrder(VisitOrderBean vb) {
		conn =ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement("insert into visitororder values(SEQ_COURSE.nextval,?,to_date(?,'yyyy-mm-dd'),?)");
			ps.setString(1, vb.getName());
			ps.setString(2, vb.getTime());
			ps.setString(3, vb.getTel());
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
	}
	
	public void addVisitorInfo(VisitorInfoBean vb) {
		conn =ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement("insert into visitorinfo values(?,?,?,?,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'))");
			ps.setString(1, vb.getCardid());
			ps.setString(2, vb.getName());
			ps.setString(3, vb.getTel());
			ps.setString(4, vb.getAddress());
			ps.setString(5, vb.getStarttime());
			ps.setString(6, vb.getOvertime());
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
	}
}
