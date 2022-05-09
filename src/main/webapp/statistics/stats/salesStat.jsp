<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="team.project1.dto.*" %>
<%@ page import="team.project1.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매출 조회</title> 
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
		String select = request.getParameter("select");			
		String date1 = request.getParameter("date1");		
		String date2 = request.getParameter("date2");
		String gender = request.getParameter("gender");
		
		statsDAO dao = new statsDAO();

		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;
		String statsCount = dao.statsCount(date1,date2);		
		int count = Integer.parseInt(statsCount); 		
	%>	
		<table border="1" style="margin-left:auto; margin-right: auto;">
			<tr>
				<th>일자</th><th>주문건</th><th>취소건</th><th>매출</th><th>마진</th>
			</tr>
	<%		if(select.equals("1")){					
				ArrayList<statsDTO> list = dao.statsSearch(date1,date2,start,end);
				if(!date1.equals(null)&& !date2.equals(null) ){
					if(list.size() > 0){
						for (statsDTO dto : list){
							int sales = Integer.parseInt(dto.getSales());
							int purchase = Integer.parseInt(dto.getPurchase());
							int spending = Integer.parseInt(dto.getSpending());
							int result = sales - purchase - spending;
	%>
							<tr>
								<td><%=dto.getInputdate() %></td>
								<td></td>
								<td></td>
								<td><%=dto.getSales() %></td>
								<td><%=result %></td>					
							</tr>
	<%					}
					}else{							
						out.print("검색 결과가 없습니다");											
					}
				}
			}				
			//회원/비회원 매출 검색은.....
			//회원은 주문번호로 매출 검색하고...id가 null인 값의 총합 출력
			//비회원은 주문번호로 매출 검색하고...id가 null이 아닌 값의 총합 출력	
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
				<a href="salesStat.jsp?pageNum=<%=startPage - 10 %>&select=<%=select%>&date1=<%=date1%>&date2=<%=date2%>">[이전]</a>		
	<%		
			}
			for (int i = startPage; i <= endPage; i++){
	%>			
				<a href="salesStat.jsp?pageNum=<%=i %>&select=<%=select%>&date1=<%=date1%>&date2=<%=date2%>">[<%=i %>]</a>	
	<%		
			}
			if(endPage < pageCount){
	%>	
				<a href="salesStat.jsp?pageNum=<%=startPage + 10%>&select=<%=select%>&date1=<%=date1%>&date2=<%=date2%>">[다음]</a>
	<%		
			}	
		}
	%>
	</div>
</body>
</html>