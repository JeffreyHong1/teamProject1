<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 관리 페이지</title>
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
		<div class="menu" style="margin:auto; text-align: center;">
			<form method="post" action="productVariation.jsp" name="order">
				<table>
					<tr>
						<td>
							<select name="select" id="product" onchange="option()">
								<option value="0">==선택==</option>
								<option value="1">상품 입력</option>
								<option value="2">상품 조회</option>
								<option value="3" disabled>반품 조회</option>
								<option value="4" disabled>상품별 조회</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><div id="show"></div></td>
					</tr>
					<tr>
						<td><div id="show1"></div></td>
					</tr>
					<tr>
						<td><div id="show2"></div></td>
					</tr>
				</table>
				<input type="submit" value="확인"/>
			</form>
		</div>
</body>
<script type="text/javascript">
	function option (){
		var property = document.getElementById('product').value;
		var show = document.getElementById('show');
		if (property == "2"){show.innerHTML = '<select name="gender" id="members4" onchange="option4()"><option>==선택==</option><option value="all">전체</option><option value="m">남</option><option value="f">여</option></select>';}
	}	
</script>
</html>