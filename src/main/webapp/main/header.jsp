<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<style>
		#header{
			font-weight: bold;
			font-size: 30px;
		}
		#wrapper{
			width: 100%;
			min-height: 100px;
			justify-content: space-between;
			align-item: center;
			display: flex;
		}
		#log{
			margin-right: 5px;
			font-size: 15px;
		}
		#title{
			font-size: 40px;
			margin: auto;
		}
		a{
			text-decoration: none;
			color: black;
		}
	</style>
</head>
<body>
<!-- 한개의 페이지로 전부 연결하고.....a태그로 파라미터 받은 다음에.....쿼리문으로 내용을 달리해서 상품 목록 출력  -->
<section id="header">
	<div id="wrapper">
	
		<div class="title"><i class="fas fa-kiss-wink-heart"><a href="/teamProject1/main/mallMain.jsp">ONEBRAND</a></i></div>
		<ul style="display: flex;">
			<li style="margin-right: 30px; list-style: none;">
				<a href="/teamProject1/product/product.jsp?pclass=outer">outer    </a>
			</li>
			<li style="margin-left: 30px; margin-right: 30px; list-style: none;">
				<a href="/teamProject1/product/product.jsp?pclass=top">top    </a>
			</li>
			<li style="margin-left: 30px; list-style: none;">
				<a href="/teamProject1/product/product.jsp?pclass=pants">pants</a>
			</li>
		</ul>
		<div class="log">
			<a href="/teamProject1/board/list.jsp" id="log">BOARD</a>
			<a href="/teamProject1/member/loginForm.jsp" id="log">LOGIN</a>
			<a href="/teamProject1/member/signupForm.jsp" id="log">SIGNUP</a>
			<a href="/teamProject1/order/listcheck.jsp" id="log">GUESTOEDER</a>
		</div>
		
	</div>
</section>
</body>
</html>