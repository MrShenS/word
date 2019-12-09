package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.csu.gymms.dao.PurchaseTrainerDao;
import com.csu.gymms.dao.SQLStatement;
import com.csu.gymms.entity.PurchaseTrainerBean;
import com.csu.gymms.util.ConnectionManager;

public class PurchaseTrainerImpl implements PurchaseTrainerDao {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;


	public void insertPurchaseTrainer(Object obj) {
		PurchaseTrainerBean ptb = null;
		if(obj instanceof PurchaseTrainerBean) {
			ptb = (PurchaseTrainerBean)obj;
		}
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_PURCHASE_TRAINER);
			ps.setString(1, ptb.getCardid());
			ps.setString(2, ptb.getCardtype());
			ps.setString(3, ptb.getMname());
			ps.setString(4, ptb.getCoursename());
			ps.setString(5, ptb.getMoney());
			ps.setString(6, ptb.getCoachname());
			ps.setString(7, ptb.getContent());
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, null);
		}
		
	}

}
