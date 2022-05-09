<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<title>회원아이디 체크</title>
	<style>
		table.type09 {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 1.5;
		  margin: auto;
		}
		table.type09 th {
		  padding: 50px;
		  font-weight: bold;
		  vertical-align: auto;
		}
		table.type09 tr {
		  width: 150px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: auto;		 
		  background: #f3f6f7;
		}
		table.type09 td {
		  width: 350px;
		  padding: 10px;
		  vertical-align: auto;
		}
	</style>
</head>
	<%
		//로그인 상태 와 로그아웃 상태를 구분하여 헤더 출력
		if(session.getAttribute("sid") == null){
	%>
			<jsp:include page="/main/header.jsp"></jsp:include>
	<%
		}else{
	%>
			<jsp:include page="/main/loginHeader.jsp"></jsp:include>
	<%	
		}
	%>
	<!--  MyPage에서 주문조회버튼을 클릭시 이 페이지로 한번 검수 후 이동 -->
	<!--  주문조회를 눌렀을경우 이 페이즈를 통해 회원인지 아닌지를 판별후 회원일 경우 orderList 비회원의경우 guestorderList로 이동 -->
	<%
		String id = (String)session.getAttribute("sid");
		if(!(id==null)){%>
			<script>
				window.location = "memberOrderList.jsp"
			</script>
	<%
		}else{ 
	%>
		<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<p>주문할때 사용한 Email과 전화번호를 입력해주세요</p>
		</div>
		<form action = "listcheckPro.jsp" method = "post">
			<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
				<table class="type09">
					<tr>
						<td>Email</td>
						<td><input type = "email" name = "gu_email" /></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type = "tel" name = "gu_Phone" placeholder = "- 를 제회하고 입력해주세요" pattern = "[0-9]{3}[0-9]{4}[0-9]{4}" /></td>
					</tr>
				</table>
			</div>
			<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
				<input type = "submit" value = "조회"/>
			</div>
		</form>
	<% 
		} 
	%>
		
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>
