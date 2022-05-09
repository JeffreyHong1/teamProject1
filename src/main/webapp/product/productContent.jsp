<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.project1.dto.productDTO" %>
<%@ page import="team.project1.dao.productDAO" %>
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
	
	   String pnum = request.getParameter("pnum");
	   productDAO dao = new productDAO();
	   productDTO dto = dao.readContent(pnum);
	%>
	<table class="type09">
		<tr>
			<td>
				<img src="/teamProject1/image/<%=dto.getImg()%>" width="300" height="400">
			</td>
			<td>
				<table class="type09">
					<tr >
						<td>상품종류</td>
						<td><%=dto.getPclass()%></td>
					</tr>	
					<tr >
						<td>상품이름</td>
						<td><%=dto.getPname()%></td>
					</tr>
	
					<tr >
						<td>사이즈</td>
						<td><%=dto.getPsize()%></td>
					</tr>
					<tr >
						<td>가격</td>
						<td><%=dto.getPrice()%></td>
					</tr>
	
					<tr >
						<td>재고</td>
						<td><%=dto.getStock()%></td>
					</tr>
	
				</table>
	</table>
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
		<input type="button" value="구매하기" onclick="window.location='/teamProject1/order/OrderSingUp.jsp?pnum=<%=dto.getPnum() %>' ">
		<input type="button" value="장바구니" onclick="window.location='/teamProject1/order/cart.jsp' ">
	</div>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>
</body>