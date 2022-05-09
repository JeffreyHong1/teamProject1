<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "team.project1.dao.OrderDAO" %>
<%@ page import = "team.project1.dto.OrderDTO" %>
<%@ page import = "java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shopping Cart</title>
	<style>
		table.type09 {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 1.5;
		  margin: auto;
		}
		table.type09 th {
		  padding: 50px;
		  font-weight: bold;
		  vertical-align: auto;
		}
		table.type09 tr {
		  width: 150px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: auto;
		  background: #f3f6f7;
		}
		table.type09 td {
		  width: 350px;
		  padding: 10px;
		  vertical-align: auto;
		}
	</style>
</head>
<body>
	<%
		String id = (String)session.getAttribute("sid");
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> list = dao.orderlist(id);
		OrderDTO dto2 = dao.orderinfo(id);

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
	%>
	
	
	<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<h1>주문조회</h1>
		<p>고객정보</p>
	<%
		if(!(id==null)) {
	%>
		<table class="type09">
			<tr>
				<td>사용자 이름</td>
				<td><%=dto2.getName() %></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=dto2.getPhone() %></td>
			</tr>
			<tr>
				<td>배송지</td>
				<td><%=dto2.getAddr() %></td>
			</tr>
		</table>
	<% 
		} 
	%>
	</div>
	<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<p>상품정보</p>
	<%
		if(list.size() > 0) {
			for (OrderDTO dto :list) {
	%>
		<table class="type09">
			<tr>
				<td>
					<img src="/teamProject1/image/<%=dto2.getImg() %>" width="100%" height="100%" alt="상품정보가없습니다.">
				</td>
				<td>
					<table class="type09">
						<tr>
							<td>상품명</td>
							<td><%=dto.getPname() %></td>
						</tr>
						<tr>
							<td>사이즈</td>
							<td><%=dto.getPsize() %></td>
						</tr>
						<tr>
							<td>수량</td>
							<td><%=dto.getQuantity() %></td>
						</tr>
						<tr>
							<td>판매가</td>
							<td><%=dto.getPrice() %></td>
						</tr>
						<tr>
							<td>배송비</td>
							<td>2500</td>
						</tr>
						<tr>
							<td>최종가격</td>
							<td><%=dto.getLastPriceDc()%></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	<%
			}
		}else{ 
	%>
		<p>주문하신 상품이 없습니다.</p>
	<% 
		} 
	%>
	</div>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>
</body>
</html>