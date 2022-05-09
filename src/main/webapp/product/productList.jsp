<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="team.project1.dto.productDTO" %>
<%@ page import="team.project1.dao.productDAO" %>
<%@ page import="java.sql.Timestamp" %>
<style>
	table.type09 {
	  border-collapse: collapse;
	  text-align: center;
	  line-height: 1.5;
	  margin-left: 100px;
	  margin-right: 100px;
	}
	table.type09 th {
	  padding: 50px;
	  font-weight: bold;
	  vertical-align: top;
	  color: #369;
	  border-bottom: 3px solid #036;
	}
	table.type09 tr {
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
	
	}
</style>
	<%
		String pclass = request.getParameter("pclass");
		productDAO dao = new productDAO();   //dao 객체생성
		
		String pageNum = request.getParameter("pageNum");		
		if(pageNum == null){
			pageNum = "1";
		}
		if(pageNum.equals("1")){
			int pageSize = 10;
			int currentPage = Integer.parseInt(pageNum);
			int start = (currentPage - 1) * pageSize + 1;
			int end = currentPage * pageSize;
			int productCount = dao.productCount(pclass);
			int count = productCount;
	
	%>
			<div style="text-align:center;">
				<h1>전체 상품</h1>
			</div>
				<table class="type09">
	<%
			ArrayList<productDTO> list = dao.productList(start, end);
			if (list.size() > 0) {
				for (productDTO dto : list) {
	%>
			<tr>
				<td>
					<img src="/teamProject1/image/<%=dto.getImg()%>" width="100" height="100">
				</td>
				<td><%=dto.getPclass()%></td>
				
				<td>
					<a href="/teamProject1/product/productContent.jsp?pnum=<%=dto.getPnum()%>"><%=dto.getPname()%></a>
				</td>
				<td><%=dto.getPrice()%></td>
			</tr>
	<%
				}
			}
	%>
				</table>
			<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
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
				//&파라미터명=<%=변수명%
	%>
					<br/>
					<a href="/teamProject1/product/productList.jsp?pageNum=<%=startPage - 10 %>&pclass=<%=pclass%>">[이전]</a>		
	<%			}
				for (int i = startPage; i <= endPage; i++){
	%>
					<a href="/teamProject1/product/productList.jsp?pageNum=<%=i %>&pclass=<%=pclass%>">[<%=i %>]</a>	
	<%			}
				if(endPage < pageCount){
	%>	
					<a href="/teamProject1/product/productList.jsp?pageNum=<%=startPage + 10%>&pclass=<%=pclass%>">[다음]</a>
	<%		
				}
			}
	%>
			</div>
	<%
		}else{
			if(session.getAttribute("sid") == null){
	%>
				<jsp:include page="/main/header.jsp"></jsp:include>
	<%
			}else{
	%>
				<jsp:include page="/main/loginHeader.jsp"></jsp:include>
	<%
			}
			int pageSize = 10;
			int currentPage = Integer.parseInt(pageNum);
			int start = (currentPage - 1) * pageSize + 1;
			int end = currentPage * pageSize;
			int productCount = dao.productCount(pclass);
			int count = productCount;
	
	%>
			<div style="text-align:center;">
				<h1>전체 상품</h1>
			</div>
				<table class="type09">
					<tr>
						<th>상품이미지</th><th>상품종류</th><th>상품번호</th><th>상품이름</th><th>가격</th>
					</tr>
	<%
			ArrayList<productDTO> list = dao.productList(start, end);
			if (list.size() > 0) {
				for (productDTO dto : list) {
	%>
			<tr>
				<td>
					<img src="/teamProject1/image/<%=dto.getImg()%>" width="100" height="100">
				</td>
				<td><%=dto.getPclass()%></td>
				<td><%=dto.getPnum()%></td>
				<td>
					<a href="/teamProject1/product/productContent.jsp?pnum=<%=dto.getPnum()%>"><%=dto.getPname()%></a>
				</td>
				<td><%=dto.getPrice()%></td>
			</tr>
	<%
				}
			}
	%>
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
				//&파라미터명=<%=변수명%
	%>
					<br/>
					<a href="/teamProject1/product/productList.jsp?pageNum=<%=startPage - 10 %>&pclass=<%=pclass%>">[이전]</a>		
	<%			}
				for (int i = startPage; i <= endPage; i++){
	%>
					<a href="/teamProject1/product/productList.jsp?pageNum=<%=i %>&pclass=<%=pclass%>">[<%=i %>]</a>	
	<%			}
				if(endPage < pageCount){
	%>	
					<a href="/teamProject1/product/productList.jsp?pageNum=<%=startPage + 10%>&pclass=<%=pclass%>">[다음]</a>
	<%		
				}
			}
	%>
		<jsp:include page="/main/sidebar.jsp"></jsp:include>
		<jsp:include page="/main/footer.jsp"></jsp:include>
	<%
		}
	%>
		</div>

