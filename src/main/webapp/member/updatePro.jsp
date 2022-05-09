<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.project1.dto.FormDTO" %>
<%@ page import="team.project1.dao.FormDAO" %>
<%@ page import="java.sql.Timestamp" %>
<head>
	<title>updatePro.jsp</title>
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
	%>
	
	<% 
		// 로그인 후 사용가능한 페이지에 다 있어야한다.
		if(session.getAttribute("sid") == null){
	%>
		<script>
			alert("로그인 후 사용가능합니다.");
			window.location="/teamProject1/main/mallMain.jsp";
		</script>
	<% 
		} 
	%>

	<%
		int result = dao.update(dto);
		
		if(result == 1){
	%>		<script type="text/javascript">
				alert("수정이 완료되었습니다.");
				window.location="mypageForm.jsp";
			</script>	
	<% 
		}else{ 
	%>
		<script>
			alert("다시 확인해주세요."); 
			history.go(-1);
		</script>
	<% 
		} 
	%>

	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>