<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css" />

<style>
.subpage {
	background: linear-gradient(120deg, #F5F4F5, #F5F4F5) fixed
}

.outer {
	padding-top: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
	width: 100%;
	
	
}

.mytable {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}
.container{
	width: 50%;
}

.actions{
float: right;
}

.midmid{
	width: 100%;
}

.mpwmid{
	width: 100%;
}

body div{
font-size: 13pt;
}

button{
height: 3rem;
}
/* body {
	background-image: url(/resources/images/bg.jpg);
} */
</style>

<body class="subpage">

	<!-- Header -->
	<header id="header">
		<div class="logo">
			<a href="/board/list">
			
			<i class="fa fa-truck" ></i>  foodtruck </a>
		
		</div>
		<a href="#menu">Menu</a>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="/board/list">Home</a></li>
			<li><a href="/up/ajax">Image gallery</a></li>
		</ul>
	</nav>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>WHAT DO YOU WANT TO EAT?</p>
				<h2>FOOD TRUCK</h2>
			</header>
		</div>
	</section>

<title>Insert title here</title>
</head>

	<!-- Main -->
	<div id="main" class="container">
		<div class="outer">
			<div class="mytable">
				<h3>Login</h3>

				<form action="/login" method="post">
					<div class="row uniform">
						<div class="midmid"> 
						ID<input type="text" name = "username">	
						</div>

						<div class="mpwmid">
						PASSWORD<input type="text" name = "password">					
						</div>

					<div class="6u 12u$(small)">
							<input type="checkbox" id="copy" name="remember-me">
						<label for="copy">remember-me</label>
						</div>
						<div class="12u$">
							<ul class="actions">
								<button class="lbtn">login</button>								
								<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
							</ul>
						</div>
					</div>
				</form>
				<hr/>
			</div>
		</div>
	</div>


<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span
						class="label">Email</span></a></li>
			</ul>
		</div>
		<div class="copyright">&copy; Untitled. All rights reserved.</div>
	</footer>

	<!-- Scripts -->
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery.scrollex.min.js"></script>
	<script src="/resources/js/skel.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<script src="/resources/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script>
	
		$(document).ready(function(e) {
			$(".actions").on("click", ".list", function(e) {
				self.location = "/board/list${cri.makeSearch(cri.page)}";
			});
			
			$(".lbtn").on("click", function(e) {
				self.location = "/index";
			});
			
			var error = "${error}"
				if(error == "true"){
					alert("아이디나 비밀번호를 확인하세요.");
				}
			
			var msg = '<c:out value="${msg}"/>';		

			if (msg == "join") {
				alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
				}

			
		});
				
	</script>
</body>
</html>