<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="team.project1.dto.orderStatDTO" %>
<%@ page import="team.project1.dao.orderStatDAO" %>   
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>반품 조회</title> 
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
	%>
		<table border="1" class="type09">
			<tr>
				<th>아이디</th><th>주문번호</th><th>주문일자</th><th>제품분류</th><th>주소</th><th>주문처리상황</th>
			</tr>
	<%
			String select = request.getParameter("select");
			String checkbox [] = request.getParameterValues("restatus1");
			String date1 = request.getParameter("redate1");
			String date2 = request.getParameter("redate1_1");
			String result = null;
			for(int i = 0; i <= checkbox.length; i++) {
				result = Arrays.toString(checkbox); 
				//배열로 받은 체크박스 값을 꺼내준다
			}
			result = result.replaceAll("[\\[\\[\\]]","");
			if (select.equals("3")){
				orderStatDAO dao = new orderStatDAO();
				ArrayList<orderStatDTO> list = dao.refundSearch(result,date1,date2);
				if(list.size() > 0){
					for(orderStatDTO dto : list){
	%>
						<tr>
							<td><%=dto.getId() %></td>
							<td><%=dto.getOrderdate() %></td>
							<td><%=dto.getOrderProd() %></td>
							<td><%=dto.getOrderStat() %></td>
						</tr>
	<%				}
				}
			}
	%>
	</table>

</body>
</html>