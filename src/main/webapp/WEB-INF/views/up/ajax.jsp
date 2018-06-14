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
<link rel="stylesheet" href="/resources/css/main.css?ver=2" />
<style>


.realName {
	

    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal;
    max-width: 120px;
    overflow: hidden;
    display: inline-block
}


.pagination {
	display: inline-block;
	text-align: center;
}
.pagination li {
   display: inline;
            }
.pagination a {
	color: black;	
	padding: 8px 5px;
	text-decoration: none;
}

.pagination .active {
	background-color: yellowgreen;
	color: white;
}

.pagination a:hover:not (.active ){
	background-color: pink;
}
.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed;
	
}

.outer {
	padding-top: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
	min-height: 500px;
}


ul {
	padding: 0;
}

.uploadUL li {
	display: inline-block;
	margin: 10px 30px 30px 30px;
}

.pic{



}
.uploadUL li img {
	width: 150px;
	height: 150px;
	border:8px solid #9D7361;

border-radius : 10px;
        
padding:3px;
	
	/* border-bottom:3px solid #9D7361;
	border-style : dashed */
}



.uploadUL {
	width: 100%;
	text-align:center;

}

#bg {
	width: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	position: fixed;
	top: 0;
	left: 0;
	justify-content: center;
	align-items: center;
	z-index: 100;
}

#bg img {
	width: 300px;
	height: 300px;

}

.show {
	display: flex;
}

.hide {
	display: none;
}

 .pagination {
	display: inline-block;
	text-align: center;
}
.pagination{
        display: block;
        
        }
#uploadForm{
       float:left;
       overflow:hidden;
        }
#btn{
    text-align :center;
        }

.uploadStyle{
display: inline-block;
text-align:right;
margin: auto;



}
form{
margin: 0 auto;
width: 250px;}
        
        .xxx{
        float: right;
        margin-right:5px;
        color: #DC143C;}
        
        
        .nameTag{
        background: white;}


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
			<li><a href="/up/ajax">Image gallery</a></li>

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
	<div id="bg" class="hide">

</div>
<div class="outer">
	<span class="left" style="cusor: pointer;">hi</span>
	
	<span class="right" style="cusor: pointer;">hello</span>
	<ul class='uploadUL'></ul>
			
	<div class="pagination"></div>

	<center><div class="uploadStyle">
	<form id="uploadForm">
		<input type="file" id="upload"  multiple>
	</form>

	<button id='btn' class="button special icon fa-search">upload</button>

</div></center>

	</div>

<div id="bg" class="hide">
<div id = "inner" ></div>
</div>
	</div>



	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

	<script>
	
	
	$(document).ready(function(e) {

		var uploadUL = $(".uploadUL");
		var uploadInput = $("#upload");
		/* var wall = $("#wall"); */
		var w = document.documentElement.clientWidth;
    	var h = document.documentElement.scrollHeight;
    	var bg = $("#bg");
    

		showList(1);
		

		 var uploadPage = 1;

			 
		function showList(page) {

			uploadPage = page || 1;
			
			$.getJSON("/up/listdata/" +page + ".json",function(data) {
				
				console.log(data);
				console.log(page);
				var str = "";

				$(data.list).each(function(idx,data) {
					var fullName= data.uuid+"_"+data.fileName;
					console.log("fullNAmeeee",fullName);
						str += "<li data-file='"+fullName+"'><div class='pic'><img src='../display?file=s_"
								+fullName+ "'><br><div class='nameTag'><span class='realName'>"+data.fileName+"</span>"
								+"<span class='xxx'><small data-src="+data.uuid+">X</small></span></div></div></li>";
				})
				showReplyPage(uploadPage, data.uploadCnt);
				
				uploadUL.html(str);
			})

							}
		
		function checkImageType(fileName){
			var pattern = /jpg$|gif$|png$|jpeg/i;
			return fileName.match(pattern);
		}
		

		uploadUL.on("click", "small", function(e) {

			e.stopPropagation();
			console.log("--------------------");
			console.log(this);
			console.log($(this).attr("data-src"));

			console.log(uploadPage);
			if (confirm("삭제하시겠습니까?") == true) {

				var data = {uuid : $(this).attr("data-src")};
				console.log("delete:",data);

				$.ajax({
					url : "deleteFile",
					type : 'delete',
					data : data.uuid,
					dataType : "text",
					success : function(result) {
						if (result == 'deleted') {
							alert("deleted");
							showList(uploadPage);
						
											}
										}});
				} else {return;
				}
});
		

		uploadUL.on("click", "li", function(e) {

			console.log("li clicked");
		
			var fileName = $(this).data("file");

			var str = "<img src='../display?file="+ fileName + "'>";



	        bg.attr("style","height: " + h +"px;");
	        bg.attr("class","show");
	        bg.html(str);
	        
		});
		
		bg.on("click", function(e){

	        console.log("bg click");
	        
	        bg.attr("class","hide");
	        bg.removeAttr("style");


	    });
		
		$(".pagination").on("click", "a", function (e) {
	            e.preventDefault();
	            console.log("upload~~~");
	            uploadPage = $(this).attr("href");
				console.log("upload"+ uploadPage);
	            showList(uploadPage);

	      });

/* 		wall.html(str);
				wall.show('slow');

				

		wall.on("click", function(e) {
				wall.hide('slow');
				}); */

		$('#btn').on("click", function(e) {

				var formData = new FormData();
				var files = uploadInput[0].files;
				console.log("files가",files);
				console.log("uploadInput",uploadInput[0]);
				console.log("formData",formData)
			
					
				for (var i = 0; i < files.length; i++) {
					console.log("dddd",files[i])
					if(checkImageType(files[i].name)){

						formData.append("file", files[i]);
					}else{
						alert(files[i].name+"은 이미지가 아닙니다. 이미지를 똑바로 올리세요");
					}
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
										showList(1);
									}
								});
				
							});
				});

					
	</script>

<script type="text/javascript" src="/resources/js/pageMaker.js"></script>	

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