<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="team.project1.dto.bulletinDTO" %>
<%@ page import="team.project1.dao.bulletinDAO" %>
<%@ page import="java.sql.Timestamp" %>
<head>
	<title>내글 목록</title>
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
		String id = (String)session.getAttribute("sid");
		
		bulletinDAO dao = new bulletinDAO();
		ArrayList<bulletinDTO> list = dao.myList(id);
	%>
	<div >
		<h2>글목록(전체글 : <%=list.size()%>) </h2>	
	<table class="type09">		
			<tr>
				<th>글번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th><th>좋아요</th>
			</tr>
	<%
		if(list.size() > 0){
			for(bulletinDTO dto : list){ %>
				<tr>
					<td><%=dto.getNum()%></td>
					<td>
						<%for(int i = 0 ; i < dto.getRe_level(); i++){ %>
							---
						<%}%>
							<a href="content.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject()%></a>
						<%if(dto.getReadcount() >= 20){%>
							<img src="/web/image/hot.gif" >
						<%} %>
					</td>
					<td><%=dto.getWriter()%></td>
					<td><%=dto.getReg()%></td>
					<td><%=dto.getReadcount()%></td>
					<td><%=dto.getGood()%></td>
				</tr>
	<%		}
		}else{
	%>		<tr><td>작성된 글이 없습니다..</td></tr>
	<%	}	%>
	</table>
	</div>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>