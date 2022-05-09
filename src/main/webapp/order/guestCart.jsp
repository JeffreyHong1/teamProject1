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
	<title>비회원 장바구니</title>
	<style>
		table.type09 {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 1.5;
		  margin-left: auto;
		  margin-right: auto;
		}	
		table.type09 tr {
		  width: 50px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		  background: #f3f6f7;
		}
		table.type09 td {
		  width: 250px;
		  padding: 10px;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		}
		#type01 {
		  WIDTH: 100%; 
		  margin: auto; 
		  text-align: center; 
		  display: inline-block; 
		  padding-top: 20px;
		}
	</style>
</head>
<body>
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
	
		String id = (String)session.getAttribute("sid");
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> list = dao.cartMember(id);
		OrderDTO dto2 = dao.orderinfo(id);
	%>
	<div class="type01">
		<h1 align="center">비회원 주문조회</h1>
	</div>
	<div class="type01">
		<p align="left">고객정보</p>
	<%	
		if(!(id==null)) {
	%>
		<table class="type01">
			<tr>
				<td>주문번호</td>
				<td><%=dto2.getOrder_num() %></td>
			</tr>
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
		<% } %>
	</div>
	<div class="type01">
		<p>상품정보</p>
	<%
		if(list.size() > 0) {
			for (OrderDTO dto :list) {
	%>
		<table class="type09">
			<tr>
				<td>
					<img src="/teamProject1/image/<%=dto.getImg()%>" width="100%" height="100%">
				</td>
				<td>
					<table class="type09">
						<tr>
							<td>상품명 </td>
							<td><%=dto.getPname() %></td>
						</tr>
						<tr>
							<td>사이즈 </td>
							<td><%=dto.getPsize() %></td>
						</tr>
						<tr>
							<td>수량 </td>
							<td><%=dto.getQuantity() %></td>
						</tr>
						<tr>
							<td>가격 </td>
							<td><%=dto.getPrice() %></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	<%
			}
		}
	%>
	</div>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>
</body>
</html>