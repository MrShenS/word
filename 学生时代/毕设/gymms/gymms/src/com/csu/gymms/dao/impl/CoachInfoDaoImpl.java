package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.directwebremoting.impl.DefaultAccessControl;

import com.csu.gymms.dao.CoachInfoDao;
import com.csu.gymms.dao.SQLStatement;
import com.csu.gymms.entity.CoachBean;
import com.csu.gymms.util.ConnectionManager;

public class CoachInfoDaoImpl implements CoachInfoDao {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public ArrayList searchCoachInfo() {
		conn = ConnectionManager.getConnection();
		ArrayList clist = new ArrayList();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_COACH_INFO);
			rs = ps.executeQuery();
			while(rs.next()) {
				CoachBean cb = new CoachBean();
				cb.setCno(rs.getString("cno"));
				cb.setCname(rs.getString("cname"));
				cb.setCid(rs.getString("cID"));
				cb.setSex(rs.getString("sex"));
				cb.setBirthday(rs.getString("birthday").substring(0, 10));
				cb.setAddress(rs.getString("address"));
				cb.setQq(rs.getString("qq"));
				cb.setEmail(rs.getString("email"));
				cb.setType(rs.getString("tname"));
				cb.setTel(rs.getString("tel"));
				cb.setDescription(rs.getString("description"));
				cb.setPhotofile(rs.getString("photofile"));
				clist.add(cb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return clist;
	}
	
	public ArrayList searchCoachInfo(int pagesize,int curpage) {
		conn = ConnectionManager.getConnection();
		ArrayList clist = new ArrayList();
		try {
			PageOperationDaoImpl podi = new PageOperationDaoImpl(SQLStatement.SQL_COACH_INFO);
			podi.setPagesize(pagesize);
		    podi.setCurpage(curpage);
			ps = conn.prepareStatement(podi.CreatePageSql());
		//	System.out.println("sql====" + podi.CreatePageSql());
			rs = ps.executeQuery();
			while(rs.next()) {
				CoachBean cb = new CoachBean();
				cb.setCno(rs.getString("cno"));
				cb.setCname(rs.getString("cname"));
				cb.setCid(rs.getString("cID"));
				cb.setSex(rs.getString("sex"));
				cb.setBirthday(rs.getString("birthday").substring(0, 10));
				cb.setAddress(rs.getString("address"));
				cb.setQq(rs.getString("qq"));
				cb.setEmail(rs.getString("email"));
				cb.setType(rs.getString("tname"));
				cb.setTel(rs.getString("tel"));
				cb.setDescription(rs.getString("description"));
				cb.setPhotofile(rs.getString("photofile"));
				clist.add(cb);
			}
			clist.add(podi);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return clist;
	}
	
	public void insertCoachInfo(Object obj) {
		CoachBean cb = null;
		if(obj instanceof CoachBean) {
			cb = (CoachBean)obj;
		}
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_ADD_COACH);
			ps.setString(1, cb.getCno());
			ps.setString(2, cb.getCname());
			ps.setString(3, cb.getCid());
			ps.setString(4, cb.getSex());
			ps.setString(5, cb.getBirthday());
			ps.setString(6, cb.getAddress());
			ps.setString(7, cb.getQq());
			ps.setString(8, cb.getEmail());
			ps.setInt(9, Integer.parseInt(cb.getType()));
			ps.setString(10, cb.getTel());
			ps.setString(11, cb.getDescription());
			ps.setString(12, cb.getPhotofile());
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, null);
		}
	}



	public void modifyCoachInfo(Object obj) {
		CoachBean cb = null;
		if(obj instanceof CoachBean) {
			cb = (CoachBean)obj;
		}
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_MODIFY_COACH);
			ps.setString(1, cb.getCname());
			ps.setString(2, cb.getCid());
			ps.setString(3, cb.getSex());
			ps.setString(4, cb.getBirthday());
			ps.setString(5, cb.getAddress());
			ps.setString(6, cb.getQq());
			ps.setString(7, cb.getEmail());
			ps.setInt(8, Integer.parseInt(cb.getType()));
			ps.setString(9, cb.getTel());
			ps.setString(10, cb.getDescription());
			ps.setString(11, cb.getPhotofile());
			ps.setString(12, cb.getCno());
			ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, null);
		}
	}

	public void deleteCoachInfo(String cno) {
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_DELETE_COACH);
			ps.setString(1, cno);
			ps.executeQuery();
			System.out.println("111111111111111111111111");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, null);
		}
	}

	public ArrayList fuzzySearchCoachInfo(int flag,String op) {
		conn = ConnectionManager.getConnection();
		ArrayList flist = new ArrayList();
		try {
			if(flag==1) {
				ps = conn.prepareStatement(SQLStatement.SQL_SEARCH_COACHNAME);
			}
			if(flag==2) {
				ps = conn.prepareStatement(SQLStatement.SQL_SEARCH_COACHID);				
			}	
			ps.setString(1,op+"%");
			rs = ps.executeQuery();
			while(rs.next()) {
				CoachBean cb = new CoachBean();
				cb.setCno(rs.getString("cno"));
				cb.setCname(rs.getString("cname"));
				cb.setCid(rs.getString("cID"));
				cb.setType(rs.getString("tname"));
				cb.setTel(rs.getString("tel"));
				flist.add(cb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return flist;
	}
	
	public static void main(String[] args) {
		CoachInfoDaoImpl cii = new CoachInfoDaoImpl();
		cii.bulkDeleteCoachInfo("e010,e015");
		System.out.println();
	}

	public void bulkDeleteCoachInfo(String cno) {
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_BULK_COACHINFO);
			ps.setString(1, cno);
			ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
	}

	public void modifyPartCoachInfo(Object obj) {
		CoachBean cb = null;
		if(obj instanceof CoachBean) {
			cb = (CoachBean)obj;
		}
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_MODIFY_PCOACH);
			ps.setString(1, cb.getCname());
			ps.setString(2, cb.getCid());
			ps.setString(3, cb.getSex());
			ps.setString(4, cb.getBirthday());
			ps.setString(5, cb.getAddress());
			ps.setString(6, cb.getQq());
			ps.setString(7, cb.getEmail());
			ps.setInt(8, Integer.parseInt(cb.getType()));
			ps.setString(9, cb.getTel());
			ps.setString(10, cb.getDescription());
			ps.setString(11, cb.getCno());
			ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, null);
		}
	}
}
