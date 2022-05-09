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
	<h1>Introduction</h1>
	<h3>얼마나 좋을까? 우리 체형에 맞는 패턴이라면,</h3> 
	<h3>세상에서 가장 좋은 소재라면</h3>
	<h3>우리 피부에 어울릴 색상이라면,</h3> 
	<h3>모두에게 부담없는 가격이라면,</h3>
	<h3>그래서 태어났습니다.</h3> 
	<h3>세계와 함께 입는 옷. [ONEBRAND] </h3>
	<br></br>
	<h2>Pattern</h2>
	<h3>패턴맞춤</h3>
	<h4>ONEBRAND 디자인 스튜디오의 대한민국 맞춤패턴을 바탕으로</h4>
	<h4>우리 체형에 가장 잘 맞는 옷을 만듭니다.</h4>
	<br></br>
	<h2>Material</h2>
	<h3>소재맞춤</h3>
	<h4>인도, 내몽고, 호주 등 좋은 소재가 있는 곳이면</h4>
	<h4>세계 어디든 달려가 직접 생산합니다.</h4>
	<br></br>
	<h2>Color</h2>
	<h3>색상맞춤</h3>
	<h4>컬러연구팀이 보유한 10만개의 패턴 중,</h4>
	<h4>우리 피부에 잘 어울리는 1000개만 엄선합니다.</h4>
	<br></br>
	<h2>Price</h2>
	<h3>가격맞춤</h3>
	<h4>입고 싶은 만큼 사고, 사고 싶은 만큼 사도</h4>
	<h4>부담 없는 국민 맞춤가격으로 선보입니다.</h4>
</div>
<jsp:include page="/main/sidebar.jsp"></jsp:include>
<jsp:include page="/main/footer.jsp" />