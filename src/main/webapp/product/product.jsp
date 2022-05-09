<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
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
		  margin-top: 100px;
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
		  border-bottom: 1px solid #ccc;
		}
	</style>

	<%
		//로그인 상태 와 로그아웃 상태를 구분하여 헤더 출력
		if(session.getAttribute("sid") == null){
	%>
			<jsp:include page="/main/header.jsp"></jsp:include>
	<%
		}else{
	%>
			<jsp:include page="/main/loginHeader.jsp"></jsp:include>
	<%	
		}
		String pclass = request.getParameter("pclass");
		productDAO dao = new productDAO();   //dao 객체생성
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		int pageSize = 2;
		int currentPage = Integer.parseInt(pageNum);
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;
		int productCount = dao.productCount(pclass);
		int count = productCount;
		
	%>
	<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<h1><%=pclass %></h1>
	</div>	
		<table class="type09">
	<%
			ArrayList<productDTO> list = dao.productOuter(pclass,start,end);
			if(list.size() > 0){
				for(productDTO dto : list){ 
	%>
					<tr>
						<td><img src="/teamProject1/image/<%=dto.getImg()%>" width="100" height="100"></td>
						<td><%=dto.getPclass()%></td>
						
						<td><a href="productContent.jsp?pnum=<%=dto.getPnum()%>"><%=dto.getPname()%></a></td>			
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
			//&파라미터명=<%=변수명%>
	%>
				<br/>
				<a href="/teamProject1/product/product.jsp?pageNum=<%=startPage - 10 %>&pclass=<%=pclass%>">[이전]</a>		
	<%		
			}
			for (int i = startPage; i <= endPage; i++){
	%>
				<a href="/teamProject1/product/product.jsp?pageNum=<%=i %>&pclass=<%=pclass%>">[<%=i %>]</a>	
	<%		
			}
			if(endPage < pageCount){
	%>	
				<a href="/teamProject1/product/product.jsp?pageNum=<%=startPage + 10%>&pclass=<%=pclass%>">[다음]</a>
	<%		
			}	
		}
	%>
	</div>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>