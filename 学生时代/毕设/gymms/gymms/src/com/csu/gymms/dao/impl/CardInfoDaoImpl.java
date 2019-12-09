package com.csu.gymms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csu.gymms.dao.CardInfoDao;
import com.csu.gymms.dao.SQLStatement;
import com.csu.gymms.entity.CardInfoBean;
import com.csu.gymms.entity.CoachBean;
import com.csu.gymms.util.ConnectionManager;

public class CardInfoDaoImpl implements CardInfoDao {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public void insertCard(Object obj) {
		CardInfoBean cib = null;
		if(obj instanceof CardInfoBean) {
			cib = (CardInfoBean)obj;
		}
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_ADD_CARD);
			ps.setString(1, cib.getCardid());
			ps.setInt(2, Integer.parseInt(cib.getCardtype()));
			ps.setInt(3, Integer.parseInt(cib.getCardstate()));
			ps.setString(4, cib.getMoney());
			ps.setString(5, cib.getStartdate());
			ps.setString(6, cib.getOverdate());
			ps.setString(7, cib.getContent());
		
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, null);
		}
		
	}
	
	public ArrayList searchCardInfo(){
		conn = ConnectionManager.getConnection();
		ArrayList cardList = new ArrayList();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_CARD_INFO);
			rs = ps.executeQuery();
			while(rs.next()) {
				CardInfoBean cib = new CardInfoBean();
				cib.setCardid(rs.getString("cardid"));
				cib.setMname(rs.getString("mname"));
				cib.setMid(rs.getString("id"));
				cib.setCardtype(rs.getString("typename"));
				cib.setCardstate(rs.getString("statename"));
				cib.setMoney(rs.getString("money"));
				cib.setStartdate(rs.getString("startdate").substring(0, 10));
				cib.setOverdate(rs.getString("overdate").substring(0, 10));
				cib.setContent(rs.getString("content"));
				cardList.add(cib);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}		
		return cardList;
	}
	
	public static void main(String[] args) {
		CardInfoDaoImpl cidf = new CardInfoDaoImpl();
		ArrayList clist = cidf.searchCardInfo();
		System.out.println(clist.size());
	}

	public void updatCardMondy(String cardid, double money) {
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_RECHARGE_CARD);
			ps.setDouble(1, money);
			ps.setString(2, cardid);
			ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		
	}

	public void deleteCardInfo(String newcardid) {
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_DELETE_CARD);
			ps.setString(1, newcardid);
			ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
	} 

	public void insertCardInfo(Object obj) {
		CardInfoBean cb = null;
		if(obj instanceof CardInfoBean) {
			cb = (CardInfoBean)obj;
		}
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_INSERT_CARD);
			ps.setString(1, cb.getCardid());
			if(cb.getCardtype().equals("Äê¿¨")) {
				ps.setInt(2, 1);
			}else if(cb.getCardtype().equals("°ëÄê¿¨")) {
				ps.setInt(2, 2);
			} else if(cb.getCardtype().equals("¼¾¿¨")) {
				ps.setInt(2, 3);
			} else if(cb.getCardtype().equals("ÔÂ¿¨")) {
				ps.setInt(2, 4);
			} else {
				ps.setInt(2, 5);
			} 
			
			if(cb.getStartdate().equals("¼¤»î")) {
				ps.setInt(3, 1);
			} else {
				ps.setInt(3, 2);
			}
			ps.setString(4, cb.getMoney());
			ps.setString(5, cb.getStartdate().substring(0, 10));
			ps.setString(6, cb.getOverdate().substring(0, 10));
			ps.setString(7, cb.getContent());
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
	}

	public void updateMemberInfo(String cardid,String newcardid) {
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_UPDATEMEMBER);
			ps.setString(1, newcardid);
			ps.setString(2, cardid);
			ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
	}

	public void updateCardState(int cardstate,String cardid) {
		conn = ConnectionManager.getConnection();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_UPDATE_CARDSTATE);
			ps.setInt(1, cardstate);
			ps.setString(2, cardid);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
	}

	public ArrayList searchByCardId(String cardid) {
		conn = ConnectionManager.getConnection();
		ArrayList cardList = new ArrayList();
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_CARDID_INFO);
			ps.setString(1, cardid);
			rs = ps.executeQuery();
			while(rs.next()) {
				CardInfoBean cib = new CardInfoBean();
				cib.setCardid(rs.getString("cardid"));
				cib.setMname(rs.getString("mname"));
				cib.setMid(rs.getString("id"));
				cib.setCardtype(rs.getString("typename"));
				cib.setCardstate(rs.getString("statename"));
				cib.setMoney(rs.getString("money"));
				cib.setStartdate(rs.getString("startdate").substring(0, 10));
				cib.setOverdate(rs.getString("overdate").substring(0, 10));
				cib.setContent(rs.getString("content"));
				cardList.add(cib);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}		
		return cardList;
	}

	public String searchCardState(String cardid) {
		conn = ConnectionManager.getConnection();
		String cardstate = "";
		try {
			ps = conn.prepareStatement(SQLStatement.SQL_SEARCH_CARDSTATE);
			ps.setString(1, cardid);
			rs = ps.executeQuery();
			rs.next();
			cardstate=rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn, ps, rs);
		}
		return cardstate;
	}

}
