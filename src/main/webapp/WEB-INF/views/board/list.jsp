<!DOCTYPE HTML>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<head>
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=2" />
<style>
.count{
font-size: 70%;
color: #04B486 ;
font-weight: bold;
}
.search1 {
	text-align: center;
	/* display: flex;
    flex-wrap: wrap; 
    justify-content: center; 
    align-items: center; */
}

.outer {
	padding: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
}

.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
}

.center {
	text-align: center;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 5px;
	text-decoration: none;
}

.pagination a.active {
	background-color: pink;
	color: white;
}

.pagination a:hover:not (.active ){
	background-color: pink;
}

.search {
	width: 33%;
	margin-left: 33%;
}

.bno {
	font-size: 70%
}

.box {
	display: block;
	background-color: transparent;
	overflow: hidden;
	padding-right: 50px;
	white-space: nowrap;
	margin-bottom: 0;
}

.title {
	display: inline-block;
	overflow: hidden;
	max-width: 100%;
	text-decoration: none;
	text-overflow: ellipsis;
	vertical-align: middle;
}

.ico {
	display: inline-block;
	vertical-align: middle;
}

#selectbox {
	display: inline-block;
	width: 80%;
}
#header .logo .loginbtn{
float: right;
display: inline-block;
text-align: right;
}

.loginbtn{


}


</style>
</head>
<body class="subpage">
	<!--  -->
	<!-- Header -->
	<header id="header">
	
		<div class="logo">
			<div class="loginbtn">

<sec:authorize access="isAnonymous()">
	<form action="/myLogin">
	<button>login</button>
	
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
				<p>Sed amet nulla</p>
				<h2>Elements</h2>
			</header>
		</div>
	</section>
	<!-- Main -->
	<div id="main" class="container">

		<div class="outer">
			<!-- Table -->
			<h3>Table</h3>
			<div class="table-wrapper">
				<table style="table-layout: fixed;">
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: 45%;" />
						<col style="width: 25%;" />
						<col style="width: 25%;" />

					</colgroup>

					<thead>
					<tr>
						<th>Bno</th>
						<th>Title</th>
						<th style="text-align: right;">Writer</th>
						<th style="text-align: right;">Regdate</th>
						</tr>
					<tbody>

						<c:if test="${fn:length(list)==0 }">
							<tr>
								<td colspan="4" style="text-align: center">내용없음</td>
							</tr>
						</c:if>

						<c:forEach items="${list}" var="vo">
							<tr>
								<td class="bno"><c:out value="${vo.bno}" /></td>
								
								<td class="box" id="toread" data-bno="${vo.bno}">
								<span class="title"> <c:out value="${vo.title}" /></span>
								<span class="count">[<c:out value ="${vo.recnt }"></c:out>]</span>
								<span class="ico"> 	<c:if test="${vo.checkNew()}"><img src="/resources/images/new.jpg"></c:if></span>	</td>		

						
								<td style="text-align: right"> <c:out value="${vo.writer}" /></td>

								<td style="text-align: right"><c:if test="${vo.checkNew()}">
								<fmt:formatDate value="${vo.regdate}" pattern="HH:mm" /></c:if> 
								<c:if test="${!vo.checkNew()}">
								<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd" /></c:if>
								</td>
									</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4"><button class="button special fit" id="regbtn" style="float: right;">Register</button></td>

						</tr>
					</tfoot>
				</table>
			</div>
			<div class="center">
				<div class="pagination">
					<c:if test="${pm.prev}">
						<a href="/board/list ${cri.makeSearch(pm.start -1)}"><< </a>
					</c:if>
					<c:forEach begin="${pm.start}" end="${pm.end}" var="idx">
						<a href="/board/list${cri.makeSearch(idx)}"
							class='<c:if test="${pm.cri.page==idx}">active</c:if>'>${idx}</a>
					</c:forEach>
					
					<c:if test="${pm.next}">
						<a href="/board/list ${cri.makeSearch(pm.end+1)}">>></a>
					</c:if>
				</div>
			</div>

			<!--@@@검색@@@  -->
			<div class="search1">
				<div class="row uniform" id="selectbox">
					<div class="3u 12u$(small)">
						<div class="select-wrapper">
							<select name="type" id="category">
								<option value="n"<c:out value="${cri.type == 'n' ? 'selected' : '' }"></c:out>>--category--</option>
								<option value="t"<c:out value="${cri.type eq 't' ? 'selected' : '' }"/>>title</option>
								<option value="c"<c:out value="${cri.type eq 'c' ? 'selected' : '' }"/>>content</option>
								<option value="w"<c:out value="${cri.type eq 'w' ? 'selected' : '' }"/>>writer</option>
								<option value="tc"<c:out value="${cri.type eq 'tc' ? 'selected' : '' }"/>>title+content</option>
								<option value="tcw"<c:out value="${cri.type eq 'tcw' ? 'selected' : '' }"/>>title+content+writer</option>
							</select>
						</div>
					</div>

					<div class="6u 12u$(small)">
						<input type="text" name="keyword" id="query" value="${cri.keyword}" placeholder="search" />
					</div>

					<div class="3u 12u$(small)">
						<button id="search" value="Search" class="button special icon fa-search">Search</button>
					</div>
				</div>
				<!-- 검색end -->


			</div>
		</div>
	</div>
	


	<script src="https://code.jquery.com/jquery-3.3.1.min.js" 
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" 
	crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			$("#search").on("click",function(e) {
				console.log("clicked...............................");
				console.log(encodeURIComponent($('#keywordInput').val()));
				var type = $("#category")[0].value;
				var keyword = $('#query').val();

				if (type === 'n'|| keyword === '') {
					return;
				};
				self.location = "/board/list"+'${pm.makeQuery(1)}'+"&type="
								+ $("select option:selected").val()
								+ "&keyword="+ encodeURIComponent(keyword);
			});

			$("#regbtn").on("click",function(e) {
				console.log("clicked...........ssddddd............");
				self.location = "/board/register${cri.makeSearch(cri.page)}";

			});

			$(".box").on("click",function(e) {

				var bno = $(this).attr("data-bno");
				var link = '${cri.makeSearch(cri.page)}';

				self.location = "/board/read"+ link + "&bno=" + bno;
			});

			console.log("history:" + history.state);

			var msg = '<c:out value="${msg}"/>';

			if (msg == "success" && !history.state) {
				alert("등록이 완료되었습니다.");
				}
			if (msg == "fail" && !history.state) {
				alert("등록이 실패하였습니다. 내용을 똑바로 입력하세요.");
				}
			if (msg == "successRemove" && !history.state) {
				alert("삭제가 완료되었습니다.");
				}
			if (msg == "failRemove" && !history.state) {
				alert("삭제에 실패하였습니다.");
				}
			history.replaceState({}, null, null);

		});
	</script>




	<!--@@@검색@@@ -->

	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span	class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span	 class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
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
</body>
</html>