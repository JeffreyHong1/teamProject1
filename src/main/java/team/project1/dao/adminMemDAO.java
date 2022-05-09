package team.project1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import team.project1.dto.*;

public class adminMemDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//전체 회원 리스트
	public ArrayList<adminMemDTO> memAllList (){
		ArrayList<adminMemDTO> list = new ArrayList<adminMemDTO>();
		try {
			conn = OracleConnection.getConnection();
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);		
			rs = pstmt.executeQuery();
			while (rs.next()) {
				adminMemDTO dto = new adminMemDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone2"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email1"));
				dto.setAddr(rs.getString("addr"));
				dto.setReg(rs.getTimestamp("reg"));
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
	
	//전체 회원 숫자
	public int memAllCount () {
		int result = 0;
		try {
			conn = OracleConnection.getConnection();
			String sql = "select count(*) from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return result;
	}
	
	//신규가입자 검색
	public ArrayList<adminMemDTO> search (String num1, String num2,int start, int end){
		ArrayList<adminMemDTO> list = new ArrayList<adminMemDTO>();
		try {
			conn = OracleConnection.getConnection();
			//between to_date....and to_date 의 경우 앞의 날짜는 포함해서 검색, 뒤의 날짜는 포함하지 않고 검색 됨
			//쿼리문에서 뒤의 날짜에 + 1 해주면 뒤의 날짜 포함해서 검색 됨
			//member 테이블에서 reg 가 num1 과 num2 사이의 값인걸 검색하고,
			//페이징 처리를 위해 rownum을 부여하여 rownum이 start 와 end 사이인 값만 출력
			String sql = "select * from (select member.* , rownum r from member where reg between to_date('"+num1+"','YYYY/MM/DD')and to_date ('"+num2+"','YYYY/MM/DD')+1) where r between "+start+" and "+end;
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			while(rs.next()){
				adminMemDTO dto = new adminMemDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone2"));				
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email1"));			
				dto.setAddr(rs.getString("addr"));
				dto.setReg(rs.getTimestamp("reg"));
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
	//신규 가입자 수 출력
	public String memCount(String num1, String num2) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			//member 테이블에서 reg 컬럼의 내용중 입력날짜에 해당하는 값들이 몇개인지 count 해라
			String sql = "select count (*) as memcount from (select * from member where reg between to_date('" + num1 + "','YYYY/MM/DD') and to_date ('" + num2 + "','YYYY/MM/DD')+1)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();			
			if(rs.next()) {
				result = rs.getString("memcount");				
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
	
	//지역별 검색
	public ArrayList<adminMemDTO> locSearch (String location,int start, int end){
		ArrayList<adminMemDTO> list = new ArrayList<adminMemDTO>();
		try {
			conn = OracleConnection.getConnection();
			//member 테이블에서 주소에 location 값이 들어간 값들을 찾아라
			//페이징 처리를 위해 rownum을 부여하여 rownum이 start 와 end 사이인 값만 출력
			String sql = "select * from (select member.*, rownum r from member where addr like '%" + location + "%') where r between "+start+" and "+end ;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				adminMemDTO dto = new adminMemDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone2"));				
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email1"));				
				dto.setAddr(rs.getString("addr"));
				dto.setReg(rs.getTimestamp("reg"));
				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return list;
	}
	
	//지역으로 검색 count
	public String locCount(String location) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			//member 테이블의 주소 컬럼에서 입력받은 값이 해당하는 값을 count 
			String sql = "select count(*) as loccount from (select * from member where addr like '%" + location + "%')";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("loccount");
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
	
	//나이별 검색
	public ArrayList<adminMemDTO> ageSearch (String birth1, String birth2,int start, int end){
		ArrayList<adminMemDTO> list = new ArrayList<adminMemDTO>();
		try {
			conn = OracleConnection.getConnection();
			//member 테이블에서 생년월일이 num1 과 num2 사이인 값을 찾아라
			//페이징 처리를 위해 rownum을 부여하여 rownum이 start 와 end 사이인 값만 출력
			String sql = "select * from (select member.* , rownum r from member where reg between to_date('"+birth1+"','YYYY/MM/DD')and to_date ('"+birth2+"','YYYY/MM/DD')+1) where r between "+start+" and "+end;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				adminMemDTO dto = new adminMemDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone2"));				
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email1"));				
				dto.setAddr(rs.getString("addr"));				
				dto.setReg(rs.getTimestamp("reg"));
				list.add(dto);				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return list;
	}
	
	//나이로 검색 결과 숫자 출력
	public String ageCount (String birth1, String birth2) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			//member 테이블의 reg 컬럼에서 입력받은 값을 count
			String sql = "select count (*) as agecount from (select * from member where reg between to_date('" + birth1 + "','YYYY/MM/DD') and to_date ('" + birth2 + "','YYYY/MM/DD')+1)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = (rs.getString("agecount"));				
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
	
	//주문 횟수 검색...
	public ArrayList<adminMemDTO> buySearch (String sort, String buy1, String buy1_1,int start, int end){
		ArrayList<adminMemDTO> list = new ArrayList<adminMemDTO>();
		try {
			conn = OracleConnection.getConnection();
			//주문 관련 DB 완성 되면 reg 를 주문일자 컬럼으로 변경
			//member 테이블중 orderdate 컬럼에서 날짜가 buy1 과 buy1_1 사이인 값을들 찾아서 buycount의 sort값으로 정렬해라
			//페이징 처리를 위해 rownum을 부여하여 rownum이 start 와 end 사이인 값만 출력
			String sql = "select * from (select member.* , rownum r from member where reg between to_date ('"+buy1+"','yyyy/mm/dd') and to_date ('"+buy1_1+"','yyyy/mm/dd') order by buycount "+sort+") where r between "+start+" and "+end;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				adminMemDTO dto = new adminMemDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone2"));				
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email1"));				
				dto.setAddr(rs.getString("addr"));					
				dto.setReg(rs.getTimestamp("reg"));
				dto.setAmount(rs.getString("buycount"));
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
	
	//구매 횟수로 검색한 결과 갯수 출력
	public String memBuyCount(String buy1, String buy1_1) {
		String result = null;
		try {
			conn = OracleConnection.getConnection(); 
			String sql = "select count (*) as membuycount from (select * from member where reg between to_date('" + buy1 + "','YYYY/MM/DD') and to_date ('" + buy1_1 + "','YYYY/MM/DD')+1)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = (rs.getString("memBuycount"));				
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
	
	//성별로 검색
	public ArrayList<adminMemDTO> genderSearch (String gender,int start, int end){
		ArrayList<adminMemDTO> list = new ArrayList<adminMemDTO>();
		try {
			conn = OracleConnection.getConnection();
			//member 테이블의 gender 컬럼에서 입력받은 값을 검색하고,
			//페이징 처리를 위해 rownum을 부여하여 rownum이 start 와 end 사이인 값만 출력
			String sql = "select * from (select member.*, rownum r from member where gender = '"+ gender +"') where r between "+start+" and "+end;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				adminMemDTO dto = new adminMemDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone2"));				
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email1"));				
				dto.setAddr(rs.getString("addr"));					
				dto.setReg(rs.getTimestamp("reg"));
				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e ) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e ) {}
			if(conn != null)try {conn.close();}catch(SQLException e ) {}
		}
		return list;
	}
	//성별 검색 count
	public String genCount(String gender) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			String sql = "select count(*) as gencount from (select * from member where gender ='"+gender+"')";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = (rs.getString("gencount"));				
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
	
	//주문 금액으로 검색
	public ArrayList<adminMemDTO> amountSearch (String amount1, String amount1_1, String sort,int start, int end){
		ArrayList<adminMemDTO> list = new ArrayList<adminMemDTO>();
		try {
			conn = OracleConnection.getConnection();
			//member 테이블의 amount 컬럼에서 입력받은 값에 해당하는 값을 검색하고,
			//페이징 처리를 위해 rownum을 부여하여 rownum이 start 와 end 사이인 값만 출력
			String sql = "select * from(select member.*, rownum r from member where amount between '"+amount1+"' and '"+amount1_1+"' order by amount "+sort+") where r between "+start+" and "+end;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				adminMemDTO dto = new adminMemDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone2"));				
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email1"));
				dto.setAddr(rs.getString("addr"));
				dto.setAmount(rs.getString("amount"));
				dto.setReg(rs.getTimestamp("reg"));				
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
	
	//주문 금액으로 검색 결과 숫자 출력
	public String amountCount(String amount1, String amount1_1) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			String sql = "select count (*) as amountcount from (select * from member where amount between " + amount1 + " and " + amount1_1 + ")";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = (rs.getString("amountcount"));				
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
}
