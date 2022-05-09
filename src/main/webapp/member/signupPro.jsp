<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="team.project1.dto.FormDTO"%>
<%@ page import="team.project1.dao.FormDAO"%>
<head>
	<title>signupPro.jsp</title>
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
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		  background: #f3f6f7;
		}
		table.type09 td {
		  width: 250px;
		  padding: 10px;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		}		
	</style>
</head>
	<jsp:useBean id="signupForm" class="team.project1.dto.FormDTO"/>
	<jsp:setProperty property="*" name="signupForm"/>
	<jsp:useBean id="dao" class="team.project1.dao.FormDAO"/>

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
	 
	<%
		int result = dao.signup(signupForm);
	%>
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<% 
			if(result == 1){
		%>
		<h2>회원가입이 완료되었습니다.</h2>
		<% 
			}else{ 
		%>
			<script>
			alert("다시 확인해주세요.");
			history.go(-1);
			</script>
		<% 
			}
		%>
		
	</div>
	<form action="/teamProject1/main/mallMain.jsp" method="post">
		<table border="1" class="type09">
			<tr>
				<td>아이디</td>
				<td><%=signupForm.getId() %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=signupForm.getPw() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=signupForm.getName() %></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%=signupForm.getGender() %></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><%=signupForm.getPhone1() %><%=signupForm.getPhone2() %></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><%=signupForm.getBirth() %></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%=signupForm.getEmail1() %><%=signupForm.getEmail2() %></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><%=signupForm.getAddr5() %></td>
			</tr>
		</table>		
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
		<input type="submit" value="확인"/>
	</div>
	</form>

	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>