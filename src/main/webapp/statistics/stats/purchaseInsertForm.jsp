<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="team.project1.dto.statsDTO" %>
<%@ page import="team.project1.dao.statsDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매입 입력</title>
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
		<form name="insert" action="purchaseInsertPro.jsp">
			<table border = "1" style = "width:300px">
				<tr>
					<td>날짜</td>
					<td><input type="date" name="inputdate"/></td>
				</tr>
				<tr>
					<td>상품</td>
					<td>
						<select name="pretext">
							<option>===선택===</option>
							<option value="5">상의</option>
							<option value="6">하의</option>
							<option value="7">신발</option>
							<option value="8">기타매입</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price" maxlength="15" onkeyup="inputNumFormat(this)"/></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text" name="quantity" maxlength="15" onkeyup="inputNumFormat(this)"/></td>
				</tr>
				<tr>
					<td>합계</td>
					<td><input type="text" name="purchase" maxlength="15" onkeyup="inputNumFormat(this)"/></td>
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