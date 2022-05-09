<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.project1.dto.FormDTO" %>
<%@ page import="team.project1.dao.FormDAO" %>
<%@ page import="java.sql.Timestamp" %>
<head>
	<title>findIDcheck.jsp</title>
</head>

	<jsp:useBean id="dto" class="team.project1.dto.FormDTO" />
	<jsp:setProperty property="*" name="dto" />
	<jsp:useBean id="dao" class="team.project1.dao.FormDAO" />

	<jsp:include page="/main/header.jsp"></jsp:include>

	<%
		dao.findIDcheck(dto);
		if(dto.getId() != null){
	%>		 
		<script>
			alert("회원님의 아이디는 <%=dto.getId()%> 입니다.");
			window.location='loginForm.jsp';
		</script>
	<%
		} else { 
	%>
		<script>
			alert("이름/연락처를 확인하세요.");
			history.go(-1); 
		</script>	
	<% 
		} 
	%>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include> 