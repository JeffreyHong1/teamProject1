package team.project1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import team.project1.dto.productDTO;

public class productDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 상품검색 관련
	public ArrayList<productDTO> search(String gender, int start, int end) {
		ArrayList<productDTO> list = new ArrayList<productDTO>();
		try {
			conn = OracleConnection.getConnection();
			if(gender.equals("all")) {
				String sql = "select * from(select product.*,rownum r from product)where r between "+start+" and "+ end;
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					productDTO dto = new productDTO();
					dto.setPclass(rs.getString("Pclass")); // 상품종류
					dto.setPnum(rs.getString("pnum")); // 상품번호
					dto.setPname(rs.getString("pname")); // 상품이름
					dto.setImg(rs.getString("img")); // 상품이미지
					dto.setPsize(rs.getString("psize")); // 상품사이즈
					dto.setPrice(rs.getInt("price")); // 상품가격
					dto.setStock(rs.getInt("stock")); // 재고
					dto.setThing(rs.getString("thing")); // 비고
					list.add(dto);
				}
			}else {
				String sql = "select * from(select product.*,rownum r from product where pnum like '"+gender+"%')where r between "+start+" and "+end;
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					productDTO dto = new productDTO();
					dto.setPclass(rs.getString("Pclass")); // 상품종류
					dto.setPnum(rs.getString("pnum")); // 상품번호
					dto.setPname(rs.getString("pname")); // 상품이름
					dto.setImg(rs.getString("img")); // 상품이미지
					dto.setPsize(rs.getString("psize")); // 상품사이즈
					dto.setPrice(rs.getInt("price")); // 상품가격
					dto.setStock(rs.getInt("stock")); // 재고
					dto.setThing(rs.getString("thing")); // 비고
					list.add(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {try {conn.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return list;
	}
	//상품 검색 페이징용 count
	public String genSearchCount(String gender) {
		String result = null;
		try {
			conn = OracleConnection.getConnection();
			if(gender.equals("all")) {
			String sql = "select count(*) as gencount from(select * from product)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("gencount");
			}
		}else {
			String sql = "select count(*) as gencount from(select * from product where pnum like '"+gender+"%')";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("gencount");
			}	
		}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (conn != null) {try {conn.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return result;
	}

	// 상품 상세설명 부분
	public productDTO readContent(String pnum) {
		productDTO dto = new productDTO();
		try {
			conn = OracleConnection.getConnection();

			String sql = "select * from product where pnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setPclass(rs.getString("Pclass")); // 상품종류
				dto.setPnum(rs.getString("pnum")); // 상품번호
				dto.setPname(rs.getString("pname")); // 상품이름
				dto.setImg(rs.getString("img")); // 상품이미지
				dto.setPsize(rs.getString("psize")); // 상품사이즈
				dto.setPrice(rs.getInt("price")); // 상품가격
				dto.setStock(rs.getInt("stock")); // 재고
				dto.setThing(rs.getString("thing")); // 비고

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {try {conn.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return dto;
	}

	// 상품등록 관련
	public int productInsert(productDTO dto) {
		int result = 0;
		try {
			conn = OracleConnection.getConnection();
			String sql = "insert into product( pclass, pnum, pname, img, psize, price, stock, thing)"
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getPclass()); // 상품종류
			pstmt.setString(2, dto.getPnum()); // 상품번호
			pstmt.setString(3, dto.getPname()); // 상품이름
			pstmt.setString(4, dto.getImg()); // 상품이미지
			pstmt.setString(5, dto.getPsize()); // 상품사이즈
			pstmt.setInt(6, dto.getPrice()); // 상품가격
			pstmt.setInt(7, dto.getStock()); // 재고
			pstmt.setString(8, dto.getThing()); // 비고
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {try {conn.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return result;
	}

	// 상품전체 부분
	public ArrayList<productDTO> productList(int start, int end) {
		ArrayList<productDTO> list = new ArrayList<productDTO>();
		try {
			conn = OracleConnection.getConnection();

			String sql = "select * from (select product.* , rownum r from "
					+ "(select * from product order by pclass) product) where r >= ? and r <=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				productDTO dto = new productDTO();

				dto.setPclass(rs.getString("pclass")); // 상품종류
				dto.setPnum(rs.getString("pnum")); // 상품번호
				dto.setPname(rs.getString("pname")); // 상품이름
				dto.setImg(rs.getString("img")); // 상품이미지
				dto.setPsize(rs.getString("psize")); // 상품사이즈
				dto.setPrice(rs.getInt("price")); // 상품가격
				dto.setStock(rs.getInt("stock")); // 재고
				dto.setThing(rs.getString("thing")); // 비고

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {try {conn.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return list;
	}

	// 각 상품 영역(아우터,상의,하의,신발)
	public ArrayList<productDTO> productOuter(String pclass,int start,int end) {
		ArrayList<productDTO> list = new ArrayList<productDTO>();
		try {
			conn = OracleConnection.getConnection();

			String sql = "select * from product where pclass=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pclass);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productDTO dto = new productDTO();

				dto.setPclass(rs.getString("pclass")); // 상품종류
				dto.setPnum(rs.getString("pnum")); // 상품번호
				dto.setPname(rs.getString("pname")); // 상품이름
				dto.setImg(rs.getString("img")); // 상품이미지
				dto.setPsize(rs.getString("psize")); // 상품사이즈
				dto.setPrice(rs.getInt("price")); // 상품가격
				dto.setStock(rs.getInt("stock")); // 재고
				dto.setThing(rs.getString("thing")); // 비고
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {try {conn.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return list;
	}
	
	//제품 리스트 페이징 처리용
	public int productCount (String pclass) {
		int result = 0;
		try {
			conn = OracleConnection.getConnection();
			String sql = "select count (*) as productcount from (select * from product where pclass='"+pclass+"')";
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

}