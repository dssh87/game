<!DOCTYPE HTML>
<!--
    Hielo by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>

<meta name="csrf-token" content="{{ csrf_token() }}">

<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=1" />
<style>
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
.contentbox {
	min-height: 500px;
}

.mytable {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}

.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
}

.outer {
	padding-top: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
}
 .listDiv li {
            list-style-type: none;

        }
        ul {
            display: inline;
            padding: 0;
        }
        

 .pagination {
	display: inline-block;
	text-align: center;
}
.pagination{
        display: block;
        
        }        

        p {
            color: #000;
        }
        .mask {
            width: 100%;
            height: 100%;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 10;
            background: #000;
            opacity: .5;
            filter: alpha(opacity=50);
        }
        #modalLayer {
            display: none;
            position: relative;
        }
        #modalLayer .modalContent {
            width: 440px;
            height: 200px;
            padding: 20px;
            border: 1px solid #ccc;
            position: fixed;
            left: 50%;
            top: 50%;
            z-index: 11;
            background: #fff;
        }
        #modalLayer .modalContent .closebtn {
            position: absolute;
            right: 0;
            top: 0;
            cursor: pointer;
        }

        #datestyle{
        font-size: 80%;
        text-align: right;
        }
        .dbtn{

        text-align: right;
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
		<div class="outer">
			<div class="mytable">
				<div class="table-wrapper">
					<h3>View</h3>
					<table class="alt">
						<thead>
							<tr>
								<th>No.<c:out value="${vo.bno}" /></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2"><strong><c:out value="${vo.title}" /></strong></td>
							</tr>
							<tr>
								<td style="border-right: hidden; border-left: hidden;">Writer:
									<c:out value="${vo.writer}" />
								</td>
								<td width=50% style="text-align: right; border-right: hidden;">
									작성일 <fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm" />
									<div class="12u$">
										수정일 <fmt:formatDate value="${vo.updatedate}" pattern="yyyy-MM-dd HH:mm" />
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="contentbox">
										<c:out value="${vo.content}" />
									</div>
								</td>
							</tr>
						</tbody>

					</table>
					<div class="12u$">

						<ul class="actions">
							<li><input type="button" class="special list" value="List"></li>
							<li><input type="button" class="special modify"
								data-bno="${vo.bno}" value="Modify" /></li>
							<li><input type="button" class="special remove" value="Remove" /></li>
						</ul>
					</div>
					<div class="wrapper">
    <div class="inputDiv"><h1>여러분의 소중한 댓글은 글쓴이에게 힘이 됩니다.</h1>
        <div><label style="text-align: left">댓글내용:</label><input type="text" name="content"/></div>
        <div><label style="text-align: left">댓글쓴이:</label><input type="text" name="replyer" 
        			value='<sec:authentication property="principal.username"/>'	readonly="readonly" 
        			placeholder='<sec:authentication property="principal.username"/>' /></div>
        
        <div>
            <button class="rbtn" data-type="register">Register</button>
            
        </div>
    </div>

    <div class="listDiv">

    </div>
    <div class="pagination">

</div>
</div>

				</div>
				
			</div>
			
		</div>
	</div>
	
	<div id="modalLayer"><div class="mask"></div>
    <div class="modalContent">
        <button class="closebtn">닫기</button>

        <div style="text-align: center;">
            <label style="text-align: left">댓글내용:</label><input type="text" name="modalContent">
            <label style="text-align: left">댓글쓴이:</label><input type="text" name="modalReplyer">
        </div>
        <div style="text-align: center;">
            <button class="mbtn">수정</button>
            

        </div>
    </div>
</div>
	<form role="form" action="remove" method="post">
		<input type="hidden" name="bno" value="${vo.bno}">

	<input type="hidden" name="keyword" value="${cri.keyword}">
			 <input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="type" value="${cri.type}">  
			
	</form>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

	<script>
		
 
		$(document).ready(function(e) {
					
		    	/* 목록가기 */
					$(".actions").on("click",".list", function(e) {
						self.location="/board/list${cri.makeSearch(cri.page)}";
					});
					
				/* 삭제  */
					var formObj = $("form[role='form']");
				
					$(".actions").on("click",".remove", function(e) {
						formObj.submit();
					});
					
				/* 수정  */
					$(".actions").on("click",".modify", function(e) {
						var bno = $(this).attr("data-bno");
						self.location="/board/modify${cri.makeSearch(cri.page)}&bno="+bno;
					});
					
					var msg = '<c:out value="${msg}"/>';
                    
                    if(msg=="success" && !history.state){
                        alert("수정이 완료되었습니다.");
                    	}
                    if(msg=="fail" && !history.state){
                        alert("수정 실패하였습니다. 내용을 똑바로 입력하세요.");
                    	}
                    history.replaceState({}, null, null);
                 
                });

		
	</script>
<script>
    $(document).ready(function () {
        var inputContent = $("input[name='content']");
        var inputReplyer = $("input[name='replyer']");
        var modifyContent = $("input[name='modalContent']");
        var modifyReplyer = $("input[name='modalReplyer']");

        var rbtn = $(".rbtn");
        var mbtn = $(".mbtn");
        var dbtn = $(".dbtn");
        var listUL = $(".listDiv");
        var bno = ${vo.bno};
        var replyPage = 1;

        var csrfToken = "${_csrf.token}";

        function setCsrf(token){
        	
        	$.ajaxSetup({
                headers:
                { 'X-CSRF-TOKEN':token }
            });
        	
        }
        
        
        function loadList(bno, page) {
           replyPage = page || 1;
            /* var bno = bno || 1; */
            $.getJSON("/replies/list/" + bno + "/" + page + ".json", function (data) {
                console.log(data.replyCnt);
                console.log(data.list);
                var str = "";
                $(data.list).each(function (idx, data) {
                    var regdate = new Date(data.regdate);
                    str += "<li>" + "<span data-rno = '" + data.rno + "'>"+"글쓴이: " +data.replyer+ "<br>"+"내용: "
                         + data.rcontent + "</span></li>"+"<div id=datestyle><span id=modibtn data-rno = '" + data.rno + "'><a>수정</a></span>"+
                         "&nbsp&nbsp"+"<a class=dbtn data-rno = '" + data.rno + "'>삭제</a> "+"날짜 :   " + formatDate(regdate) + "</div><hr>"
                });
                listUL.html("<hr>"+str);
                showReplyPage(replyPage, data.replyCnt);
                console.log("로드리스트 페이지는"+replyPage);
            })
        }
        loadList(bno, 1);

        function saveReplies() {

        	console.log("inputval"+inputContent.val());
        	if(inputContent.val()!="" || inputReplyer.val()!=""){
        		var data = {bno: bno, rcontent: inputContent.val(), replyer: inputReplyer.val()};
        	
        		setCsrf(csrfToken);
        		
            	$.ajax({
               	 type: 'post',
               	 url: "/replies/new",
               	 headers: {
               	     "Content-type": "application/json"
               	 },
               	 dataType: "text",
               	 data: JSON.stringify(data),
               	 success: function (result) {
               	     console.log("result: " + result);
                     loadList(bno, 1);
                     alert("등록이 완료되었습니다.");
                     inputContent.val("");
                     
                }               
            });        		
        	}else {
        		alert("내용을 똑바로 입력하세요 ㅡ_ㅡ!!");
        	}            
            console.log("세이브리플 페이지는"+replyPage);
        }

        function readReplies(rno, page) {

            $.getJSON("/replies/" + rno + ".json", function (data) {
                console.log(data);
				var replyPage = page;
                modifyContent.val(data.rcontent);
                modifyReplyer.val(data.replyer);
                mbtn.attr("data-rno", rno);
                dbtn.attr("data-rno", rno);
            });
            console.log("리드 리플 페이지는"+replyPage);
        }

        function modifyReplies() {
            var rno = mbtn.attr("data-rno");
            var data = {rcontent: modifyContent.val(), replyer: modifyReplyer.val()};
            
            setCsrf(csrfToken);
            
            $.ajax({
                type: 'put',
                url: "/replies/" + rno,
                headers: {
                    "Content-type": "application/json"
                },
                dataType: "text",
                data: JSON.stringify(data),
                success: function (result) {
                    console.log("result: " + result);
                    console.dir("수정 페이지는"+replyPage);
                    loadList(bno, replyPage);
                    modalLayer.fadeOut("slow");
                }
            });
        }

        function deleteReplies(rno) {
            $.ajax({
                type: 'delete',
                url: "/replies/" + rno,
                headers: {
                    "Content-type": "application/json"
                },
                dataType: "text",
                success: function (result) {
                    console.log("result: " + result);
                    loadList(bno, replyPage);
                }
            });
        }

        $(".pagination").on("click", "a", function (e) {
            e.preventDefault();
            console.log("hi~~~");
            replyPage = $(this).attr("href");

            loadList(bno, replyPage);

        });
        
        listUL.on("click",".dbtn", function (e) {

        	console.log($(this));
            var rno = $(this).attr("data-rno");

            if (confirm(rno + "번 글을 삭제하시겠습니까?")) {
                deleteReplies(rno);
               
            }

        });


        rbtn.on("click", function (e) {
            
        	
        	
            saveReplies();
        });


        var modalLayer = $("#modalLayer");

        var modalCont = $(".modalContent");
        var marginLeft = modalCont.outerWidth() / 2;
        var marginTop = modalCont.outerHeight() / 2;

        listUL.on("click", "#modibtn", function (e) {
            var rno = $(this).attr("data-rno");
            readReplies(rno, replyPage);
            modalLayer.fadeIn("slow");
            modalCont.css({"margin-top": -marginTop, "margin-left": -marginLeft});
            $(this).blur();
            $(".modalContent > a").focus();
            return false;
        });

        $(".modalContent > .closebtn").click(function () {
            modalLayer.fadeOut("slow");

        });

        mbtn.on("click", function (e) {
            modifyReplies();
            alert("수정되었습니다.");
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