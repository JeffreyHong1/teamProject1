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
	<title>회원 장바구니</title>
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
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<h1 align="center">주문조회</h1>
	</div>
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<p align="left">고객정보</p>
	<%
		if(!(id==null)) {
	%>
		<table border="1" class="type09">
			<tr>
				<td>
					사용자 이름 :<%=dto2.getName() %><br />
					전화번호 :<%=dto2.getPhone() %><br />
					배송지 :<%=dto2.getAddr() %><br />
				</td>
			</tr>
		</table>
	<% } %>
	</div>
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<p>상품정보</p>
	<%
		if(list.size() > 0) {
			for (OrderDTO dto :list) {
	%>
		<table border="1" class="type09">
			<tr>
				<td>
					<%=dto.getImg() %>
				</td>
				<td>
					<table>
						<tr>
							<td>
								상품명 :<%=dto.getPname() %><br />
								사이즈 :<%=dto.getPsize() %><br />
								수량 :<%=dto.getQuantity() %><br />
								가격 :<%=dto.getPrice() %><br />
							</td>
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