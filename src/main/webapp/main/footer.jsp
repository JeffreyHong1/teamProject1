<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.footer {
	    position: static;
	    left: 0;
	    bottom: 0;
	    width: 100%;
	  	padding: 15px 0;
	  	text-align: center;  	
	}
	a{
		text-decoration: none;
	}
</style>


<%-- div태그는 구역을 나눠주는 태그. --%>
<%-- ul태그는 순서가 있는 목록 만들때 사용. --%>
<%-- li태그는 순서가 필요 없는 목록 만들때 사용, 그냥 쓰면 앞에 점이생겨서 점 없애주려고 style="list-style:none 사용. --%>
<%-- a태그로 링크 걸어서 누르면 그 페이지로 가도록 함 --%>
<%-- p태그는 하나의 문단을 만들때 사용 --%>
<body>
	<div class="footer">
	<ul  style="list-style:none; text-align: center;">
			<li>
				<a href="/teamProject1/main/introduction.jsp">COMPANY</a> | 
				<a href="/teamProject1/main/privacy.jsp">PRIVACY POLICY</a> |
				<a href="/teamProject1/main/service.jsp">TERMS</a> <br />
				<h5>tel. 070-1234-5678 / email. ONEBRANDcompany@naver.com</h5>
				<h5>사업자번호 022-12-45678</h5>
				<h5>[04058] 서울특별시 마포구 신촌로 94 그랜드플라자 7층</h5>
				<h5>Copyright &copy; ONEBRAND Co. All Rights Reserved</h5>
			</li>
		</ul>
	</div>
</body>