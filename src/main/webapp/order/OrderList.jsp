<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<jsp:useBean id = "dto" class = "team.project1.dto.OrderDTO" />
<jsp:useBean id = "dao" class = "team.project1.dao.OrderDAO" />
<jsp:setProperty property = "*"  name = "dto" />
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
	<%
		String id = (String)session.getAttribute("sid");
		//list 타입을 int 타입으로 받는 이유가.....????
		//int result = dao.orderlist(dto);
		
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
		<h1 align="center">주문조회</h1>
	</div>
	<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<p align="left">고객정보</p>
	<%
		if (!(id == null)) {
	%>
		<table border="1" class="type09">
			<tr>
				<td>
					사용자 이름 :<%=dto.getName()%><br />
					전화번호 :<%=dto.getPhone()%><br />
					주소 :<%=dto.getAddr()%><br />
				</td>
			</tr>
		</table>
	<%
		}
	%>
	</div>
	<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<p>상품정보</p>
		<table border="1" class="type09">
			<tr>
				<td></td>
				<td>
					<table border="1" class="type09">
						<tr>
							<td>
								상품명 : <br />
								사이즈 : <br />
								수량 : <br />
								가격 : <br />
								최종가격 :
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>
</body>
</html>