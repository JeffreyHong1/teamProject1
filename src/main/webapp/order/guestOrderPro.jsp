<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id = "dto" class = "team.project1.dto.OrderDTO" />    
<jsp:useBean id = "dao" class = "team.project1.dao.OrderDAO" />    
<jsp:setProperty property = "*" name = "dto" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결제정보저장</title>
	<style>
      table.type09 {
        border-collapse: collapse;
        text-align: center;
        line-height: 1.5;
        margin: auto;
      }
      table.type09 th {
        padding: 50px;
        font-weight: bold;
        vertical-align: auto;
      }
      table.type09 tr {
        width: 150px;
        padding: 10px;
        font-weight: bold;
        vertical-align: auto;   
        background: #f3f6f7;
      }
      table.type09 td {
        width: 350px;
        padding: 10px;
        vertical-align: auto;
       
      }
   </style>
</head>
<body>
	<%
		//로그인 상태 와 로그아웃 상태를 구분하여 헤더 출력
		if(session.getAttribute("sid") == null){
	%>
			<jsp:include page="/main/header.jsp"></jsp:include>
	<%
		}else{
	%>
			<jsp:include page="/main/loginHeader.jsp"></jsp:include>
	<%	
		}

		int result = dao.orderBuy(dto);
	%>
	<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<h1 align = "center">구매 정보</h1>
	</div>
	<script>
		alert (" 결제가 완료되었습니다.")
	</script>
	<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<p align="center">비회원 구매 정보</p>
		<table class="type09">
			<tr>
				<td>Email</td>
				<td><%=dto.getGu_email() %></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=dto.getGu_Phone() %></td>
			</tr>
			<tr>
				<td>배송지</td>
				<td><%=dto.getGu_addr5() %></td>
			</tr>
		</table>
	</div>
	<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<p>상품정보</p>
		<table class="type09">
			<tr>
				<td>
					<img src="/teamProject1/image/<%=dto.getImg()%>" width="100%" height="100%">
				</td>
				<td>
					<table class="type09">
						<tr>
							<td>상품명 </td>
							<td><%=dto.getPname() %></td>
						</tr>
						<tr>
							<td>사이즈 </td>
							<td><%=dto.getPsize() %></td>
						</tr>
						<tr>
							<td>수량 </td>
							<td><%=dto.getQuantity() %></td>
						</tr>
						<tr>
							<td>판매가 </td>
							<td><%=dto.getPrice() %></td>
						</tr>
						<tr>
							<td>배송비 </td>
							<td>2500</td>
						</tr>
						<tr>
							<td>최종가격 </td>
							<td><%=dto.getLastPriceDc()%></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>
</body>
</html>
 
