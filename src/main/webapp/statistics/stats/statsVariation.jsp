<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>페이지 뿌려주기</title>
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
		String purchase = request.getParameter("purchase");
		String spending = request.getParameter("spending");
		//switch case 문 안에 if문으로 추가 조건 생성
		switch(select){
		
		case "1": RequestDispatcher rd1 = request.getRequestDispatcher("salesStat.jsp");
				rd1.forward(request,response);
				break;
		case "2": 
			if(purchase.equals("search")){
				RequestDispatcher rd2 = request.getRequestDispatcher("purchaseStat.jsp");
				rd2.forward(request,response);
			}else if(purchase.equals("insert")){
				RequestDispatcher rd2 = request.getRequestDispatcher("purchaseInsertForm.jsp");
				rd2.forward(request,response);
			}else{
				RequestDispatcher rd3 = request.getRequestDispatcher("purchaseUpdateForm.jsp");
				rd3.forward(request,response);
			}
			break;
		case "3": 
			if(spending.equals("search")){
				RequestDispatcher rd3 = request.getRequestDispatcher("spendStat.jsp");
				rd3.forward(request,response);
			}else if(spending.equals("insert")){
				RequestDispatcher rd3 = request.getRequestDispatcher("spendingInsertForm.jsp");
				rd3.forward(request,response);
			}else{
				RequestDispatcher rd3 = request.getRequestDispatcher("spendingUpdateForm.jsp");
				rd3.forward(request,response);
			}
			break;
		}
	%>
</body>
</html>