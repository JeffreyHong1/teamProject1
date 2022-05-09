<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카카오 로그인</title>
</head>
	<body>
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<ul style="list-style:none;">
				<li onclick="kakaoLogin();">
		  	    	<a href="javascript:void(0)"><img src="/teamProject1/image/kakao_login_medium_narrow.png" width="150"/></a>
				</li>	
			</ul>
	
	<!-- 카카오 스크립트 -->
	<script>
		Kakao.init('9a4d4eff1520501b7a3b1f43d8f2191a'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		}	
	</script>
	</body>
</html>