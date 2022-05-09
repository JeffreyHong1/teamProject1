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
	<title>구매 횟수로 검색</title>
	<style>
		table.type09 {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 1.5;
		  margin-left: 100px;
		  margin-right: 100px;
		  margin-top: 100px;
		}
		table.type09 tr {
		  padding: 50px;
		  font-weight: bold;
		  vertical-align: top;
		  color: #369;
		  border-bottom: 3px solid #036;
		}
		table.type09 th {
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
			String select = (String)request.getParameter("select");
			String sort = request.getParameter("member5");
			String buy1 = request.getParameter("buy1");
			String buy1_1 = request.getParameter("buy1_1");
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
			String memBuyCount = dao.memBuyCount(buy1, buy1_1);
			int count = Integer.parseInt(memBuyCount);	
		%>
		<table border="1" class="type09">
			<tr>
				<th>아이디</th><th>이름</th><th>전화번호</th><th>생년월일</th><th>이메일</th><th>주소</th><th>총 구매 횟수</th><th>가입일</th>
			</tr>
		<%	
			if(select.equals("5")){
				ArrayList<adminMemDTO> list = dao.buySearch(sort,buy1,buy1_1,start,end);
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
							<td><%=dto.getBuycount() %></td>
							<td><%=dto.getReg() %></td>
						</tr>
		<%				}
					}
			}else{
				out.print("검색 결과가 없습니다");
			}			
		%>
	</table>
	<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
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
					<a href="buy.jsp?pageNum=<%=startPage - 10 %>&select=<%=select%>&buy1=<%=buy1%>&buy1_1=<%=buy1_1%>&member5=<%=sort%>">[이전]</a>		
		<%		}
				for (int i = startPage; i <= endPage; i++){
		%>			
					<a href="buy.jsp?pageNum=<%=i %>&select=<%=select%>&buy1=<%=buy1%>&buy1_1=<%=buy1_1%>&member5=<%=sort%>">[<%=i %>]</a>	
		<%		}
				if(endPage < pageCount){
		%>	
					<a href="buy.jsp?pageNum=<%=startPage + 10%>&select=<%=select%>&buy1=<%=buy1%>&buy1_1=<%=buy1_1%>&member5=<%=sort%>">[다음]</a>
		<%		}	
			}
		%>
	</div>
</body>
</html>