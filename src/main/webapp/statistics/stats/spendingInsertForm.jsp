<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>지출 입력 폼</title>
	<style >
		#divPosition{
				border:1px solid #5D5D5D;
				position:absolute;
				margin:-150px 0px 0px -200px;
				top:50%;
				left:50%;
				padding:5px;
				}
		div { border:1px solid; padding:10px}
		
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
	<div id = "divPosition">
		<form name="insert" action="spendingInsertPro.jsp" method="post">
			<table border = "1" style = "width:300px">
				<tr>
					<td>날짜</td>
					<td><input type="date" name="inputdate"/></td>
				</tr>
				<tr>
					<td>지출 분류</td>
					<td>
						<select name="pretext">
							<option>===선택===</option>
							<option value="1">고정지출</option>
							<option value="2">비정규지출</option>
							<option value="3">세금</option>
							<option value="4">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>금액</td>
					<td><input type="text" name="spending" maxlength="15" onkeyup="inputNumFormat(this)"/></td>
				</tr>												
			</table><input type="submit" value="입력"/>		
		</form>
	</div>
</body>
<script type="text/javascript">
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