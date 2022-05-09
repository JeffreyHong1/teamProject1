<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<jsp:useBean id="dto" class="team.project1.dto.bulletinDTO" />
	<jsp:setProperty property="*" name="dto" />
	<jsp:useBean id="dao" class="team.project1.dao.bulletinDAO" />
	<%
		int result = dao.boardUpdate(dto);
		if(result == 1){
	%>		<script>
				alert("수정되었습니다.");
				window.location='content.jsp?num=<%=dto.getNum()%>';
			</script>
	<%	}else{ %>
			<script>
				alert("비밀번호를 확인하세요.");
				history.go(-1);
			</script>
	<%	
		} 
	%>
