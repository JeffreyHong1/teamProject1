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
	<title>주문 상태별 조회</title> 
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
		String checkbox [] = request.getParameterValues("status");
		//체크박스의 값을 배열로 받는다
		String result = null;
		for(int i = 0; i <= checkbox.length; i++) {
			result = Arrays.toString(checkbox); 
			//배열로 받은 체크박스 값을 꺼내준다
		}
		result = result.replaceAll("[\\[\\[\\]]","");
		//꺼낸 체크박스 값에 있는 []를 제거해준다
		//application.log("==select==>"+select);
		//내장 객체 이용해서 파라미터의 상태 확인(어떤 값이 넘어가고,넘어오는지 확인 가능) 
		//application.log("==result==>"+result);
		if(select.equals("1")){
			orderStatDAO dao = new orderStatDAO();
			ArrayList<orderStatDTO> list = dao.orderStatus(result);
			//application.log("==size==>"+list.size());
			if(list.size() > 0){
			//이 조건문이 실행 안되는 이유......list 사이즈가 0 이라서....
			//list 사이즈가 0인 이유......DAO 의 list.add가 동작 하지 않아서.....??
			//list.add가 동작하지 않은 이유는........commit을 안해서.......ㅜㅜ
				for (orderStatDTO dto : list){
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