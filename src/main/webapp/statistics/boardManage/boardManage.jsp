<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 관리</title>
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
		if(session.getAttribute("sid") == null){
	%>
			<script type="text/javascript">
				alert("관리자 로그인 후 가능 합니다.")
				window.location="/teamProject1/main/mallMain.jsp";
			</script>
	<%}%>
		<div class="menu">
			<form>
				<select name="boards" id="board" onchange="option1()">
					<option value="0">==선택==</option>
					<option value="1" disabled>공지사항</option>
					<option value="2" disabled>문의</option>
					<option value="3" disabled>리뷰</option>
					<option value="4" disabled>이벤트</option>
				</select><div id="show"></div>	
				<input type="submit" value="조회"/>
			</form>
		</div>
</body>
<script type="text/javascript">
	function option1(){ //게시판 자체에 입력/수정/삭제 기능이 있을경우 게시판 페이지만 읽어오면 됨
		var property = document.getElementbyId('board').value;
		var show = document.getElementById('show');
		if (property == ''){show.innerHTML = '';}
	}
</script>
</html>