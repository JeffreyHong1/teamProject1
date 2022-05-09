<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>select 값 받아서 뿌려주기</title>
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
		//switch문에 대입해서 조건에 맞는 페이지로 할당
		//RequestDispatcher 객체 와 forward 함수로 member 페이지의 다중 셀렉트 박스의 파라미터를 해당 페이지로 보내줌
		//switch 조건에는 문자열이 들어가도 됨
		switch(select){
			case "1": RequestDispatcher rd1 = request.getRequestDispatcher("status.jsp");
					rd1.forward(request,response);
					break;
			
			case "2": RequestDispatcher rd2 = request.getRequestDispatcher("orderDate.jsp");
					rd2.forward(request,response);
					break;
			
			case "3": RequestDispatcher rd3 = request.getRequestDispatcher("refund.jsp");
					rd3.forward(request,response);
					break;
			
			case "4": RequestDispatcher rd4 = request.getRequestDispatcher("orderProd.jsp");
					rd4.forward(request,response);
					break;			
		}
	%>
</body>
</html>