<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="team.project1.dto.bulletinDTO" %>
<%@ page import="team.project1.dao.bulletinDAO" %>
<%@ page import="java.sql.Timestamp" %>
<head>
	<title>게시글 검색</title>
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
	
		String column = request.getParameter("column");
		String search = request.getParameter("search");
		
		bulletinDAO dao = new bulletinDAO();
		ArrayList<bulletinDTO> list = dao.search(column, search);
	%>
	<div class="container">
		<table class="table">
				<tr>
					<th>글번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th><th>좋아요</th>
				</tr>

	<%
		if(list.size() > 0){
			for(bulletinDTO dto : list){ %>
				<tr>
					<td><%=dto.getNum()%></td>
					<td>
	<%					for(int i = 0 ; i < dto.getRe_level(); i++){ %>
							---
	<%					}%>
						<a href="content.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject()%></a>
	<%					if(dto.getReadcount() >= 20){%>
							<img src="/teamProject1/image/hot.gif" >
	<%					} %>
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