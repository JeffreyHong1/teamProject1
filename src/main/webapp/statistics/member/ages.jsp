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
	<title>연령별 검색</title>
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
		<%}
			String birth1 = request.getParameter("age1");
			String birth2 = request.getParameter("age2");	
			adminMemDAO dao = new adminMemDAO();
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null){
				pageNum = "1";
			}
			int pageSize = 10;
			int currentPage = Integer.parseInt(pageNum);
			int start = (currentPage - 1) * pageSize + 1;
			int end = currentPage * pageSize;
			String ageCount = dao.ageCount(birth1, birth2);
			int count = Integer.parseInt(ageCount);
			//나이 선택 셀렉트 박스를 동적으로 뿌려주기 구현하게 되면......
			//date 타입으로 입력 받은 생년월일을 나이로 변환하는 수식 추가 해야 함
		%>
			<table border="1" class="type09">
				<tr>
					<th>아이디</th><th>이름</th><th>전화번호</th><th>생년월일</th><th>이메일</th><th>주소</th><th>가입일</th>
				</tr>	
		<%
			String select = (String)request.getParameter("select");		 	
				if(select.equals("3")){		 				 	
					ArrayList<adminMemDTO> list = dao.ageSearch(birth1,birth2,start,end);	 	
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
		<%				
						}
					}else{
						out.print("검색 결과가 없습니다");
					}
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
					//&파라미터명=<%=변수명>...
		%>
					<br/>
					<a href="ages.jsp?pageNum=<%=startPage - 10 %>&select=<%=select%>&age1=<%=birth1%>&age2=<%=birth2%>">[이전]</a>		
		<%		}
				for (int i = startPage; i <= endPage; i++){
		%>			
					<a href="ages.jsp?pageNum=<%=i %>&select=<%=select%>&age1=<%=birth1%>&age2=<%=birth2%>">[<%=i %>]</a>	
		<%		}
				if(endPage < pageCount){
		%>
					<a href="ages.jsp?pageNum=<%=startPage + 10%>&select=<%=select%>&age1=<%=birth1%>&age2=<%=birth2%>">[다음]</a>
		<%	
				}	
			}
		%>
		</div>
</body>
</html>