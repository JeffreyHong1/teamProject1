<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>셀렉트 박스 조건으로 페이지 연결</title>
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
		int selNum = Integer.parseInt(select);
		//member 페이지의 select 값을 가져와서 int로 강제 형변환
		//switch문에 대입해서 조건에 맞는 페이지로 할당
		//RequestDispatcher 객체 와 forward 함수로 member 페이지의 다중 셀렉트 박스의 파라미터를 해당 페이지로 보내줌
		//switch 조건에는 문자열이 들어가도 됨
		switch(selNum){
			
			case 1: RequestDispatcher rd1 = request.getRequestDispatcher("memberPro.jsp");
					rd1.forward(request,response);
			break;
			case 2: RequestDispatcher rd2 = request.getRequestDispatcher("location.jsp");
					rd2.forward(request,response);
			break;
			case 3: RequestDispatcher rd3 = request.getRequestDispatcher("ages.jsp");
					rd3.forward(request,response);
			break;
			case 4: RequestDispatcher rd4 = request.getRequestDispatcher("gender.jsp");
					rd4.forward(request,response);
			break;
			case 5: RequestDispatcher rd5 = request.getRequestDispatcher("buy.jsp");
					rd5.forward(request,response);
			break;
			case 6: RequestDispatcher rd6 = request.getRequestDispatcher("amount.jsp");
					rd6.forward(request,response);
			break;
		}
	%>

</body>
</html>