<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<title>마이페이지</title>
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
		// 로그인 후 사용가능한 페이지에 다 있어야한다.
		if(session.getAttribute("sid") == null){ 
	%>
		<script>
			alert("로그인 후 사용가능합니다.");
			window.location="/teamProject1/main/mallMain.jsp";
		</script>
	<% 
		} 
	%>
	
	<%
		String sid = (String)session.getAttribute("sid");
	%>
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<h2>마이페이지</h2>
		<table border="1" class="type09">
			<tr>
				<td><input type="button" value="주문조회" onclick="window.location='/teamProject1/order/listcheck.jsp' "></td>
			</tr>
			<tr>
				<td><input type="button" value="장바구니" onclick="window.location='/teamProject1/order/memberCart.jsp' "></td>
			</tr>
			<tr>
				<td><input type="button" value="게시물관리" onclick="window.location='/teamProject1/board/myList.jsp' "></td>
			</tr>
			<tr>
				<td><input type="button" value="회원정보수정" onclick="window.location='updateForm.jsp' "></td>
			</tr>
			<tr>
				<td><input type="button" value="탈퇴" onclick="window.location='deleteForm.jsp' "></td>
			</tr>
		</table>
	</div>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>	
	<jsp:include page="/main/footer.jsp"></jsp:include>