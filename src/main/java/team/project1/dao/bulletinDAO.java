package team.project1.dao;
import java.util.ArrayList;

import team.project1.dto.bulletinDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class bulletinDAO {				
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<bulletinDTO> myList(String id){				//내글
		ArrayList<bulletinDTO> list = new ArrayList<bulletinDTO>();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from bulletin where writer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bulletinDTO dto = new bulletinDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setReg(rs.getTimestamp("reg"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setGood(rs.getInt("good"));
				dto.setRe_level(rs.getInt("re_level"));	
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try { rs.close(); }catch(SQLException e) {}
			if(pstmt != null)try { pstmt.close(); }catch(SQLException e) {}
			if(conn != null)try { conn.close(); }catch(SQLException e) {}
		}
		return list;
	}
	
		
	public ArrayList<bulletinDTO> search(String column , String search){	//검색
		ArrayList<bulletinDTO> list = new ArrayList<bulletinDTO>();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from bulletin where "+column+" like '%"+search+"%' ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bulletinDTO dto = new bulletinDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setReg(rs.getTimestamp("reg"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setGood(rs.getInt("good"));
				dto.setRe_level(rs.getInt("re_level"));	
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try { rs.close(); }catch(SQLException e) {}
			if(pstmt != null)try { pstmt.close(); }catch(SQLException e) {}
			if(conn != null)try { conn.close(); }catch(SQLException e) {}
		}
		return list;
	}
	
	public int boardCount() {		//bulletin 필드 값 카운트
		int result = 0;
		try {											//1-예외 발생을 조사하는 문장 검사
			conn=OracleConnection.getConnection();		//  Oralceconnelction / oracle 데이터 베이스에 연결 하여 / getConnection() 가져온다. 
			String sql = "select count(*) from bulletin";	//  bulletin 필드의 모든 값을 카운트
			pstmt = conn.prepareStatement(sql);			//  prepareStatement는 SQL문 전송 / Statement 클래스를 상속받음
			rs = pstmt.executeQuery();					//  query 실행 후 그 결과값을 rs에 저장
			
			if(rs.next()) 								//  rs에 결과값이 있다면
			{	result = rs.getInt(1);	}				//  첫번째 결과값을 int형으로 result에 대입
		}catch(Exception e){							//2-예외 사항 발생 시 실행
			e.printStackTrace();						//  에러의 발생근원지를 찾아서 단계별로 에러를 출력 - console
		}finally {										//3-예외 처리를 떠나 무조건 실행
			if(rs != null) { try {rs.close();} catch(SQLException e) {}}		//rs 종료
			if(pstmt != null) { try {pstmt.close();} catch(SQLException e) {}}	//pstmt 종료
			if(conn != null) { try {conn.close();} catch(SQLException e) {}}	//conn 종료
		}
		return result;									//result로 return
	}
	
	
	public int boardUpdate(bulletinDTO dto) {	//글 수정
		int result = 0;
		try {
			conn = OracleConnection.getConnection();
			String sql="update bulletin set subject=? , content=? where num=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			pstmt.setString(4, dto.getPw());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try { rs.close(); }catch(SQLException e) {}
			if(pstmt != null)try { pstmt.close(); }catch(SQLException e) {}
			if(conn != null)try { conn.close(); }catch(SQLException e) {}
		}
		return result;
	}
	
	
	
	public bulletinDTO readContent(int num) {	//조회 수 증가
		bulletinDTO dto = new bulletinDTO();
		try {
			conn = OracleConnection.getConnection();
			String sql = "update bulletin set readcount=readcount+1 where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql = "select * from bulletin where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));	
	        	dto.setSubject(rs.getString("subject"));
	        	dto.setWriter(rs.getString("writer"));
	        	dto.setReg(rs.getTimestamp("reg"));
	        	dto.setReadcount(rs.getInt("readcount"));
	        	dto.setGood(rs.getInt("good"));
	        	dto.setGood(rs.getInt("content"));
	        	dto.setGood(rs.getInt("pw"));
	        	dto.setGood(rs.getInt("ref"));
	        	dto.setGood(rs.getInt("re_level"));
	        	dto.setGood(rs.getInt("re_step"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try { rs.close(); }catch(SQLException e) {}
	        if(pstmt != null)try { pstmt.close(); }catch(SQLException e) {}
	        if(conn != null)try { conn.close(); }catch(SQLException e) {}
		}
		return dto;
	}
	
	public ArrayList<bulletinDTO> boardList(int start, int end) {		//게시판 리스트 boardList에 변수값 생성 
		ArrayList<bulletinDTO> list = new ArrayList<bulletinDTO>();		//	bulletinDTO를 호출하여 list에 대입 및 arraylist로 메모리 확보로 데이터 저장 및 추출
	      try {
	         conn = OracleConnection.getConnection();					//  Oralceconnelction / oracle 데이터 베이스에 연결 하여 / getConnection() 가져온다.
	         String sql = " select * from "
		         		+ " (select bulletin.*,rownum r from " 				//	작은 번호부터 정렬
		         		+ " (select * from bulletin order by ref desc,re_step) bulletin) "	// 오름차순 정렬
		         		+ " where r >= ? and r <= ? ";
	         pstmt = conn.prepareStatement(sql);						//	Statement 클래스를 상속 받으며 sql문 전송
	         pstmt.setInt(1, start);
	         pstmt.setInt(2, end);
	         rs = pstmt.executeQuery();									//	query 실행 후 그 결과값을 rs에 저장
	         
	         while(rs.next()) {											//	검색된 결과를 DTO에 대입 DTO를 List에 대입
	        	 bulletinDTO dto = new bulletinDTO();
	        	 dto.setNum(rs.getInt("num"));	
	        	 dto.setSubject(rs.getString("subject"));
	        	 dto.setWriter(rs.getString("writer"));
	        	 dto.setReg(rs.getTimestamp("reg"));
	        	 dto.setReadcount(rs.getInt("readcount"));
	        	 dto.setGood(rs.getInt("good"));
	        	 dto.setRe_level(rs.getInt("re_level"));
	        	 list.add(dto);
	         					}
	      		}				
	         catch(Exception e) {
		         e.printStackTrace();
		      }finally {
		         if(rs != null)try { rs.close(); }catch(SQLException e) {}
		         if(pstmt != null)try { pstmt.close(); }catch(SQLException e) {}
		         if(conn != null)try { conn.close(); }catch(SQLException e) {}
		      }
		      return list;
		   }
	
	
	
	public int boardInsert(bulletinDTO dto){	//글입력
	      int result = 0;
	      try {
	         conn = OracleConnection.getConnection();
	         String sql = "insert into bulletin(num,writer,subject,content,pw) "
	        		 	+ "values(bulletin_seq.nextval,?,?,?,?)";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getWriter());
	         pstmt.setString(2, dto.getSubject()); 
	         pstmt.setString(3, dto.getContent());
	         pstmt.setString(4, dto.getPw());
	         result = pstmt.executeUpdate();
	         
	         sql = "select max(num) from bulletin";			//최대 글 번호를 검색
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         int max = 0;
	         if(rs.next()) {
	        	 max = rs.getInt(1);	//1번째 컬럼을 뜻함 rs.getInt("max(num)"); 이렇게 해도 무방함
	         }
	         if(dto.getNum() == 0) {	//새글일 경우 진행
		         sql = "update bulletin set ref=? where num=?";	//글 번호를 그룹화
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, max);
		         pstmt.setInt(2, max);
		         result = pstmt.executeUpdate();
		         
	         }else {					//새글이 아닌 답글일 경우
	        	 
		         sql = "update bulletin set re_step=re_step+1 where ref=? and re_step >?";	//답글 시 step 증가
	        	 pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, dto.getRef());
		         pstmt.setInt(2, dto.getRe_level()+1);
		         pstmt.setInt(3, dto.getRe_step()+1);
		         pstmt.setInt(4, max);
		         result = pstmt.executeUpdate();
	        	 
	        	 sql = "update bulletin set ref=?, re_level=?, re_step=? whre num=?";		//답글의 그룹, level, step 대입
	        	 pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, dto.getRef());
		         pstmt.setInt(2, dto.getRe_level()+1);
		         pstmt.setInt(3, dto.getRe_step()+1);
		         pstmt.setInt(4, max);
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
