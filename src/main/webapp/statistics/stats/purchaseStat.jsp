<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="team.project1.dto.statsDTO" %>
<%@ page import="team.project1.dao.statsDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매입 조회</title>
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
		String select = request.getParameter("select");		
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		statsDAO dao = new statsDAO();
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;
		String statsCount = dao.purchaseCount(date1,date2);			
		int count = Integer.parseInt(statsCount);
	%>
		<table border="1"class="type09">
			<tr>
				<th>일자</th><th>이미지</th><th>상품 분류</th><th>매입가</th><th>수량</th><th>판매가</th>
			</tr>		
	<%
			if(select.equals("2")){
				ArrayList<statsDTO> list = dao.purchaseSearch(date1,date2,start,end);
				if(list.size() > 0){
					for (statsDTO dto : list){
	%>
						<tr>
							<td><%=dto.getInputdate() %></td>
							<td></td>
							<td></td>
							<td><%=dto.getPurchase() %></td>
							<td></td>	
							<td></td>				
						</tr>
	<%				}
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
	%>
					<br/>
					<a href="purchaseStat.jsp?pageNum=<%=startPage - 10 %>&select=<%=select%>&date1=<%=date1%>&date2=<%=date2%>">[이전]</a>		
	<%			}
				for (int i = startPage; i <= endPage; i++){
	%>			
					<a href="purchaseStat.jsp?pageNum=<%=i %>&select=<%=select%>&select=<%=select%>&date1=<%=date1%>&date2=<%=date2%>">[<%=i %>]</a>	
	<%			}
				if(endPage < pageCount){
	%>	
					<a href="purchaseStat.jsp?pageNum=<%=startPage + 10%>&select=<%=select%>&date1=<%=date1%>&date2=<%=date2%>">[다음]</a>
	<%			}	
			}	
	%>
	</div>
</body>
</html>