<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.project1.dao.productDAO" %>
<%@ page import="team.project1.dto.productDTO" %>
<head>
	<title>로그인</title>
	<style>
		table.type09 {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 1.5;
		  margin-left: auto;
		  margin-right: auto;
		}	
		table.type09 tr {
		  width: 50px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: auto;		 
		  background: #f3f6f7;
		}
		table.type09 td {
		  width: 250px;
		  padding: 10px;
		  vertical-align: auto;		 
		}
	</style>
</head>
	<jsp:useBean id="dto" class="team.project1.dto.FormDTO" />
	<jsp:setProperty property="*" name="dto" />
	<jsp:useBean id="dao" class="team.project1.dao.FormDAO" />

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

	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<h2>로그인</h2>
	</div>
	<form action="loginPro.jsp" method="post" name="login" onsubmit="return checkValue();">
		<table class="type09">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" ></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" ></td>
			</tr>
		</table>
		<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
			<input type="submit" value="로그인" />
			<input type="button" value="아이디찾기" onclick="window.location='findID.jsp'"/>
			<input type="button" value="비밀번호찾기" onclick="window.location='findPW.jsp'"/>
		</div>
	</form>
	<!-- 네이버,카카오,구글 로그인 -->
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">	
		<jsp:include page="naverlogin.jsp"></jsp:include>
		<jsp:include page="kakaoLogin.jsp"></jsp:include>
		<jsp:include page="googleLogin.jsp"></jsp:include>
	</div>
	<script>
		function checkValue(){
			i = document.login.id.value;
			if(i == ""){
				alert("id를 입력하세요.");
				document.login.id.focus();
				return false;
			}
			p = document.login.pw.value;
			if(p == ""){
				alert("pw를 입력하세요.");
				document.login.pw.focus();
				return false;
			}
		}
	</script>

	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>