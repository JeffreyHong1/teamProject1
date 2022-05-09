<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 계정 확인</title>
</head>
	<body>
		<% 
			String sid = (String)session.getAttribute("sid");
			
			if(sid.equals("admin")){
				RequestDispatcher rd = request.getRequestDispatcher("/statistics/addminMain.jsp");
				rd.forward(request,response);
			}else if(!sid.equals("admin")){
				response.sendRedirect("/teamProject1/main/mallMain.jsp");
			}else{
				RequestDispatcher rd = request.getRequestDispatcher("/teamProject1/main/mallMain.jsp");
				rd.forward(request,response);
			}
		%>
	</body>
</html>
