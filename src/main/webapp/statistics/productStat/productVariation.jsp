<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>프로덕트 셀렉트 조건에 따라 페이지 이동</title>
</head>
<body>
	<%
		if(session.getAttribute("sid") == null){
	%>
			<script type="text/javascript">
				alert("관리자 로그인 후 가능 합니다.")
				window.location="/teamProject1/main/mallMain.jsp";
			</script>
	<%
		}
		String select = request.getParameter("select");
		
		if(select.equals("1")){
			RequestDispatcher rd = request.getRequestDispatcher("productInsertForm.jsp");
			rd.forward(request,response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("productSearch.jsp");
			rd.forward(request,response);
		}
	%>

</body>
</html>