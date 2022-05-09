<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 입력</title>
	<style>
		table.type09 {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 1.5;
		  margin: auto;
		  padding: 100px;
		}
		table.type09 td {
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;
		  color: #369;
		}
		table.type09 tr {
		  width: 150px;
		  padding: 10px;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
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
	<%}%>
	<form action="productPro.jsp" method="post" enctype="multipart/form-data">
		<table class="type09">
			<tr>
				<td>상품이미지</td>
				<td><input type="file" name="img" /></td>
			</tr>
			<tr>
				<td>상품종류</td>
				<td>
					<select name="pclass">
						<option>선택</option>
						<option value='outer'>아우터</option>
						<option value='top'>상의</option>
						<option value='pants'>하의</option>
						<option disabled>신발</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>상품번호</td>
				<td><input type="text" name="pnum" /></td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td><input type="text" name="pname" /></td>
			</tr>
			<tr>
				<td>사이즈</td>
				<td>
					<select name="psize">
						<option>선택</option>
						<option>S</option>
						<option>M</option>
						<option>L</option>
						<option>XL</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" />원</td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="text" name="stock" /></td>
			</tr>
			<tr>
				<td>비고</td>
				<td><textarea cols="40" rows="10" name="thing"></textarea></td>
			</tr>
		</table>
		<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
			<input type="submit" value="입력" />
		</div>
	</form>
</body>
</html>