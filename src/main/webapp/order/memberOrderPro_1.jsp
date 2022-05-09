<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import = "team.project1.dao.OrderDAO" %>
<%@ page import = "team.project1.dto.FormDTO" %>
<%@ page import = "team.project1.dto.productDTO" %>
<head> 
	<title>주문결제</title>
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

		String id = (String)session.getAttribute("sid");
		String pnum = request.getParameter("pnum");
		OrderDAO dao = new OrderDAO();
		FormDTO dto = dao.order(id);
		productDTO dto2 =dao.order2(pnum); 
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int lastPrice = dto2.getPrice() * quantity ;
		int lastPriceDc = lastPrice+2500; 
	%>	
<body>
	<form name="order" action="memberOrderPro.jsp?pnum=<%=pnum %>">
		<h1 align="center">주문결제</h1>
		<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
			<p>회원구매</p>
			<table class="type09">
				<tr>
					<td>회원 아이디 </td>
					<td><%=dto.getId()%>
						<input type="hidden" name="id" value=<%=dto.getId() %> />
					</td>
				</tr>
				<tr>
					<td>고객명 </td>
					<td><%=dto.getName() %><input type="hidden" name="name" value="<%=dto.getName() %>" />
					</td>
					<!-- 회원의 아이디를 불러서 값을 출력 -->
				</tr>
				<tr>
					<td>전화번호 </td>
					<td><%=dto.getPhone2() %><input type="hidden" name="phone" value="<%=dto.getPhone2() %>" />
					</td>
					<!-- 회원의 전화번호를 불러서 값을 출력 -->
				</tr>
				<tr>
					<td>배송지 </td>
					<td><%=dto.getAddr() %><input type="hidden" name="addr" value="<%=dto.getAddr() %>" />
					</td>
					<!-- 주소를 불러와서 출력 -->
				</tr>
			</table>
			<br />
		<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
			<p align="center">주문내역</p>
			<!--  상품의 정보를 받아와서 출력 -->
			<table class="type09">
				<tr>
					<td>
						<img src="/teamProject1/image/<%=dto2.getImg() %>" width="100%" height="100%" alt="상품정보가없습니다.">
						<input type="hidden" name="img" value="<%=dto2.getImg() %>" />
					</td>
					<td>
						<table class="type09">
							<tr >
								<td>제품명 </td> 
								<td><%=dto2.getPname() %>
								<input type="hidden" name="pname" value=<%=dto2.getPname() %> /></td>								
							</tr>
							<tr >
								<td>사이즈 </td>
								<td><%=dto2.getPsize() %>
								<input type="hidden" name="psize" value=<%=dto2.getPsize() %> /></td>
							</tr>
							<tr >
								<td>판매가</td>
								<td><%=dto2.getPrice() %>
									<input type="hidden" name="price" value=<%=dto2.getPrice() %> /></td>
							</tr>
							<tr >
								<td>수량</td>
								<td><input type="number" name="quantity" value=<%=quantity %> /></td>
							</tr>
							<tr >
								<td>가격</td>
								<td><input type="text" name="lastPrice" value=<%=lastPrice %> /></td>
							</tr>
							<tr >
								<td>배송비</td>
								<td>2500</td>
							</tr>
							<tr >
								<td>결제금액</td>
								<td><input type="text" name="lastPriceDc" value=<%=lastPriceDc%> /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
			<p>이용약관</p>
			<!--  체크박스 전체선택 & 전체해제 -->
			<script>
				function selectAll(){
					if(document.getElementById("selectall").checked==true){
						var size = document.order.info.length;
						for(var i = 0 ; i < size ; i++){
							document.order.info[i].checked=true;
						}
					}
					if(document.getElementById("selectall").checked==false){
						var size = document.order.info.length;
						for(var i = 0 ; i < size ; i++){
							document.order.info[i].checked=false;
						}
					}
				}
			</script>
			<input type="checkbox" name="info" id="selectall" value="selectall" onclick="selectAll();" />모두동의<br /> <input type="checkbox" name="info" value="member2" required />쇼핑몰 이용약관 동의 <br />
			<input type="checkbox" name="info" value="member3" required/>비회원 구매시 개인정보 처리방침 동의 <br />
			<input type="checkbox" name="info" value="member4" required />배송정보 제공방침 동의 <br />
			<input type="submit" value="주문결제" />
		</div>
	</form>
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>
</body>
