<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>idConfirm.jsp</h1>

	<jsp:useBean id="dto" class="team.project1.dto.FormDTO" />
	<jsp:setProperty property="*" name="dto" />
	<jsp:useBean id="dao" class="team.project1.dao.FormDAO" />
	
	<%=dto.getId()%>
	<% String result = dao.idConfirm(dto);%>
	<%=result%>