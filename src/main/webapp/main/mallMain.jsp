<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 대문</title>
</head>
<body>
	<%
		//로그인 상태 와 로그아웃 상태를 구분하여 헤더 출력
		if(session.getAttribute("sid") == null){
	%>
			<jsp:include page="header.jsp"></jsp:include>
	<%
		}else{
	%>
			<jsp:include page="loginHeader.jsp"></jsp:include>
	<%
		}
	%>
	<jsp:include page="/product/productList.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>