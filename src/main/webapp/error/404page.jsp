<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>페이지를 찾을 수 없습니다.</title>
</head>
<body>
	<%
		response.setStatus(HttpServletResponse.SC_OK);
	%>
	<ul style="list-style:none;">
		<li>
			<a href="/teamProject1/main/mallMain.jsp"><img src="/teamProject1/image/404page.jpg" width="100%" height="100%"/></a>
		</li>
	</ul>
</body>
</html>