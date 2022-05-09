<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 상태 와 로그아웃 상태를 구분하여 헤더 출력
	if(session.getAttribute("sid") == null){
%>
		<jsp:include page="/main/header.jsp"></jsp:include>
<%
	}else{
%>
		<jsp:include page="/main/loginHeader.jsp"></jsp:include>
<%	}
%>
<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
<h1>이용약관</h1>

<h4>여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.</h4>
<h4>여러분의 개인정보를 소중히 보호합니다.</h4>
<h4>서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.</h4>
<h4>부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.</h4>
<h4>ONEBRAND의 잘못은 ONEBRAND가 책임집니다.</h4>
<h4>서비스 중단 또는 변경 시 꼭 알려드리겠습니다.</h4>
<h4>여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.</h4>
</div>


<jsp:include page="/main/sidebar.jsp"></jsp:include>
<jsp:include page="/main/footer.jsp" />