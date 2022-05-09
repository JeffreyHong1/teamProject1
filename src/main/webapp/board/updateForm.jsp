<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.project1.dto.bulletinDTO" %>
<%@ page import="team.project1.dao.bulletinDAO" %>
<head>
	<title>게시글 수정</title>
	<style>
		table.type09 {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 1.5;
		  margin-left: 100px;
		  margin-right: 100px;
		}
		table.type09 thead th {
		  padding: 50px;
		  font-weight: bold;
		  vertical-align: top;
		  color: #369;
		  border-bottom: 3px solid #036;
		}
		table.type09 tbody th {
		  width: 150px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;	
		  background: #f3f6f7;
		}
		table.type09 td {
		  width: 350px;
		  padding: 10px;
		  vertical-align: top;	
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

	//글 수정
	int num = Integer.parseInt(request.getParameter("num"));
	bulletinDAO dao = new bulletinDAO();
	bulletinDTO dto = dao.readContent(num);
%>
<form action="updatePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>" />
	<table border="1" class="type09">
		<tr>
			<td>작성자</td>
			<td><%=dto.getWriter()%></td>
		</tr>
		<tr>
			<td>제 목</td>
			<td><input type="text" name="subject" value="<%=dto.getSubject()%>" /></td>
		</tr>
		<tr>
			<td>내 용</td>
			<td><textarea rows="5" cols="40" name="content"><%=dto.getContent()%></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" /></td>
		</tr>
	</table>
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
		<input type="submit" value="수정하기" />
	</div>
</form>

<jsp:include page="/main/sidebar.jsp"></jsp:include>
<jsp:include page="/main/footer.jsp"></jsp:include>