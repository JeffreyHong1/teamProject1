<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>방문자 통계</title>
	<style type="text/css">
		.menu{
			position : absolute;
			top: 20%;
			left : 50%;
			transform: translate(-50%, -50%);
		}	
	</style>	
</head>
<body>
	<jsp:include page="/statistics/header.jsp"></jsp:include>
	<% 
		String sid = (String)session.getAttribute("sid");
		if(session.getAttribute("sid") == null){
	%>
			<script type="text/javascript">
				alert("관리자 로그인 후 가능 합니다.")
				window.location="/teamProject1/main/mallMain.jsp";
			</script>
	<%
		}
	%>	
		<div class="menu">
		<div class="center">
			<form>
				<input type="date"/> ~ <input type="date"/>
				<input type="submit" value="조회"/>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">


//홈페이지 방문자 카운트 표시(관리자 메인 페이지 좌측에도 출력)
//당일 방문자/가입자 카운트 표시
//생성된 세션 숫자 카운트 해서 입력....???
//세션 아이디를 카운팅 할때 중복된 세션 아이디는 카운팅에서 제외하는 방법 사용
//총방문자는.........변수에 계속 저장 하면.....???
</script>
</html>