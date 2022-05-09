<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>헤더 버튼</title>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-WHHFD0BZC7"></script>
	<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'G-WHHFD0BZC7');
	</script>	
</head>
<body>
<SECTION class="header">
	<div style="width: 100%; height: 30px; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<input type="button" value="홈페이지" onclick="window.location='/teamProject1/main/mallMain.jsp'"/>
		<input type="button" value="회원관리" onclick="window.location='/teamProject1/statistics/member/member.jsp'"/>
		<input type="button" value="상품관리" onclick="window.location='/teamProject1/statistics/productStat/productStat.jsp'"/>
		<input type="button" value="주문관리" onclick="window.location='/teamProject1/statistics/orderStats/orderStat.jsp'"/>
		<input type="button" value="매출/매입/지출 관리" onclick="window.location='/teamProject1/statistics/stats/statistics.jsp'"/>
		<input type="button" value="게시판관리" onclick="window.location='/teamProject1/statistics/boardManage/boardManage.jsp'"/>
		<input type="button" value="방문자통계" onclick="location='https://analytics.google.com/analytics/web/?hl=ko&pli=1#/p313170656/reports/reportinghub?params=_u..nav%3Dmaui'"/>
		<input type="button" value="세무" onclick="location='https://erp.ssabu.net/fa/main.html?co_id=ssabutest'"/>
		 <!-- 절대 경로 이용 : 최상위 폴더 이름/상위 폴더 이름/해당 폴더 이름/파일명 -->
	 </div>
</SECTION>
</body>
</html>