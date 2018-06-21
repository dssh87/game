<!DOCTYPE HTML>
<!--
	Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css" />

<style>
.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
}

.outer {
	padding-top: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
}

.mytable {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}

/* body {
	background-image: url(/resources/images/bg.jpg);
} */
</style>
</head>
<body class="subpage">

	<!-- Header -->
	<header id="header">
	
		<div class="logo">
			<div class="loginbtn">

<sec:authorize access="isAnonymous()">
	<form action="/login" method="post">
	<button>login</button>
	<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
	</form>	
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<form action="/logout" method="post" ><sec:authentication property="principal" var="user"/>
	<strong>${user.username}</strong> 님 환영합니다
	<button>logout</button>
	<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
	</form>
</sec:authorize>


		 </div>
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
				<h1>select</h1>
				<P></P>
				<h2>select</h2>
			</header>
		</div>
	</section>

	<!-- Main -->
	<div id="main" class="container">
		<div class="outer">
			<div class="mytable">
				<h3>form</h3>

				<form method="post" action="register">
					<div class="row uniform">
						<div class="6u 12u$(xsmall)">
							<input type="text" name="title" id="name" value="제목"
								placeholder="title" />
						</div>

						<div class="6u 12u$(xsmall)">
							<input type="text" name="writer" id="writer" value='<sec:authentication property="principal.username"/>' 
							readonly="readonly"	placeholder="writer" />
							
						</div>

						<div class="12u$">
							<textarea name="content" id="message"
								placeholder="Enter your message" rows="20"></textarea>
						</div>
						<div class="12u$">
							<ul class="actions">
								<li><input type="button" class="special list" value="List"></li>
								<li><input type="submit" class="special list" value="Register"></li>
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
		});
		
	</script>
</body>
</html>