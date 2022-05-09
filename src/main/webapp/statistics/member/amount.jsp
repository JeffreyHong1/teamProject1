<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="team.project1.dto.adminMemDTO" %>
<%@ page import="team.project1.dao.adminMemDAO" %>
<!DOCTYPE html>	
<html>
<head>
	<meta charset="UTF-8">
	<title>구매 금액으로 검색</title>
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
		String sid = (String)session.getAttribute("sid");

		if(session.getAttribute("sid") == null){
	%>
			<script type="text/javascript">
				alert("관리자 로그인 후 가능 합니다.")
				window.location="/teamProject1/main/mallMain.jsp";
			</script>
	<%	
		}		
		String select = (String)request.getParameter("select");
		String amount1 = request.getParameter("amount1"); //자릿수 구분 콤마 까지 넘어옴
		String amount1_1 = request.getParameter("amount1_1");
		String sort = request.getParameter("member6");
		amount1 = amount1.replaceAll("\\,",""); //콤마 제거 해서 숫자만 문자열로 저장
		amount1_1 = amount1_1.replaceAll("\\,","");
		adminMemDAO dao = new adminMemDAO();

		String pageNum = request.getParameter("pageNum");
			if(pageNum == null){
				pageNum = "1";
			}
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;
		String amountCount = dao.amountCount(amount1, amount1_1);			
		int count = Integer.parseInt(amountCount); 
	%>
	<table border="1" class="type09">
		<tr>
			<th>아이디</th><th>이름</th><th>전화번호</th><th>생년월일</th><th>이메일</th><th>주소</th><th>총 구매금액</th><th>가입일</th>
		</tr>	
	<%	
		if(select.equals("6")){					
			ArrayList<adminMemDTO> list = dao.amountSearch(amount1,amount1_1,sort,start,end);					
			if(list.size() > 0){
				for (adminMemDTO dto : list){
	%>
					<tr>
						<td><%=dto.getId() %></td>
						<td><%=dto.getName() %></td>
						<td><%=dto.getPhone() %></td>
						<td><%=dto.getBirth() %></td>
						<td><%=dto.getEmail() %></td>
						<td><%=dto.getAddr() %></td>
						<td><%=dto.getAmount() %></td>
						<td><%=dto.getReg() %></td>
					</tr>	
	<%
				}
			}else{							
				out.print("검색 결과가 없습니다");											
			}
		}
	%>
	</table>
	<div>
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
					<a href="amount.jsp?pageNum=<%=startPage - 10 %>&select=<%=select%>&amount1=<%=amount1%>&amount1_1=<%=amount1_1%>&member6=<%=sort%>">[이전]</a>		
		<%		}
				for (int i = startPage; i <= endPage; i++){
		%>			
					<a href="amount.jsp?pageNum=<%=i %>&select=<%=select%>&amount1=<%=amount1%>&amount1_1=<%=amount1_1%>&member6=<%=sort%>">[<%=i %>]</a>	
		<%		}
				if(endPage < pageCount){
		%>	
					<a href="amount.jsp?pageNum=<%=startPage + 10%>&select=<%=select%>&amount1=<%=amount1%>&amount1_1=<%=amount1_1%>&member6=<%=sort%>">[다음]</a>
		<%		}	
			}
		%>
	</div>
</body>
</html>