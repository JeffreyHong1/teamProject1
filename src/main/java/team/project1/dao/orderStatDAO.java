package team.project1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import team.project1.dto.orderStatDTO;

public class orderStatDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//주문 상태 검색
	public ArrayList<orderStatDTO> orderStatus (String result){
		ArrayList<orderStatDTO> list = new ArrayList<orderStatDTO>();
		try {				
			conn = OracleConnection.getConnection();
			String sql = "select * from member where orderstat in (" + result + ")";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();			
			while(rs.next()) {
				orderStatDTO dto = new orderStatDTO();
				dto.setId(rs.getString("id"));
				dto.setOrderdate(rs.getTimestamp("orderdate"));
				dto.setOrderProd(rs.getString("orderProd"));
				dto.setOrderStat(rs.getString("orderStat"));				
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
	
	//주문 일 검색
	public ArrayList<orderStatDTO> dateSearch (String num1, String num2, int start, int end){
		ArrayList<orderStatDTO> list = new ArrayList<orderStatDTO>();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from (select memberorder.*, rownum r from memberorder where buy_reg between to_date('"+num2+"','YYYY/MM/DD') and to_date ('"+num2+"','YYYY/MM/DD')+1) where r between "+start+" and " + end;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				orderStatDTO dto = new orderStatDTO();
				dto.setId(rs.getString("id"));
				dto.setOrderdate(rs.getTimestamp("orderdate"));
				dto.setOrderProd(rs.getString("orderProd"));
				dto.setOrderStat(rs.getString("orderStat"));				
				list.add(dto);	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return list;
	}
	
	//주문일 검색 count
	public String orderDateCount(String num1,String num2) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			String sql = "select count(*) as orderDateCount from (select * from memberorder where buy_reg between to_date('"+num1+"','YYYY/MM/DD') and to_date ('"+num2+"','YYYY/MM/DD')+1)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("orderDateCount");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return result;
	}
	
	//주문 상품으로 검색
	public ArrayList<orderStatDTO> prodSearch(String parts,String gender, int start, int end){
		ArrayList<orderStatDTO> list = new ArrayList<orderStatDTO>();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from member where orderprod='" + parts + "'";
			//프로젝트 DB 완성 되면 회원 테이블의 성별 과 조인검색
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				orderStatDTO dto = new orderStatDTO();
				dto.setId(rs.getString("id"));
				dto.setOrderdate(rs.getTimestamp("orderdate"));
				dto.setOrderProd(rs.getString("orderProd"));
				dto.setOrderStat(rs.getString("orderStat"));				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return list;
	}
	//상품으로 주문 검색 count
	public String orderProdCount(String parts,String gender) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			String sql = "";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return result;
	}
	
	//반품 조회
	public ArrayList<orderStatDTO> refundSearch(String result, String date1, String date2){
		ArrayList<orderStatDTO> list = new ArrayList<orderStatDTO>();
		try {
			conn = OracleConnection.getConnection();
			//주문 날짜로 반품 검색
			if(date1 != null) {
				String sql = "select * from member where orderdate between to_date('" + date1 + "','YYYY/MM/DD') and to_date ('" + date2 + "','YYYY/MM/DD') and orderstat in(7,8,9,10)";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					orderStatDTO dto = new orderStatDTO();
					dto.setId(rs.getString("id"));
					dto.setOrderdate(rs.getTimestamp("orderdate"));
					dto.setOrderProd(rs.getString("orderProd"));
					dto.setOrderStat(rs.getString("orderStat"));				
					list.add(dto);
				}
			}else {
				String sql = "select * from member where orderstat in(" + result + ")";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					orderStatDTO dto = new orderStatDTO();
					dto.setId(rs.getString("id"));
					dto.setOrderdate(rs.getTimestamp("orderdate"));
					dto.setOrderProd(rs.getString("orderProd"));
					dto.setOrderStat(rs.getString("orderStat"));				
					list.add(dto);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return list;
	}
}
