package team.project1.dao;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import team.project1.dto.*;


public class statsDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//매출로 조회
	public ArrayList<statsDTO> statsSearch(String date1, String date2, int start, int end){
		ArrayList<statsDTO> list = new ArrayList<statsDTO>();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from (select adminstat.* , rownum r from adminstat where inputdate between to_date('"+date1+"','YYYY/MM/DD')and to_date ('"+date2+"','YYYY/MM/DD')+1) where r between "+start+" and "+end;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				statsDTO dto = new statsDTO();
				dto.setInputdate(rs.getString("inputdate"));
				dto.setPurchase(rs.getString("purchase"));
				dto.setSales(rs.getString("sales"));
				dto.setSpending(rs.getString("spending"));
				dto.setPretext(rs.getString("pretext"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return list;
	}

	//매출로 조회한 결과값 count
	public String statsCount(String date1, String date2) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			String sql = "select count (*) as statscount from (select * from adminstat where inputdate between to_date('" + date1 + "','YYYY/MM/DD') and to_date ('" + date2 + "','YYYY/MM/DD')+1)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return result;
	}
	
	//성별로 매출 조회
	public ArrayList<adminMemDTO> genderSales(String date1,String date2,String gender){
		ArrayList<adminMemDTO> list = new ArrayList<adminMemDTO>();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from member where gender='"+gender+"'";
			pstmt = conn.prepareStatement(sql);		
			rs = pstmt.executeQuery();
			while (rs.next()) {
				adminMemDTO dto = new adminMemDTO();
				dto.setGender(rs.getString("gender"));
				dto.setAmount(rs.getString("amount"));
				dto.setBuycount(rs.getString("buycount"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return list;
	}
	
	//매출 총합
	public String amountSummary (String gender) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			String sql = "select sum(amount) from(select * from member where gender='"+gender+"')";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return result;
	}
	public String buyCountSum (String gender) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			String sql = "select sum(buycount) from (select * from member where gender='"+gender+"')";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return result;
	}
	
	//매입 조회
	public ArrayList<statsDTO> purchaseSearch(String date1,String date2,int start,int end){
		ArrayList<statsDTO> list = new ArrayList<statsDTO>();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from"
					+ " (select ad.* , rownum r from (select * from adminstat where inputdate"
					+ " between to_date('"+date1+"','yyyy/mm/dd') and to_date('"+date2+"','yyyy/mm/dd')) ad)"
					+ " where r between "+start+" and "+end;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				statsDTO dto = new statsDTO();
				dto.setInputdate(rs.getString("inputdate"));
				dto.setPurchase(rs.getString("purchase"));
				dto.setSales(rs.getString("sales"));
				dto.setSpending(rs.getString("spending"));
				dto.setPretext(rs.getString("pretext"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return list;
	}
	
	//매입 조회 결과값 count
	public String purchaseCount(String date1, String date2) {
		String result  = null;
		try {
			conn = OracleConnection.getConnection();
			String sql = "select count(*) from(select * from(select * from adminstat where inputdate between to_date('"+date1+"','yyyy/mm/dd') and to_date('"+date2+"','yyyy/mm/dd')) where purchase!='null')";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return result;
	}
	
	//지출 조회
	public ArrayList<statsDTO> spendSearch(String date1, String date2,int start,int end){
		ArrayList<statsDTO> list = new ArrayList<statsDTO>();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from"
					+ " (select ad.* , rownum r from (select * from adminstat where inputdate"
					+ " between to_date('"+date1+"','yyyy/mm/dd') and to_date('"+date2+"','yyyy/mm/dd')) ad)"
					+ " where r between "+start+" and "+end;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				statsDTO dto = new statsDTO();
				dto.setInputdate(rs.getString("inputdate"));
				dto.setPurchase(rs.getString("purchase"));
				dto.setSales(rs.getString("sales"));
				dto.setSpending(rs.getString("spending"));
				dto.setPretext(rs.getString("pretext"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return list;
	}
	
	//지출 조회 검색값 count
	public String spendCount(String date1, String date2) {
		String result  = null;
		try {
			conn = OracleConnection.getConnection();
			String sql = "select count(*) from(select * from(select * from adminstat where inputdate between to_date('"+date1+"','yyyy/mm/dd') and to_date('"+date2+"','yyyy/mm/dd')) where spending!='null')";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return result;
	}
	
	//지출 내역 입력
	public int spendInsert(statsDTO dto) {
		int result = 0;
		try {
			conn = OracleConnection.getConnection();
			String sql = "insert into adminstat (inputdate,purchase,sales,spending,pretext) values (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getInputdate());
			pstmt.setString(2,dto.getPurchase());
			pstmt.setString(3,dto.getSales());
			pstmt.setString(4,dto.getSpending());
			pstmt.setString(5,dto.getPretext());			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return result;
	}
	//매입 내역 입력
	public int purchaseInsert(statsDTO dto) {
		int result = 0;
		try {
			conn = OracleConnection.getConnection();
			String sql = "insert into adminstat (inputdate,price,quantity,purchase,sales,spending,pretext) values (?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getInputdate());
			pstmt.setString(2,dto.getPrice());
			pstmt.setString(3,dto.getQuantity());
			pstmt.setString(4,dto.getPurchase());
			pstmt.setString(5,dto.getSales());
			pstmt.setString(6,dto.getSpending());
			pstmt.setString(7,dto.getPretext());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return result;
	}
}
