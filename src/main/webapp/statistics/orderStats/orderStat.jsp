<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 관리</title>
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
	<div class="menu" style="margin:auto; text-align: center;" >
		<form method="post" action="orderVariation.jsp" name="order">
			<table>
				<tr>
					<td>
						<select name="select" id="order" onchange="option()">
							<option value="0">==선택==</option>
							<option value="1">주문 상태별 조회</option>
							<option value="2" disabled>일자별 조회</option>
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
			<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
				<input type="submit" value="조회"/>
			</div>
		</form>
	</div>
</body>
  
<script type="text/javascript">
	function option (){ 
		//셀렉트 박스 값 가져와서 추가 선택 옵션 제공
		var property = document.getElementById('order').value;
		var show = document.getElementById('show');
		if(property == "1"){show.innerHTML = '<select name="mem" id="orders1" onchange="option1()"><option>==선택==</option><option value="all">전체</option><option value="member">회원</option><option value="nonmem">비회원</option></select>';}
		if(property == "2"){show.innerHTML = '<input type="date" name="date1"/>~<input type="date" name="date1_1"/>';}	
		if(property == "3"){show.innerHTML = '<select name="refund" id="orders3" onchange="option3()"><option>==선택==</option><option value="redate">일자별</option><option value="restatus">처리상태</option></select>';}
		if(property == "4"){show.innerHTML = '<select name="product" id="orders4" onchange="option4()"><option>==선택==</option><option value="남">남성</option><option value="여">여성</option></select>';}		
	}
	function option1(){
		var property = document.getElementById('orders1').value;
		var show = document.getElementById('show1');
		if(property == "all"){show.innerHTML = '<input type="checkbox" name="status" value="1"/>주문확인<input type="checkbox" name="status" value="2"/>발송준비<input type="checkbox" name="status" value="3"/>발송<input type="checkbox" name="status" value="4"/>배송중<input type="checkbox" name="status" value="5"/>배송완료<input type="checkbox" name="status" value="6"/>후기작성';}
		if(property == "member"){show.innerHTML = '<input type="checkbox" name="status" value="1"/>주문확인<input type="checkbox" name="status" value="2"/>발송준비<input type="checkbox" name="status" value="3"/>발송<input type="checkbox" name="status" value="4"/>배송중<input type="checkbox" name="status" value="5"/>배송완료<input type="checkbox" name="status" value="6"/>후기작성';}
		if(property == "nonmem"){show.innerHTML = '<input type="checkbox" name="status" value="1"/>주문확인<input type="checkbox" name="status" value="2"/>발송준비<input type="checkbox" name="status" value="3"/>발송<input type="checkbox" name="status" value="4"/>배송중<input type="checkbox" name="status" value="5"/>배송완료<input type="checkbox" name="status" value="6"/>후기작성';}
	}
	function option3(){
		var property = document.getElementById('orders3').value;
		var show = document.getElementById('show1');
		if(property == "redate"){show.innerHTML = '<input type="date" name="redate1"/> ~ <input type="date" name="redate1_1"/>';}
		if(property == "restatus"){show.innerHTML = '<input type="checkbox" name="restatus1" value="7"/>반품신청<input type="checkbox" name="restatus1" value="8"/>반품입고<input type="checkbox" name="restatus1" value="9"/>환불대기<input type="checkbox" name="restatus1" value="10"/>환불완료';}
	}
	function option4(){
		var property = document.getElementById('orders4').value;
		var show = document.getElementById('show1');
		if (property == "m"){show.innerHTML = '<select name="parts"><option>==선택==</option><option value="상의">상의</option><option value="하의">하의</option><option value="신발">신발</option></select>';}
		if (property == "f"){show.innerHTML = '<select name="parts"><option>==선택==</option><option value="상의">top</option><option value="하의">bottom</option><option value="신발">show</option></select>';}
	}
</script>
</html>