<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.project1.dto.FormDTO" %>
<%@ page import="team.project1.dao.FormDAO" %>
<%@ page import="team.project1.dto.productDTO" %>
<%@ page import="team.project1.dao.productDAO" %>
<%@ page import="java.sql.Timestamp" %>

	
	<jsp:useBean id="dto" class="team.project1.dto.FormDTO" />
	<jsp:setProperty property="*" name="dto" />
	<jsp:useBean id="dao" class="team.project1.dao.FormDAO" />	
	
	<%
		String pnum = request.getParameter("pnum");		
		productDAO dao2 = new productDAO();
		productDTO dto2 = dao2.readContent(pnum);
		String result = dao.loginCheck(dto);
		
		if(result != null){
			session.setAttribute("sid", dto.getId());
			response.sendRedirect("memberOrder.jsp?pnum="+ dto2.getPnum());
		}else { 
	%>
		<script>
			alert("id/pw를 확인하세요.");
			history.go(-1);
		</script>	
	<% 
		}	
	%>