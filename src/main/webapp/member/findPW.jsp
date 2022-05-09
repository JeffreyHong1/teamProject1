<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<title>비밀번호 찾기</title>
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

	<jsp:include page="/main/header.jsp"></jsp:include>
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<h2>비밀번호 찾기</h2>
	</div>
	<form action="newPW.jsp" method="post" name="findPW" onsubmit="return checkValue();">
		<table border="1" class="type09">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" placeholder = "이름 입력"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" placeholder = "아이디 입력"></td>
			</tr>
		</table>	
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
		<input type="submit" value="확인"  onClick="findPWcheck();">
	</div>
	</form>
	 
	<script> 
	 function checkValue() { 
		 	n = document.findPW.name.value.length;
			if (n < 1) {
			  alert("이름을 입력해주세요");
			  return;
			 }
			i = document.findPW.name.value;
			if (i == null) {
			  alert("아이디를 입력해주세요");
			  return;
			 }
		 }
	</script>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>