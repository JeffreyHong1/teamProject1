<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<title>아이디 찾기</title>
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
		<h2>아이디 찾기</h2>
	</div>
	<form action="findIDcheck.jsp" method="post" name="findID" onsubmit="return checkValue();">
		<table border="1" class="type09">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" placeholder = "이름 입력"></td>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone2" placeholder = "01000000000 입력"></td>
			</tr>
		</table>
		<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
				<input type="submit" value="확인"  onClick="findIDcheck();">
		</div>
	</form>
	 
	<script> 
	 function checkValue() { 
		 	n = document.findID.name.value.length;
			if (n < 1) {
			  alert("이름을 입력해주세요");
			  return;
			 }
			ph = document.findID.phone.value.length;
			if(ph != 11){
				alert("연락처를 입력해주세요.");
				document.SignUp.phone2.focus();
				return false;
			}
		}
	</script>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>