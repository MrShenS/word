package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csu.gymms.dao.SQLStatement;
import com.csu.gymms.dao.SendEmailDao;
import com.csu.gymms.entity.EmailBean;
import com.csu.gymms.util.ConnectionManager;

public class SendEmailDaoImpl implements SendEmailDao {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public boolean modifyReadState(String e_id,String userId) {
		// TODO Auto-generated method stub
		conn =ConnectionManager.getConnection();
		boolean flag=false;
		try {
			ps =conn.prepareCall(SQLStatement.SQL_EMAIL_MODIFIYSTATE);	
			ps.setString(1, e_id);
			ps.setString(2, userId);
			int index =ps.executeUpdate();
			if(index>0){
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, null);
		}
		return flag;
	}
	
	public ArrayList reserveEmail(String notTypeid,String userId) {
		// TODO Auto-generated method stub
		conn =ConnectionManager.getConnection();
		ArrayList al = null;
		try {
			ps =conn.prepareStatement(SQLStatement.SQL_EMAIL_RESERVER);
			ps.setString(1,notTypeid );
			ps.setString(2,userId );
			rs = ps.executeQuery();
		    al = new ArrayList();
			while(rs.next()){
				EmailBean  email = new EmailBean();
				email.setSend_grop(rs.getString("send_usergrop"));
				email.setSend_name(rs.getString("send_name"));
				email.setTitle(rs.getString("e_title"));
				email.setContext(rs.getString("e_context"));
				email.setRead(rs.getString("is_read"));
				email.setSendDate(rs.getString("send_date"));
				email.setE_id(rs.getString("e_id"));
				al.add(email);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return al;
	}

	public boolean sendEmail(ArrayList userIdList,EmailBean email) {
		// TODO Auto-generated method stub
		conn =ConnectionManager.getConnection();
		boolean flag = false;
		int index =0;
		try {
			for(int i=0; i<userIdList.size();i++){		
				ps =conn.prepareStatement(SQLStatement.SQL_EMAIL_SEND);
			    ps.setString(1, email.getSend_name());
			    ps.setString(2, email.getSend_grop());
			    ps.setString(3, email.getTitle());
			    ps.setString(4, email.getContext());
			    ps.setString(5, (String)userIdList.get(i));
			    
			    ps.executeUpdate();
			    index++;
			}		
			System.out.println("size"+userIdList.size()+"index"+index);
		     if(index==userIdList.size()){
		    	 flag = true;
		     }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, null);
		}
		return flag;
	}

	public boolean deleteEmail(String e_id,String userId) {
		// TODO Auto-generated method stub
		conn =ConnectionManager.getConnection();
		boolean flag=false;
		try {
			ps =conn.prepareCall(SQLStatement.SQL_EMAIL_DELETE);
			ps.setString(1, e_id);
			ps.setString(2, userId);
			int index =ps.executeUpdate();
			if(index>0){
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, null);
		}
		return flag;
	}
}
