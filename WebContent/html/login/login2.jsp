<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="../login/login.css">
	<script src="../join/jquery-3.6.4.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	window.Kakao.init("6b4a0907149b118d58fe6dae1dc2ebfe");
	
	/* Kakao.Auth.authorize({
		redirectUri : 'http://localhost:9000/cmjgames/html/main/index.html'
	}); */
	
	function kakaoLogin() {
		Kakao.Auth.login({
			
			scope:'profile_nickname, account_email, gender',
			success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url: '/v2/user/me', 
					success: res => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
					}
				});
			}
			
		});
	}
	
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }
	</script>
</head>
<body>
	
</body>
</html>