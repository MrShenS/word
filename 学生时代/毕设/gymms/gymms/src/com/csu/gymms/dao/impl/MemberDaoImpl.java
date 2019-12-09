package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csu.gymms.dao.MemberDao;
import com.csu.gymms.dao.SQLStatement;
import com.csu.gymms.entity.CoachBean;
import com.csu.gymms.entity.MemberBean;
import com.csu.gymms.util.ConnectionManager;

public class MemberDaoImpl implements MemberDao {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public ArrayList searchMember() {
		conn = ConnectionManager.getConnection();
		ArrayList memberList = new ArrayList();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_MEMBER);
			rs = ps.executeQuery();
			while(rs.next()){
				MemberBean mb = new MemberBean();
				mb.setMno(rs.getString("mno"));
				mb.setMname(rs.getString("mname"));
				mb.setId(rs.getString("id"));
				mb.setEmail(rs.getString("email"));
				mb.setMgroup(rs.getString("groupname"));
				mb.setSex(rs.getString("sex"));
				mb.setBirthday(rs.getString("birthday"));
				mb.setQq(rs.getString("qq"));
				mb.setTelphone(rs.getString("telphone"));
				mb.setPhone(rs.getString("phone"));
				mb.setAddress(rs.getString("address"));
				mb.setDescription(rs.getString("description"));
				memberList.add(mb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return memberList;
	}

	
	
//	查询所有会员信息
	public ArrayList searchMember(int pagesize,int curpage) {
		conn = ConnectionManager.getConnection();
		ArrayList memberList = new ArrayList();
		try {
			
			PageOperationDaoImpl podi = new PageOperationDaoImpl(SQLStatement.SQL_MEMBER);
			podi.setPagesize(pagesize);
		    podi.setCurpage(curpage);
			ps = conn.prepareStatement(podi.CreatePageSql());
		
			rs = ps.executeQuery();
			while(rs.next()){
				MemberBean mb = new MemberBean();
				mb.setMno(rs.getString("mno"));
				mb.setMname(rs.getString("mname"));
				mb.setId(rs.getString("id"));
				mb.setEmail(rs.getString("email"));
				mb.setMgroup(rs.getString("groupname"));
				mb.setSex(rs.getString("sex"));
				mb.setBirthday(rs.getString("birthday"));
				mb.setQq(rs.getString("qq"));
				mb.setTelphone(rs.getString("telphone"));
				mb.setPhone(rs.getString("phone"));
				mb.setAddress(rs.getString("address"));
				mb.setDescription(rs.getString("description"));
				memberList.add(mb);
			}
			memberList.add(podi);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return memberList;
	}
	
	
	
	//增加会员信息
	public void insertMember(Object obj) {
		MemberBean mb = null;
		if(obj instanceof MemberBean) {
			mb = (MemberBean)obj;
		}
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_INSERT_MEMBER);
			ps.setString(1, mb.getMno());
			ps.setString(2, mb.getMname());
			ps.setString(3, mb.getId());
			ps.setString(4, mb.getEmail());
			ps.setInt(5, Integer.parseInt(mb.getMgroup()));
			ps.setString(6, mb.getSex());
			ps.setString(7, mb.getBirthday().substring(0,10));
			ps.setString(8, mb.getQq());
			ps.setString(9, mb.getTelphone());
			ps.setString(10, mb.getPhone());
			ps.setString(11, mb.getAddress());
			ps.setString(12, mb.getDescription());
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, null);
		}
		
	}
	
	public void updateMember(Object obj) {
		MemberBean mb = null;
		if(obj instanceof MemberBean) {
			mb = (MemberBean)obj;
		}
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_UPDATE_MEMBER);
			
			ps.setString(1, mb.getMname());
			ps.setString(2, mb.getId());
			ps.setString(3, mb.getEmail());
			ps.setInt(4, Integer.parseInt(mb.getMgroup()));
			ps.setString(5, mb.getSex());
			ps.setString(6, mb.getBirthday().substring(0,10));
			ps.setString(7, mb.getQq());
			ps.setString(8, mb.getTelphone());
			ps.setString(9, mb.getPhone());
			ps.setString(10, mb.getAddress());
			ps.setString(11, mb.getDescription());
			ps.setString(12, mb.getMno());
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, null);
		}
		
	}

	public void deleteMember(String mno) {
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_DELETE_MEMBER);
			ps.setString(1, mno);
			ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection(conn, ps, null);
		}
		
	}

	public ArrayList fuzzySearchMember(int flag, String op) {
		conn = ConnectionManager.getConnection();
		ArrayList mList = new ArrayList();
		
			try {
				if(flag==1) {
				ps = conn.prepareStatement(SQLStatement.SQL_SEARCH_MEMBERNAME);
				}
				if(flag==2) {
					ps = conn.prepareStatement(SQLStatement.SQL_SEARCH_MEMBERID);				
				}
				ps.setString(1,op+"%");
				rs = ps.executeQuery();
				while(rs.next()){
					MemberBean mb = new MemberBean();
					mb.setMno(rs.getString("mno"));
					mb.setMname(rs.getString("mname"));
					mb.setId(rs.getString("id"));
					mb.setMgroup(rs.getString("groupname"));
					mb.setEmail(rs.getString("email"));
					mList.add(mb);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				ConnectionManager.closeConnection(conn, ps, rs);
			}
		return mList;
	}

	public void bulkDeleteMember(String mno) {
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_BULK_MEMBER);
			ps.setString(1, mno);
			ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
	}
}
