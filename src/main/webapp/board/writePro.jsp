<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!--DTO 객체생성  -->
	<jsp:useBean id="dto" class="team.project1.dto.bulletinDTO"/>
	<!-- 받아온 모든 정보를 DTO내 해당하는 변수에 저장 -->
	<jsp:setProperty property="*" name="dto"/>
	<!--DAO 객체생성  -->
	<jsp:useBean id="dao" class="team.project1.dao.bulletinDAO"/>
	
	<%
		//dao내 boardInsert메소드에 현재 dto에 저장되어있는 정보를 대입한 결과를 result에 대입
		int result = dao.boardInsert(dto); 
	
	%>
	
	<script>
			alert("작성완료!");
			window.location="list.jsp" /* list.jsp로 페이지이동 */
	
	</script>
