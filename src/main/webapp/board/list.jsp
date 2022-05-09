<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="team.project1.dto.bulletinDTO" %>
<%@ page import="team.project1.dao.bulletinDAO" %>
<%@ page import="java.sql.Timestamp" %>
<head>
	<title>게시판 목록</title>
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
	%>
	
	<%
		//페이지 처리
		String pageNum = request.getParameter("pageNum");	
		if(pageNum == null){
			pageNum="1";
		}
	
		int pageSize = 10;				//한페이지에 10개까지 출력
		int currentPage = Integer.parseInt(pageNum);
		int start = (currentPage -1) * pageSize + 1 ;
		int end = currentPage * pageSize;
		
		bulletinDAO dao = new bulletinDAO();
		int count = dao.boardCount();
		
	%>
	
	<table class="type09">
		<tr>
			<th>글번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th><th>좋아요</th>
		</tr>
	<%
		ArrayList<bulletinDTO> list = dao.boardList(start, end);
		if(list.size() > 0){
			for(bulletinDTO dto : list) {%>
			<tr>
				<th><%=dto.getNum() %></th>
				<th>
					<td><%=dto.getNum()%></td>
					<td>
					<%-- 답글일경우 앞에 --- 입력 댓글의 댓글 시 --- --- --%>
	<%					for(int i = 0 ; i < dto.getRe_level() ; i++){ %>
							---
	<%					}%>
						<a href="content.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject() %></a>
				</th>
					<th><%=dto.getWriter() %></th>
					<th><%=dto.getReg() %></th>
					<th><%=dto.getReadcount() %></th>
					<th><%=dto.getGood() %></th>
			</tr>
	<%		}
		}else{
	%>
			<tr><td>작성된 글이 없습니다.</td></tr>
	<%	} %>
	</table>
	<br/>
	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
	<%
		if(session.getAttribute("sid") != null){ %>
			<button type="button" class="btn btn-success" onclick="window.location='writeForm.jsp'">글쓰기</button>
			<button type="button" class="btn btn-success" onclick="window.location='myList.jsp'">내 글</button>
	<%
		}else{%>
			<button type="button" class="btn btn-success" onclick="window.location='/teamProject1/member/loginForm.jsp'">로그인후 글쓰기</button>
	<%	} %>
		<form action="search.jsp" method="post">
			<select name="column">
				<option value="writer">작성자</option>
				<option value="subject">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="search" />
			<input type="submit" name="검색" />
		</form>
		<div class="row">
			<div class="col">
				<ul class="pagination" style="justify-content:center;">
	<%
					if(count > 0){				
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
						int startPage = (int)(currentPage / 10)*10+1;
						int pageBlock=10;
						int endPage = startPage + pageBlock -1;
						if(endPage > pageCount){
							endPage = pageCount;
						}
						if(startPage > 10) { 
	%>
							<a href="list.jsp?pageNum=<%=startPage - 10 %>">[이전]</a>
	<%	
						} 
						for(int i = startPage ; i <= endPage ; i++) { %>
							<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	<%
						}
						if(endPage < pageCount){
	%>
							<a href="list.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
	<%
						}
					}
	%>
				</ul>
			</div>
		</div>
	</div>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>