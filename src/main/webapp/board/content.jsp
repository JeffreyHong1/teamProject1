<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.project1.dto.bulletinDTO" %>
<%@ page import="team.project1.dao.bulletinDAO" %>
<head>	
	<title>비회원 글 읽기</title>
	<style>
		table.type09 {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 1.5;
		  margin-left: 100px;
		  margin-right: 100px;
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
	
		//문자로된 숫자를 Int로 변환
		int num = Integer.parseInt(request.getParameter("num"));
		bulletinDAO dao = new bulletinDAO();
		bulletinDTO dto = dao.readContent(num);
	%>

	<table border="1" class="type09">
		<tr>
			<td>글번호</td><td><%=dto.getNum() %></td>
			<td>작성자</td><td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<td>조회수</td><td><%=dto.getReadcount() %></td>
			<td>좋아요</td><td><%=dto.getGood() %></td>
		</tr>
		<tr>
			<td>제목</td><td colspan="3"><%=dto.getSubject() %></td>
		</tr>
		<tr>
			<td>내용</td><td colspan="3"><%=dto.getContent() %></td>
		</tr>
	</table>
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
		<input type="button" value="수정" onclick="window.location='updateForm.jsp?num=<%=dto.getNum()%>'"/>
		<input type="button" value="삭제" onclick="window.location='deleteForm.jsp?num=<%=dto.getNum()%>'"/>
		<input type="button" value="답글" onclick="window.location='writeForm.jsp?num=<%=dto.getNum()%>&ref=<%=dto.getRef()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'"/>
	</div>
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>
