<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<title>로그아웃</title>
</head>

	<%
		// 세션 삭제 
		session.invalidate();
		response.sendRedirect("/teamProject1/main/mallMain.jsp");
	%>