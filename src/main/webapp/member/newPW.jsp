<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<title>비밀번호 변경</title>
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
		
	<jsp:useBean id="dto" class="team.project1.dto.FormDTO" />
	<jsp:setProperty property="*" name="dto" />
	<jsp:useBean id="dao" class="team.project1.dao.FormDAO" />

	<jsp:include page="/main/header.jsp"></jsp:include>
	<%
		String id = request.getParameter("id");
	%>
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<h2>비밀번호 수정</h2>
	</div>
	<form action="newPWPro.jsp" method="post" name="PWupdate" onsubmit="return checkValue();">
		<input type="hidden" name="id" value="<%=id%>">
		<table border="1" class="type09">
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" ></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pw2" /></td>
			</tr>
		</table>
			<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
				<input type="submit" value="수정완료" />
			</div>
	</form>
	
	<script>
		function checkValue(){
			// [a-zA-z0-9] -> 영어 대소문자,숫자사용 / {5,10} -> 최소문자수5, 최대문자수10
			var pwptn = /^[a-zA-z0-9]{5,10}$/;
				
			if(!pwptn.test(document.PWupdate.pw.value)){
				alert("비밀번호는 5~10자리,숫자,영문자가 포함되어야합니다.");
				document.PWupdate.pw.value="";
				document.PWupdate.pw.focus();
				return false;
				}
			p1 = document.PWupdate.pw.value;
			p2 = document.PWupdate.pw2.value;
			if( p1 != p2  ){
				alert("pw가 일치하지 않습니다.");
				document.PWupdate.pw.focus();
				return false;
			}
		}
	</script>

	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>
			