<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<title>글 작성</title>
	<style>
		table.type09 {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 1.5;
		  margin-left: auto;
		  margin-right: auto;
		  margin-top: 100px;
		}
		table.type09 th {
		  padding: 50px;
		  font-weight: bold;
		  vertical-align: top;
		  color: #369;
		  border-bottom: 3px solid #036;
		}
		table.type09 tr {
		  width: 150px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		  background: #f3f6f7;
		}
		table.type09 td {
		  width: 350px;
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
	<%	}
	
		//답글일 시 글쓰기
		int num=0 , ref=0, re_step=0, re_level=0;
		if(request.getParameter("num") != null){
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
	%>
	
	<%-- 처음 글쓰기 --%>
	<form action="writePro.jsp" method="post" >
				<input type="hidden" name="num" value="<%=num %>" />
				<input type="hidden" name="ref" value="<%=ref %>" />
				<input type="hidden" name="re_step" value="<%=re_step %>" />
				<input type="hidden" name="re_level" value="<%=re_level %>" />
		<table border="1" class="type09">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" /></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td><input type="text" name="subject" /></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea rows="5" cols="40" name="content"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" /></td>
			</tr>
		</table>
		<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
			<input type="submit" value="저장" />
		</div>
	</form>

	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>