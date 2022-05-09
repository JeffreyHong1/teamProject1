<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.project1.dto.productDTO" %>
<%@ page import="team.project1.dao.productDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>상품 주문전 로그인 여부</title>
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
		  vertical-align: top;
		  color: #369;
		
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
		
		String sid = (String)session.getAttribute("sid");
		String pnum = request.getParameter("pnum");
		productDAO dao = new productDAO();
		productDTO dto = dao.readContent(pnum);

	%>
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
	<%
		if (!(sid == null)){
	%>
		<script>
			alert("주문페이지로 이동 합니다");
			window.location = "memberOrder.jsp?pnum=<%=pnum %>";
		</script>
	<%
		}else{
	%>
		<form action = "OrderSingUpPro.jsp?pnum=<%=pnum %>" method = "post" name = "login" onsubmit = "return checkValue();">
			<table class="type09">
				<tr>
					<td>아이디</td>
					<td><input type = "text" name = "id" ></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type = "password" name = "pw" ></td>
				</tr>
			</table>
			<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
				<input type = "button" value = "회원가입" onclick = "window.location = '/teamProject1/member/signupForm.jsp'" />
				<input type = "submit" value = "로그인" />
				<input type = "button" value = "비회원 주문" onclick = "window.location='/teamProject1/order/guestOrder.jsp?pnum=<%=pnum %>'"/>
			</div>
		</form>
	<%
		} 
	%>
	</div>
	
	<script>
		function checkValue(){
			
			i = document.login.id.value;
			if(i == ""){
				alert("id를 입력하세요.");
				document.login.id.focus();
				return false;
			}
			
			p = document.login.pw.value;
			if(p == ""){
				alert("pw를 입력하세요.");
				document.login.pw.focus();
				return false;
			}
		}
	</script>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>
</body>
</html>