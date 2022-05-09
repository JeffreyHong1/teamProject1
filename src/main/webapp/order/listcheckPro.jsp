<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "team.project1.dao.OrderDAO" %>
<%@ page import = "team.project1.dto.OrderDTO" %>

	<jsp:useBean id = "dto" class = "team.project1.dto.OrderDTO" />
	<jsp:setProperty property = "*" name = "dto" />
	<jsp:useBean id = "dao" class = "team.project1.dao.OrderDAO" />
	<%-- 
		비회원의 정보를 조회 후 주문조회 페이지로 이동
	--%>

	<%
		String result = dao.guCheck(dto);
	
		 if(!(result == null)){ 
		 	session.setAttribute("gu_email", dto.getGu_email());
			response.sendRedirect("guestOrderList.jsp");
	
		 } else { 
	%>
	
		<script>
			alert("Email 혹은 전화번호를 다시 확인해주세요.");
			history.go(-1);
		</script>	
	<%  
		}  
	%>