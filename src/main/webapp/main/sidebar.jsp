<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사이드 바</title>
	<style type="text/css">
		.btn{
			text-decoration: none;
			font-size:0.8rem;
			color:black;
			padding:5px 5px 5px 5px;
			margin:10px;
			display:inline-block;
			border-radius: 10px;
			transition:all 0.1s;
		}
		.btn.color{
			background-color: #b4b4b4	;
			border-bottom:5px solid #505050		;
		}
	</style>
</head>
<body>
	<%
		
		if(session.getAttribute("sid") == null){
	%>
		<a class="btn color" style="display:scroll;position:fixed;bottom:590px;right:3px; width: 60px; text-align:center;" rel="nofollow" href="#" title="Back to Top" >TOP↑</a><br />
		<a class="btn color" style="display:scroll;position:fixed;bottom:555px;right:3px; width: 60px; text-align:center;" rel="nofollow" href="/teamProject1/member/loginForm.jsp" title="go to login" >LOGIN</a><br />
		<a class="btn color" style="display:scroll;position:fixed;bottom:520px;right:3px; width: 60px; text-align:center;" rel="nofollow" href="/teamProject1/board/list.jsp" title="go to board" >BOARD</a><br />
		<a class="btn color" style="display:scroll;position:fixed;bottom:485px;right:3px; width: 60px; text-align:center;" rel="nofollow" href="#scrollbottom" title="Go to Bottom" >BOTTOM↓</a>
	<%
		}else{
	%>		
		<a class="btn color" style="display:scroll;position:fixed;bottom:590px;right:3px; width: 60px; text-align:center;" rel="nofollow" href="#" title="Back to Top" >TOP↑</a><br />
		<a class="btn color" style="display:scroll;position:fixed;bottom:555px;right:3px; width: 60px; text-align:center;" rel="nofollow" href="/teamProject1/member/logout.jsp" title="go to logout" >LOGOUT</a><br />
		<a class="btn color" style="display:scroll;position:fixed;bottom:520px;right:3px; width: 60px; text-align:center;" rel="nofollow" href="/teamProject1/board/list.jsp" title="go to board" >BOARD</a><br />
		<a class="btn color" style="display:scroll;position:fixed;bottom:485px;right:3px; width: 60px; text-align:center;" rel="nofollow" href="#scrollbottom" title="Go to Bottom" >BOTTOM↓</a>
	<%	}
	%>
	<!--페이지 끝을 찾아오기 위한 블럭  -->
	<div id="scrollbottom"></div>
</body>
</html>