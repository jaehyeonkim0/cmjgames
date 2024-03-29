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
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		$(document).ready(function(){
			
			$("#button-gradient").click(function(){
				
				if($("input[name='id']").val()=="") {
					alert("아이디를 입력해주세요");
					$("input[name='id']").focus();
					return false;
				}else if($("input[name='pwd']").val()=="") {
					alert("비밀번호를 입력해주세요");
					$("input[name='pwd']").focus();
					return false;
				}else{
					loginForm.submit();
				}
			});
			
			$("input[name='id']").blur(function(){
				
				if($("input[name='id']").val()=="") {
					$("#msgId").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
				}else {
					$("#msgId").css("display","none");
				}
				
			});
			
			$("input[name='pwd']").blur(function(){
				
				if($("input[name='pwd']").val()==""){
					$("#msgPwd").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
				}else {
					$("#msgPwd").css("display","none");
				}
			});
			
			$("#kakaoLogin").click(function(){
				
				location.href="http://localhost:9000/cmjgames/html/login/login2.jsp";
			});
			
		});
	</script>
	<script>
	
	window.Kakao.init("6b4a0907149b118d58fe6dae1dc2ebfe");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			
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
	<header>
		<iframe src="../main/header.html"
			scrolling="no" width="100%" height="227px" frameborder="0"></iframe>
	</header>
	<section id="top-bg">
		<div id="base-layer">
			<div id="top-bg-textarea">
				<p id="top-title">Login</p>
				<p id="top-subtitle">#로그인</p>
			</div>
		</div>
	</section>
	<section id="content-1"><!-- login-content -->
		<p id="intro">로그인</p>
		<form action="#" name="loginForm" method="get">
			<div>
				<ul>
					<li>
						<input type="text" id="input-common" name="id" placeholder="아이디">
						<span id="msgId"></span>
					</li>
					<li>
						<input type="password" id="input-common" name="pwd" placeholder="비밀번호" size="15">
						<span id="msgPwd"></span>
					</li>
					<li>
						<button type="button" id="button-gradient">LOGIN</button>
					</li>
				</ul>
				<ul id="link-tab">
					<li>
						<a href="../findAccount/FindId.jsp" id="link-find">아이디 찾기</a>
						<a href="../findAccount/FindPwd.jsp" id="link-find-pwd">비밀번호 찾기</a>
						<a href="../join/join.jsp" target="_parent" id="link-signUp">
							<span>Sign Up</span></a>
					</li>
				</ul>
			</div>
		</form>
		<div>
			<a href="javascript:kakaoLogin();">
			<img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height: 40px; width: auto; display: block; margin: auto; padding: 10px 0;">
			</a>
			<a href="javascript:kakaoLogout();">로그아웃</a>
		</div>
	</section>
	<footer>
		<iframe src="../main/footer.html"
			scrolling="no" width="100%" height="646px" frameborder="0"></iframe>
	</footer>
</body>
</html>