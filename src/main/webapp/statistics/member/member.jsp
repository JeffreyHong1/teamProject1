<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.project1.dao.adminMemDAO" %>
<%@ page import="team.project1.dto.adminMemDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리</title>
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
	<%	}%>
	<div class="menu" style="margin:auto; text-align: center;" >
		<form method="post" action="memVariation.jsp" name="member" >
			<table>
				<tr>
					<td>
						<select name="select" id="members" onchange="option()">
							<option value="0">==선택==</option>
							<option value="1">신규가입</option>
							<option value="2">지역별</option>
							<option value="3">연령별</option>
							<option value="4">성별</option>
							<option value="5">구매 횟수</option>
							<option value="6">주문 금액</option> 
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
			<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
				<input type="submit" value="조회"/>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	//다중 셀렉트 박스 
	//onchange 이벤트로 함수 찾아가게 하고
	//해당 함수에서 추가 셀렉트 박스 생성 이벤트 발생
	//name 을 통해서 파라미터가 넘어가게 되고, 넘어가는 파라미터는 value 값
	function option (){
		var property = document.getElementById('members').value;
		var show = document.getElementById('show');
		if (property == "1"){show.innerHTML = '<input type="date" name="member1"/>~<input type="date" name="member1_1"/>';}
		if (property == "2"){show.innerHTML = '<select name="member2"><option>==선택==</option><option value="서울">서울</option><option value="경기">경기</option><option value="충남">충남</option><option value="충북">충북</option><option value="강원">강원</option><option value="전북">전북</option><option value="전남">전남</option><option value="경북">경북</option><option value="경남">경남</option><option value="제주">제주도</option></select>';}
		if (property == "3"){show.innerHTML = '<input type="date" name="age1"/> ~ <input type="date" name="age2"/>';}
		if (property == "4"){show.innerHTML = '<select name="gender" id="members4" onchange="option4()"><option>==선택==</option><option value="남">남</option><option value="여">여</option></select>';}		
		if (property == "5"){show.innerHTML = '<select name="member5" id="members5" onchange="option5()"><option>==선택=</option><option value="all">전체</option><option value="desc">높은순</option><option value="asc">낮은순</option></select>';} 
		if (property == "6"){show.innerHTML = '<select name="member6" id="members6" onchange="option6()"><option>==선택=</option><option value="all">all</option><option value="desc">decending</option><option value="asc">ascending</option></select>';}
	}		
	function option5(){
		//다중 셀렉트 박스의 name을 동일하게 지정해 주면 어느쪽을 선택하든 선택한 value가 넘어감
		var property = document.getElementById('members5').value;
		var show = document.getElementById('show1');
		if(property == "desc"){show.innerHTML = '<input type="date" name="buy1"/> ~ <input type="date" name="buy1_1"/>';}
		if(property == "asc"){show.innerHTML = '<input type="date" name="buy1"/> ~ <input type="date" name="buy1_1"/>';}
	}		
	function option6(){
		var property = document.getElementById('members6').value;
		var show = document.getElementById('show1');
		//maxlength로 최대 입력 자릿수 제한
		//onkeyup 이벤트로 숫자 입력시 바로 함수 작동하게 연결
		//if (property == "all"){show.innerHTML = '<input type="text" name="amount1" maxlength="15" onkeyup="inputNumFormat(this)"/> ~ <input type="text" name="amount1_1" maxlength="15" onkeyup="inputNumFormat(this)"/>';}
		if (property == "desc"){show.innerHTML = '<input type="text" name="amount1" maxlength="15" onkeyup="inputNumFormat(this)"/> ~ <input type="text" name="amount1_1" maxlength="15" onkeyup="inputNumFormat(this)"/>';}
		if (property == "asc"){show.innerHTML = '<input type="text" name="amount1" maxlength="15" onkeyup="inputNumFormat(this)"/> ~ <input type="text" name="amount1_1" maxlength="15" onkeyup="inputNumFormat(this)"/>';}
	}
	//text 박스에 숫자 입력시 3자리 마다 콤마가 찍히게 하는 함수
	function inputNumFormat(obj){
		obj.value = comma(uncomma(obj.value));
	}
	function comma(str){
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	function uncomma(str){
		str = "" + str.replace(/,/gi,'');
		return (new Number(str));
	}		
</script>
</html>