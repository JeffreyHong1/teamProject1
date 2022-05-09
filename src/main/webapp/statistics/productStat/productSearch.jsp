<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="team.project1.dto.productDTO" %>
<%@ page import="team.project1.dao.productDAO" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 검색</title>
	<style>
		table.type09 {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 1.5;
		  margin-left: 100px;
		  margin-right: 100px;
		  margin-top: 100px;
		}
		table.type09 tr {
		  padding: 50px;
		  font-weight: bold;
		  vertical-align: top;
		  color: #369;
		  border-bottom: 3px solid #036;
		}
		table.type09 th {
		  width: 150px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		  background: #f3f6f7;
		}
		table.type09 td {
		  width: 350px;
		  padding: 10px;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		}
	</style>
</head>
<body>
	<jsp:include page="/statistics/header.jsp"></jsp:include>
	<%

		if(session.getAttribute("sid") == null){
	%>
			<script type="text/javascript">
				alert("관리자 로그인 후 가능 합니다.")
				window.location="/teamProject1/main/mallMain.jsp";
			</script>
	<%
		}
		String select = request.getParameter("select");
		String gender = request.getParameter("gender");
		productDAO dao = new productDAO();
		
		String pageNum = request.getParameter("pageNum");		
		if (pageNum == null){
		//페이징 값이 없으면 1페이지를 보여줌
			pageNum = "1";
		}
		int pageSize = 10; 
		//한페이지에 표시될 게시물의 숫자로 사용 할 변수
		int currentPage = Integer.parseInt(pageNum);
		int start = (currentPage - 1) * pageSize + 1; 
		//페이징의 시작값(EX:1페이지의 시작은 1,2페이지의 시작은 11)
		int end = currentPage * pageSize; 
		//페이징의 마지막 값(EX:1페이지의 마지막은 10,2페이지의 마지막은 20)		
		String genCount = dao.genSearchCount(gender);
		int count = Integer.parseInt(genCount);
	%>
		<table border="1" class="type09">
			<tr>
				<th>상품이미지</th><th>상품종류</th><th>상품번호</th><th>상품이름</th><th>사이즈</th><th>가격</th><th>재고</th><th>비고</th>
			</tr>	
	<%
		if(select.equals("2")){
			ArrayList<productDTO> list = dao.search(gender,start,end);
				if(list.size() > 0){
					for(productDTO dto : list){
	%>
						<tr>
							<td>
								<img src="/teamProject1/image/<%=dto.getImg()%>" width="100" height="100">
							</td>
							<td><%=dto.getPclass()%></td>
							<td><%=dto.getPnum()%></td>
							<td>
								<a href="/taemProject1/product/productContent.jsp?pnum=<%=dto.getPnum()%>"><%=dto.getPname()%></a>
							</td>
							<td><%=dto.getPsize()%></td>
							<td><%=dto.getPrice()%></td>
							<td><%=dto.getStock()%></td>
							<td><%=dto.getThing()%></td>
	<%
					}
				} else {
				out.print("검색 결과가 없습니다.");
				}
		}
	%>
						</tr>
		</table>
	<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
	<%
		if(count > 0){
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage = (int)(currentPage / 10)*10+1;
			int pageBlock = 10;
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){
				endPage = pageCount;				
			}
			if(startPage > 10){
				//같은 페이지에서 검색결과 페이징 이동시 파라미터를 같이 보내줘야함
				//넘겨줄 파라미터는 getParameter 로 받은 name을 넘겨 줘야 함
	%>
				<br/>
				<a href="productSearch.jsp?pageNum=<%=startPage - 10 %>&select=<%=select%>&gender=<%=gender%>">[이전]</a>		
	<%		
			}
			for (int i = startPage; i <= endPage; i++){
	%>			
				<a href="productSearch.jsp?pageNum=<%=i %>&select=<%=select%>&gender=<%=gender%>">[<%=i %>]</a>	
	<%		
			}
			if(endPage < pageCount){
	%>	
				<a href="productSearch.jsp?pageNum=<%=startPage + 10%>&select=<%=select%>&gender=<%=gender%>">[다음]</a>
	<%		
			}	
		}
	%>
	</div>
</body>