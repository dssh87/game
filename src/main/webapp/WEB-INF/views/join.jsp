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

.actions{
float: right;
}


/* body {
	background-image: url(/resources/images/bg.jpg);
} */
</style>

<body class="subpage">

	<!-- Header -->
	<header id="header">
		<div class="logo">
			<a href="/board/list">Hielo <span>by TEMPLATED</span></a>
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
				<h1>almond candy anypang</h1>
				<P></P>
				<h2>LogIn Page</h2>
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

				<form action="/join" method="post">
					<div class="row uniform">
						<div class="4u 12u$(xsmall)"> 
						ID<input type="text" name = "mid" size="100%" id="checkid">
						</div>
						
						
						<div class="6u 12u$(xsmall)"> 
					    Name<input type="text" name = "mname">	
						</div>

						<div class="6u 12u$(xsmall)">
						PASSWORD<input type="text" name = "mpw">					
						</div>						
				
						<div class="6u 12u$(xsmall)">
						E-mail<input type="text" name = "email">		
						</div>	
						
						<div class="12u$">
							<ul class="actions">
								<button class="jbtn">join</button>								
								<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
							</ul>
						</div>
					</div>
				</form>
				
				
					<div class="2u 12u$(xsmall)">
						<button class="idCheck">ID CHECK</button>
					</div>
				
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
			var idck = 0;
			
			$(".idCheck").on("click", function(e) {
				console.log("idckeck....")
				
				var mid = $("#checkid").val();
				console.log("mid....", mid)
				
				$.ajax({
					
					type: 'post',
					data: mid,
					url: "/idcheck",
					headers: {
	               	     "Content-type": "application/json"
	               	 },
	               	 dataType: "text",
	               	 data: JSON.stringify(mid),
					success: function(mid){
						
						if(data.cnt > 0){
							alert("아이디가 존재합니다. 다른 아이디를 입력하세요.");
						}else{
							alert("사용가능한 아이디입니다.");
							
							idck = 1;
						}
					}
				});
			});
			
		});
				
	</script>
	
	
</body>
</html>