<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:useBean id = "dto" class = "team.project1.dto.OrderDTO" />    
	<jsp:useBean id = "dao" class = "team.project1.dao.OrderDAO" />    
	<jsp:setProperty property = "*" name = "dto" />

	<%	
		String id = (String)session.getAttribute("sid");
		int result = dao.cart(dto); 	
		if(!(id==null)){%>
			<script>
				alert("장바구니에 추가 되었습니다");
				history.go(-1);
			</script>
	<%
		}else{ 
	%>
			<script>
				alert("장바구니에 추가 되었습니다");
				history.go(-1);
			</script>	
	<%	
		} 
	%>	
