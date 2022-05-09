<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<title>newPWPro.jsp</title>
</head>

	<jsp:useBean id="dto" class="team.project1.dto.FormDTO" />
	<jsp:setProperty property="*" name="dto" />
	<jsp:useBean id="dao" class="team.project1.dao.FormDAO" />

	<%
		int result = dao.PWupdate(dto);
		
		if(result == 1){
	%>		<script type="text/javascript">
				alert("수정이 완료되었습니다.");
				window.location="loginForm.jsp";
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