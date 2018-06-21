<!DOCTYPE HTML>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=1" />
<style>
.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
}

.outer {
	padding-top: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
}

ul {
	padding: 0;
}

li {
	display: inline-block;
}

.uploadUL li img {
	width: 100px;
	height: 100px;
}

#wall {
	width: 100%;
	height: 600px;
	/*  border: 1px solid red; */
	/*  background-color: gray; */
	position: absolute;
	display: none;
	z-index: 100;
	justify-content: center;
	align-items: center;
}
</style>
</head>

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

		</ul>
	</nav>
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Sed amet nulla</p>
				<h2>Candy</h2>
			</header>
		</div>
	</section>
	<!-- Main -->

	<div id="main" class="container">
		<div class="outer">

			<ul class='uploadUL'>
			</ul>
	
			<form id="uploadForm">
				<input type='file' id='upload' multiple>
			</form>
			<button id='btn'>upload</button>
		</div>

		
		<div id='wall'>
		</div>

	</div>



	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

	<script>
		$(document)
				.ready(
						function(e) {

							var uploadUL = $(".uploadUL");
							var uploadInput = $("#upload");
							var wall = $("#wall");

							showList();

							function showList() {

								$
										.getJSON(
												"/up/listdata" + ".json",
												function(data) {
													console.log(data);
													var str = "";

													$(data)
															.each(
																	function(
																			idx,
																			data) {
																		str += "<li data-file='"+data.fullName+"'><img src='../display?file=s_"
																				+ data.fullName
																				+ "'><small data-src="+data.fullName+">X</small></li>";
																	})
													uploadUL.html(str);
												})

							}

							uploadUL.on("click", "small", function(e) {
								
							e.stopPropagation();
								console.log("--------------------");
								console.log(this);
								console.log($(this).attr("data-src"));

							
								if(confirm("삭제하시겠습니까?")==true){
								
									var data = {
											fullName : $(this).attr("data-src")
										};

										$.ajax({
											url : "deleteFile",
											type : 'delete',
											data : data.fullName,
											dataType : "text",
											success : function(result) {
												if (result == 'deleted') {
													alert("deleted");
													showList();
													wall.hide('slow');
												}
											}

										});
										
								}else{
									
										return ;									
								}

						});

							uploadUL.on("click", "li", function(e) {

								console.log("li clicked");
								//$(this).attr("data-file")
								var fileName = $(this).data("file");

								var str = "<img src='../display?file=" + fileName
										+ "'>";

								wall.html(str);
								wall.show('slow');

							});

							wall.on("click", function(e) {
								wall.hide('slow');

							});

							$('#btn').on("click", function(e) {

								var formData = new FormData();
								var files = uploadInput[0].files;

								for (var i = 0; i < files.length; i++) {
									formData.append("file", files[i]);
								}
								$.ajax({
									url : '/up/ajax',
									data : formData,
									processData : false,
									contentType : false,
									type : 'POST',
									success : function(data) {
										console.log(data);
										$("#uploadForm")[0].reset();
										showList();
									}
								});
							});

						});
	</script>


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
		<div class="copyright">Untitled. All rights reserved.</div>
	</footer>
	<!-- Scripts -->
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery.scrollex.min.js"></script>
	<script src="/resources/js/skel.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<script src="/resources/js/main.js"></script>
</body>
</html>