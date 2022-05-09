<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.project1.dto.FormDTO" %>
<%@ page import="team.project1.dao.FormDAO" %>
<%@ page import="java.sql.Timestamp" %>
<head>
	<title>loginPro.jsp</title>
</head>

	<jsp:useBean id="dto" class="team.project1.dto.FormDTO" />
	<jsp:setProperty property="*" name="dto" />
	<jsp:useBean id="dao" class="team.project1.dao.FormDAO" />

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

		String result = dao.loginCheck(dto);	
		if(result != null){
			session.setAttribute("sid", dto.getId());
			response.sendRedirect("adminCheck.jsp");
		}else { 
	%>
		<script>
			alert("아이디/비밀번호를 확인하세요.");
			history.go(-1); 
		</script>	
	<% 
		}	
	%>

	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>