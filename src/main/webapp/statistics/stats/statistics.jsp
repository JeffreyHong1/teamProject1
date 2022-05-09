<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>통계</title>
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
		<form action="statsVariation.jsp" name="statistics">
			<table>
				<tr>
					<td>
						<select name="select" id="stats" onchange="option()">
							<option>===선택===</option>
							<option value="1" disabled>매출조회</option>
							<option value="2">매입 조회/입력</option>
							<option value="3">지출 조회/입력</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><div id="show"></div></td>
				</tr>
				<tr>
					<td><div id="show0"></div></td>
				</tr>
				<tr>
					<td><div id="show1"></div></td>
				</tr>
			</table>
			<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
				<input type="submit" value="확인"/>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	function option(){
		var property = document.getElementById('stats').value;
		var show = document.getElementById('show');
		if (property == '1'){show.innerHTML = '<select name="sales" id="stats1" onchange="option1()"><option>==선택==</option><option value="11">기간</option><option value="12" disabled>상품</option><option value="13" disabled>회원/비회원</option><option value="14">성별</option></select>';}
		if (property == '2'){show.innerHTML = '<select name="purchase" id="stats2" onchange="option2()"><option>==선택==</option><option value="search">조회</option><option value="insert">입력</option><option value="update" disabled>수정</option></select>';}
		if (property == '3'){show.innerHTML = '<select name="spending" id="stats3" onchange="option3()"><option>==선택==</option><option value="search">조회</option><option value="insert">입력</option><option value="update" disabled>수정</option></select>';}
		if (property == '4'){show.innerHTML = '<select name="event" id="stats4" onchange="option4"><option>==선택==</option><option value="search" disabled>조회</option><option value="insert" disabled>등록</option><option value="update" disabled>변경</option><option value="delete" disabled>해제</option></select>';}
	}
	function option1(){
		var property = document.getElementById('stats1').value;
		var show = document.getElementById('show0');
		if (property == '11'){show.innerHTML = '<input type="date" name="date1"/> ~ <input type="date" name="date2"/>';}
		//if (property == '12'){show.innerHTML = '<select name="salesGender" id="stats12" onchange="option12"><option>==선택==</option><option value="121">남성</option><option value="122">여성</option></select>';}
		//if (property == '13'){show.innerHTML = '<select><option>==선택==</option><option>회원</option><option>비회원</option></select>';}
		if (property == '14'){show.innerHTML = '<select name="gender" id="stats14" onchange="option04"><option>==선택==</option><option value="남">남성</option><option value="여">여성</option></select>';}
	}
	function option2(){
		var property = document.getElementById('stats2').value;
		var show = document.getElementById('show0');
		if (property == 'search'){show.innerHTML = '<input type="date" name="date1"/> ~ <input type="date" name="date2"/>';}
	}	
	function option3(){
		var property = document.getElementById('stats3').value;
		var show = document.getElementById('show0');
		if(property == 'search'){show.innerHTML = '<input type="date" name="date1"/> ~ <input type="date" name="date2"/>';}
		//if(property == 'insert'){show.innerHTML = '<select name="parts"><option>==선택==</option><option value="1">고정지출</option><option value="하의">하의</option><option value="신발">신발</option></select>';}
		//if(property == 'update'){show.innerHTML = '<input type="date" name="date1"/> ~ <input type="date" name="date2"/>';}
	}	
</script>
</html>