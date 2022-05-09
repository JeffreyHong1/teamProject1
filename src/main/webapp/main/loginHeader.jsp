<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		#header {
			font-weight: bold;
			font-size: 30px;
		}
		#wrapper {
			width: 100%;
			min-height: 100px;
			justify-content: space-between;
			align-item: center;
			display: flex;
		}
		#log {
			font-size: 15px;
		}
		#title {
			font-size: 40px;
			margin-left: 30px;
		}
		a {
			text-decoration: none;
		}
		li {
			margin-right: 20px;
			margin-left: 30px;
			list-style: none;			
		}
	</style>
</head>
<body>
<section id="header">
	<div id="wrapper">
	
		<div class="title"><i class="fas fa-kiss-wink-heart"><a href="/teamProject1/main/mallMain.jsp">ONBRAND</a></i></div>
		<ul style="display: flex; margin-right: 60px;">
			<li>
				<a href="/teamProject1/product/product.jsp?pclass=outer">outer  </a>
			</li>
			<li>
				<a href="/teamProject1/product/product.jsp?pclass=top">top  </a>
			</li>
			<li>
				<a href="/teamProject1/product/product.jsp?pclass=pants">pants</a>
			</li>
		</ul>
		<div class="log">
		<%
			String sid = (String)session.getAttribute("sid");
			if(sid.equals("admin")){
		%>
				<a href="/teamProject1/board/list.jsp" id="log">BOARD</a>
				<a href="/teamProject1/member/logout.jsp" id="log">LOGOUT</a>
				<a href="/teamProject1/statistics/addminMain.jsp" id="log">ADMINPAGE</a>
		<%	
			}else{
		%>
				<a href="/teamProject1/board/list.jsp" id="log">BOARD</a>
				<a href="/teamProject1/member/logout.jsp" id="log">LOGOUT</a>
				<a href="/teamProject1/member/mypageForm.jsp" id="log">MYPAGE</a>
				<a href="/teamProject1/order/memberCart.jsp" id="log">CART</a>
		<%	
			}
		%>
		</div>
		
	</div>
</section>
</body>
</html>