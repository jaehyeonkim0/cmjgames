<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findAccount</title>
<link rel="stylesheet" href="../login/login.css">
<script src="../join/jquery-3.6.4.min.js"></script>

<script>
	$(document).ready(function(){
		
		$("#tab-menu li").find("a").click(function(){
			location.href="FindPwd.jsp";
		});
		
		$("#button-gradient").click(function(){
			
			if($("input[name='name']").val()==""){
				alert("이름을 입력해주세요");
				$("input[name='name']").focus();
				return false;
			}else if($("input[name='phone']").val()==""){
				alert("휴대전화를 입력해주세요");
				$("input[name='phone']").focus();
				return false;
			}else {
				findIdForm.submit();
			}
		});
		
		$("input[name='name']").blur(function(){
			
			if($("input[name='name']").val()=="") {
				$("#msgName").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#msgName").css("display","none");
			}
			
		});
		
		$("input[name='phone']").blur(function(){
			
			if($("input[name='phone']").val()==""){
				$("#msgPhone").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#msgPhone").css("display","none");
			}
		});
		
		function phoneCheck(asValue){
			
		}
		
	})

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
	<section id="content-1"><!-- find-id -->
		<p id="intro">아이디/비밀번호 찾기</p>
			<div id="tab-content">
				<ul id="tab-menu">
					<li><a href="#" class="active">아이디 찾기</a></li>
					<li><a href="#">비밀번호 찾기</a></li>
				</ul>
				<div id="find-id">
					<form action="#" name="findIdForm" method="get">
						<ul>
							<li>
								<input type="text" id="input-common" name="name" placeholder="이름">
								<span id="msgName"></span>
							</li>
							<li>
								<input type="text" id="input-common" name="phone" placeholder="휴대전화">
								<span id="msgPhone"></span>
							</li>
							<li>
								<button type="button" id="button-gradient">아이디 찾기</button>
							</li>
						</ul>
					</form>
				</div>
			</div>
	</section>
	<footer>
		<iframe src="../main/footer.html"
			scrolling="no" width="100%" height="646px" frameborder="0"></iframe>
	</footer>
</body>
</html>