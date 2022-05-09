<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="team.project1.dto.adminMemDTO" %>
<%@ page import="team.project1.dao.adminMemDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전체 회원 리스트</title>
	<style> 
		.list{
			bordercolor: #dda0dd;
		}
	</style> 
</head>
<body>

	<%

		if(session.getAttribute("sid") == null){
	%>
			<script type="text/javascript">
				alert("관리자 로그인 후 가능 합니다.")
				window.location="/teamProject1/main/mallMain.jsp";
			</script>
	<%
		}
		adminMemDAO dao = new adminMemDAO();
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null){
		//페이징 값이 없으면 1페이지를 보여줌
			pageNum = "1";
		}
		int pageSize = 10;
		//한페이지에 표시될 게시물의 숫자로 사용 할 변수
		int currentPage = Integer.parseInt(pageNum);
		int start = (currentPage - 1) * pageSize + 1;
		//페이징의 시작값(EX:1페이지의 시작은 1,2페이지의 시작은 11)
		int end = currentPage * pageSize; 
		//페이징의 마지막 값(EX:1페이지의 마지막은 10,2페이지의 마지막은 20)
		int count = dao.memAllCount();	
		
	%>
	<h2>총 회원 : <%=count %></h2>	
	<table border="1">
		<tr>
			<th>아이디</th><th>이름</th><th>전화번호</th><th>생년월일</th><th>이메일</th><th>주소</th><th>가입일</th>
		</tr>	
		<%	
			//전체 회원 조회
			ArrayList<adminMemDTO> list = dao.memAllList();
			if(list.size() > 0){
				for (adminMemDTO dto : list){
		%>
			<tr>
				<td><%=dto.getId() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getPhone() %></td>
				<td><%=dto.getBirth() %></td>
				<td><%=dto.getEmail() %></td>
				<td><%=dto.getAddr() %></td>
				<td><%=dto.getReg() %></td>
			</tr>		
		<%		}
			}			
		%>		
	</table>
	<div>
		<%
			if(count > 0){
				
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				int startPage = (int)(currentPage / 10)*10+1;
				int pageBlock = 10;
				int endPage = startPage + pageBlock - 1;
				if(endPage > pageCount){
					endPage = pageCount;
				}
				if(startPage > 10){
					//같은 페이지에서 검색결과 페이징 이동시 파라미터를 같이 보내줘야함
					//넘겨줄 파라미터는 getParameter 로 받은 name을 넘겨 줘야 함
		%>
					<br/>
					<a href="memberAllLis.jsp?pageNum=<%=startPage - 10 %>">[이전]</a>
		<%		
				}
				for (int i = startPage; i <= endPage; i++){
		%>
					<a href="memberAllList.jsp?pageNum=<%=i %>">[<%=i %>]</a>
		<%		
				}
				if(endPage < pageCount){
		%>	
					<a href="memberAllList.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
		<%		
				}
			}
		%>
	</div>
</body>
</html>