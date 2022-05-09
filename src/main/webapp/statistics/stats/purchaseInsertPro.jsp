<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매입 입력 처리</title>
</head>
<body>
	<jsp:useBean id="dto" class="team.project1.dto.statsDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	<jsp:useBean id="dao" class="team.project1.dao.statsDAO"></jsp:useBean>
	<%
		int result = dao.purchaseInsert(dto);
		if(session.getAttribute("sid") == null){
	%>
			<script type="text/javascript">
				alert("관리자 로그인 후 가능 합니다.")
				window.location="/teamProject1/main/mallMain.jsp";
			</script>
	<%}%>
	<script type="text/javascript">
		alert("입력 되었습니다.");
		window.location='purchaseInsertForm.jsp';
	</script>
</body>
</html>