<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
	<body>
		 <%
		    String clientId = "JCfp3FUTHlk6ijhXgqn9";//애플리케이션 클라이언트 아이디값";
		    String redirectURI = URLEncoder.encode("http://14.39.239.87:localhost:8080/teamProject1/mallMain.jsp", "UTF-8");
		    SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		    apiURL += "&client_id=" + clientId;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&state=" + state;
		    session.setAttribute("state", state);
		 %>
		<ul>
			<li style="list-style:none;">
	  			<a href="<%=apiURL%>"><img height="40" width="150" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	  		</li>
		</ul>
	</body>
</html>