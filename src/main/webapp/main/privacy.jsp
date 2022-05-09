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
	<h1>개인정보처리방침</h1>
	
	<h4>1. 개인정보처리방침의 의의</h4>
	<h4>2. 수집하는 개인정보 (필수 안내사항)</h4>
	<h4>3. 수집한 개인정보의 이용 (필수 안내사항)</h4>
	<h4>4. 개인정보의 제공 및 위탁 (필수 안내사항)</h4>
	<h4>5. 개인정보의 파기 (필수 안내사항)</h4>
	<h4>6. 이용자 및 법정대리인의 권리와 행사 방법 (필수 안내사항)</h4>
	<h4>7. 개인정보보호를 위한 ONEBRAND의 노력 (필수 안내사항)</h4>
	<h4>8. 개인정보 보호책임자 및 담당자 안내 (필수 안내사항)</h4>
	<h4>9. 본 개인정보처리방침의 적용 범위</h4>
	<h4>10. 개정 전 고지 의무</h4>

	
</div>
<jsp:include page="/main/sidebar.jsp"></jsp:include>
<jsp:include page="/main/footer.jsp" />