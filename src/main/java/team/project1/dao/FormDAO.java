package team.project1.dao;


import java.sql.*;
import team.project1.dto.FormDTO;

public class FormDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int PWupdate(FormDTO dto) {	// 비밀번호 수정
		int result = 0;
		try {
			conn = OracleConnection.getConnection();
			String sql = "update member set pw=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getId());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
	         if(rs != null) {try { rs.close(); }catch(SQLException e) {}}
	         if(pstmt != null) {try { pstmt.close(); }catch(SQLException e) {}}
	         if(conn != null) {try { conn.close(); }catch(SQLException e) {}}
	    }
	    return result;
	}
	
	public FormDTO findPWcheck(FormDTO dto) {		// 비밀번호 찾기
		try {
		conn = OracleConnection.getConnection();
		String sql = "select pw from member where name = ? and id = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getId());
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setPw(rs.getString("pw"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		    if(rs != null) {try { rs.close(); }catch(SQLException e) {}}
		    if(pstmt != null) {try { pstmt.close(); }catch(SQLException e) {}}
		    if(conn != null) {try { conn.close(); }catch(SQLException e) {}}
	    }
	    return dto;
	}

	public FormDTO findIDcheck(FormDTO dto) {		// 아이디 찾기
		try {
		conn = OracleConnection.getConnection();
		String sql = "select id from member where name = ? and phone2 = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getPhone2());
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setId(rs.getString("id"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		    if(rs != null) {try { rs.close(); }catch(SQLException e) {}}
		    if(pstmt != null) {try { pstmt.close(); }catch(SQLException e) {}}
		    if(conn != null) {try { conn.close(); }catch(SQLException e) {}}
	    }
	    return dto;
	}
	
	public int update(FormDTO dto) {	// 회원 정보 수정
		int result = 0;
		try {
			conn = OracleConnection.getConnection();
			String sql = "update member set pw = ?,phone1 = ?,phone2 = ?,email1 = ?,email2 = ?,addr = ? where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getPhone1());
			pstmt.setString(3, dto.getPhone2());
			pstmt.setString(4, dto.getEmail1());
			pstmt.setString(5, dto.getEmail2());
			pstmt.setString(6, dto.getAddr5());
			pstmt.setString(7, dto.getId());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
	         if(rs != null) {try { rs.close(); }catch(SQLException e) {}}
	         if(pstmt != null) {try { pstmt.close(); }catch(SQLException e) {}}
	         if(conn != null) {try { conn.close(); }catch(SQLException e) {}}
	    }
	    return result;
	}
	
	
	public int delete(FormDTO dto) {	// 회원 탈퇴	
		   int result = 0;
		   try {
		         conn = OracleConnection.getConnection();
		         String sql = "delete from member where id=? and pw=?";
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, dto.getId());
		         pstmt.setString(2, dto.getPw());
		         result = pstmt.executeUpdate();
		      }catch(Exception e) {
		         e.printStackTrace();
		      }finally {
		         if(rs != null) {try { rs.close(); }catch(SQLException e) {}}
		         if(pstmt != null) {try { pstmt.close(); }catch(SQLException e) {}}
		         if(conn != null) {try { conn.close(); }catch(SQLException e) {}}
		      }
		   return result;
	   }
	
	
	public String idConfirm(FormDTO dto) {	// 아이디 중복 확인
		   String result = null;
			try {
				conn = OracleConnection.getConnection();
		         String sql = "select * from member where id=?";
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, dto.getId());
		         rs=pstmt.executeQuery();
		         if(rs.next()) {				
		        	 result = "사용중인 아이디 입니다.";
		         }else {
		        	 result = "사용가능한 아이디 입니다.";
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
	
	
	public String loginCheck(FormDTO dto) {	// 로그인시 아이디 비밀번호 확인	
		   String result = null;
			try {
		         conn = OracleConnection.getConnection();
		         String sql = "select * from member where id=? and pw=?";
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, dto.getId());
		         pstmt.setString(2, dto.getPw());
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
	
	public int signup(FormDTO dto) {	// 회원가입
		int result = 0;	
		try {
			conn = OracleConnection.getConnection();
			String sql="select * from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = 2;
			}else {
				sql = "insert into member(id,pw,name,gender,phone1,phone2,birth,email1,email2,addr,reg) values(?,?,?,?,?,?,?,?,?,?,sysdate)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPw());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getGender());
				pstmt.setString(5, dto.getPhone1());
				pstmt.setString(6, dto.getPhone2());
				pstmt.setString(7, dto.getBirth());
				pstmt.setString(8, dto.getEmail1());
				pstmt.setString(9, dto.getEmail2());
				pstmt.setString(10, dto.getAddr5());
				result = pstmt.executeUpdate();
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
}
