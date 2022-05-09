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
	
		String pnum = request.getParameter("pnum");
		OrderDAO dao = new OrderDAO();
		productDTO dto2 =dao.order2(pnum); 
		int quantity = Integer.parseInt(request.getParameter("quantity")); // guestorder 에서 quantity 를 받아와서 int 로 변경
		int lastPrice = dto2.getPrice() * quantity ; // 상품의 수량 * 상품의 가격
		int lastPriceDc = lastPrice+2500;
	%>

	<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<form name="order" action="guestOrderPro.jsp">
			<h1 align="center">주문결제</h1>
			<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
				<p>비회원 구매</p>
				<table class="type09">
					<tr>
						<td>Email</td>
						<td>
							<input type="email" name="gu_email" required />
						</td>
						<!-- 게스트의(비회원)정보를 입력  -->
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
							<input type="tel" name="gu_Phone" placeholder="- 를 제회하고 입력해주세요" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" required/>
						</td>
						<!-- 게스트의(비회원)정보를 입력  -->
					</tr>				
					<tr>
						<td>배송지</td>
						<td>
							<input type="text" id="sample6_postcode" placeholder="우편번호" name="gu_addr1" required /><br/>
							<!-- 다음API 주소를 입력받고 출력  -->
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" /><br>
							<input type="text" id="sample6_address" placeholder="주소" name="gu_addr2" required/><br>
							<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="gu_addr3" required/>
							<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="gu_addr4" required />
							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						</td>
					</tr>
				</table>
				<br />
				<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
				<p align="center">주문내역</p>
				<!--  상품의 정보를 받아와서 출력 -->
				<table class="type09">
					<tr>
						<td>
							<img src="/teamProject1/image/<%=dto2.getImg() %>" width="100%" height="100%" alt="상품정보가없습니다.">
							<input type="hidden" name="Img" value=<%=dto2.getImg() %>/>
						</td>
						<td>
							<table class="type09">
								<tr >
									<td>제품명</td>
									<td><%=dto2.getPname() %>
										<input type="hidden" name="pname" value=<%=dto2.getPname() %> /></td>
								</tr>
								<tr >
									<td>사이즈</td>
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
								<tr>
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
				<div style="width: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
					<p>이용약관</p>
					<input type="checkbox" name="info" id="selectall" value="selectall" onclick="selectAll();" />모두동의<br />
					<input type="checkbox" name="info" value="member2" required />쇼핑몰 이용약관 동의 <br />
					<input type="checkbox" name="info" value="member3" required/>비회원 구매시 개인정보 처리방침 동의 <br />
					<input type="checkbox" name="info" value="member4" required />배송정보제공방침 동의 <br />
					<input type="submit" value="주문결제" onclick="add();" />
				</div>
			</div>
		</form>
	</div>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					var addr = ''; 
					var extraAddr = ''; 
					if (data.userSelectedType === 'R') { 
						addr = data.roadAddress;
					} else { 
						addr = data.jibunAddress;
					}
					if(data.userSelectedType === 'R'){
						if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							extraAddr += data.bname;
						}
						if(data.buildingName !== '' && data.apartment === 'Y'){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						if(extraAddr !== ''){
							extraAddr = ' (' + extraAddr + ')';
						}
						document.getElementById("sample6_extraAddress").value = extraAddr;
					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
		}
		// 체크박스 전체선택 & 전체해제 
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
	
	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>