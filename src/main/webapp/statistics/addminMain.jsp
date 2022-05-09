<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="team.project1.dao.adminMemDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta content="text/html; charset=UTF-8" http-equiv="Content-Type" >
	<title>관리자 메인 페이지</title>
	<style>
		
		.menu{
			position : absolute;
			top: 20%;
			left : 50%;
			transform: translate(-50%, -50%);
		}
	</style>
</head>
<body>
	<jsp:include page="/statistics/header.jsp"></jsp:include>
	<%
		if(session.getAttribute("sid") == null){
	%>
			<script type="text/javascript">
				alert("관리자 로그인 후 가능 합니다.")
				window.location="/teamProject1/main/mallMain.jsp";
			</script>
	<%	
		}
		//Object 객체인 application의 속성을 이용해서 세션의 숫자 카운트
		Object cnt = application.getAttribute("count");
		adminMemDAO dao = new adminMemDAO();
		
		if( cnt == null ){
			application.setAttribute("count", 0);
			cnt = application.getAttribute("count");
		}else{
			int cn = (Integer)cnt;
			//세션이 새로 생성된 세션일 경우에 1증가
			if(session.isNew()) cn++;
			application.setAttribute("count",cn);
		}
		int count = dao.memAllCount();	
	%>	
	<div class="menu">		
		<h3>오늘 방문자 수 : <%=cnt %> 명</h3>
		<h3>총 회원 : <%=count%></h3>
	</div>	
</body>
</html>