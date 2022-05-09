package team.project1.dao;

import java.sql.*;
import java.util.ArrayList;
import team.project1.dto.FormDTO;
import team.project1.dto.OrderDTO;
import team.project1.dto.productDTO;



public class OrderDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//비회원 장바구니
	public ArrayList<OrderDTO> cartGuest(String order_num)  {
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
			try {
				conn = OracleConnection.getConnection();
				String sql = "select * from cartlist(id)  values(?) ";
				pstmt = conn.prepareStatement(sql);	
				pstmt.setString(1, order_num);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					OrderDTO dto = new OrderDTO();	
					dto.setPname(rs.getString("pname"));
					dto.setImg(rs.getString("img"));
					dto.setPsize(rs.getString("psize"));
					dto.setPrice(rs.getInt("price"));
					dto.setQuantity(rs.getInt("Quantity"));					
					list.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) {try {rs.close();}catch(SQLException e) {}}
				if(conn != null) {try {conn.close();}catch(SQLException e) {}}
				if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			}
			return list;	
		}
	// 회원의 장바구니 내역
	public ArrayList<OrderDTO> cartMember(String id)  {
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
			try {
				conn = OracleConnection.getConnection();
				String sql = "select * from cartlist(id)  values(?) ";
				pstmt = conn.prepareStatement(sql);	
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					OrderDTO dto = new OrderDTO();	
					dto.setPname(rs.getString("pname"));
					dto.setImg(rs.getString("img"));
					dto.setPsize(rs.getString("psize"));
					dto.setPrice(rs.getInt("price"));
					dto.setQuantity(rs.getInt("Quantity"));
					list.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) {try {rs.close();}catch(SQLException e) {}}
				if(conn != null) {try {conn.close();}catch(SQLException e) {}}
				if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			}
			return list;	
		}
	
	
	public int cart(OrderDTO dto)  {		
		int result = 0;
		try {
			conn = OracleConnection.getConnection();
			String sql = "insert into cartList(gu_email, gu_phone, gu_addr, pname, Img, psize, id, name, phone, addr, quantity, Price )  "
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?) ";
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, dto.getGu_email());
			pstmt.setString(2, dto.getGu_Phone());
			pstmt.setString(3, dto.getGu_addr5());
			pstmt.setString(4, dto.getPname());
			pstmt.setString(5, dto.getImg());
			pstmt.setString(6, dto.getPsize());
			pstmt.setString(7, dto.getId());
			pstmt.setString(8, dto.getName());
			pstmt.setString(9, dto.getPhone());
			pstmt.setString(10, dto.getAddr());
			pstmt.setInt(11, dto.getQuantity());
			pstmt.setInt(12, dto.getPrice());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
		}
		return result;	
	}
	
	// 비회원의 이메일과 전화번호를 입력받아 정보를 있나 없나 확인
	public String guCheck(OrderDTO dto) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from orderList where gu_email =? and gu_phone = ?" ;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getGu_email());
			pstmt.setString(2, dto.getGu_Phone());
			rs=pstmt.executeQuery();
			if(rs.next()) {				
				result = "1";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try { rs.close(); }catch(SQLException e) {}}
			if(pstmt != null) {try { pstmt.close(); }catch(SQLException e) {}}
			if(conn != null) {try { conn.close(); }catch(SQLException e) {}}
		}

		return result;
	}

	// 이메일을 기준으로 비회원의 정보를 확인 
	public OrderDTO Guinfo(String gu_email) {
		OrderDTO dto = new OrderDTO();

		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from orderList where gu_email = ?";
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, gu_email);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				dto.setGu_email(rs.getString("gu_email"));
				dto.setGu_Phone(rs.getString("gu_phone"));
				dto.setGu_addr(rs.getString("gu_addr"));
				dto.setPname(rs.getString("pname"));
				dto.setImg(rs.getString("img"));
				dto.setPsize(rs.getString("psize"));
				dto.setPrice(rs.getInt("price"));
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
		}
		return dto;	
	}
	
	// 이메일을 기준으로 비회원의 주문내역을 확인 비회원 상태로 여러개를 구매했을수도 있으니 ArrayList 사용
	public ArrayList<OrderDTO> GuList(String gu_email) {
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from orderList where gu_email = ?";
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, gu_email);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setGu_email(rs.getString("gu_email"));
				dto.setGu_Phone(rs.getString("gu_phone"));
				dto.setGu_addr(rs.getString("gu_addr"));
				dto.setPname(rs.getString("pname"));
				dto.setImg(rs.getString("img"));
				dto.setPsize(rs.getString("psize"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setLastPriceDc(rs.getInt("lastPriceDc"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
		}
		return list;	
	}

	// 회원의 ID,name,phone,addr 을 가져오는 메서드
	public OrderDTO orderinfo(String id) {
		OrderDTO dto = new OrderDTO();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from orderList where id =?" ;		    
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddr(rs.getString("addr"));
				dto.setPname(rs.getString("pname"));
				dto.setImg(rs.getString("img"));
				dto.setPsize(rs.getString("psize"));
				dto.setPrice(rs.getInt("price"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
		}
		return dto;
	}
	
	// 주문상품이 여러개 일수도 있으니 ArrayList사용한 메서드
	public ArrayList<OrderDTO> orderlist(String id) { 
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from orderList where id =?" ;		    
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddr(rs.getString("addr"));
				dto.setPname(rs.getString("pname"));
				dto.setImg(rs.getString("img"));
				dto.setPsize(rs.getString("psize"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setLastPriceDc(rs.getInt("lastPriceDc"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
		}
		return list;
	}
	
	// 물건을 구입을 하면 정보를 저장하는 메서드 
	public int orderBuy(OrderDTO dto ) {  
		int result = 0;		
		try {
			conn = OracleConnection.getConnection();
			String sql = "insert into orderList(gu_email, gu_phone, gu_addr, pname, img, psize, id, name, phone, addr, quantity, Price, LastPrice, LastPriceDc, buy_reg, order_num)  "
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate, orderList_seq.nextval) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getGu_email());
			pstmt.setString(2, dto.getGu_Phone());
			pstmt.setString(3, dto.getGu_addr5());
			pstmt.setString(4, dto.getPname());
			pstmt.setString(5, dto.getImg());
			pstmt.setString(6, dto.getPsize());
			pstmt.setString(7, dto.getId());
			pstmt.setString(8, dto.getName());
			pstmt.setString(9, dto.getPhone());
			pstmt.setString(10, dto.getAddr());
			pstmt.setInt(11, dto.getQuantity());
			pstmt.setInt(12, dto.getPrice());
			pstmt.setInt(13, dto.getLastPrice());
			pstmt.setInt(14, dto.getLastPriceDc());

			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
		}
		return result;	
	}

	// 기본적인 회원의 정보를 불러오는 메서드
	public FormDTO order(String id) { 
		FormDTO dto = new FormDTO();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from member where id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setAddr(rs.getString("addr"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
		}
		return dto;
	}
	
	//구입한 상품의 정보를 가져오는 메서드
	public productDTO order2(String pnum) { 
		productDTO dto = new productDTO();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from product where pnum =?" ;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setPname(rs.getString("pname"));
				dto.setImg(rs.getString("img"));
				dto.setPsize(rs.getString("psize"));
				dto.setPrice(rs.getInt("price"));
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
		}
		return dto;
	}

}
