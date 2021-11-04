<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>shop shop</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style>
* {
	margin: 0;
	padding: 0;
}
header {
	display: inline-block;
	float: right;
}
body {
	text-align: center;
}
div#wrapper {
	text-align: left;
	width: 800px;
	margin: 0 auto;
}
header, footer, aside, nav, section, article {
	display: block;
	margin-top: 10px;
}
header, nav, footer {
	width: 100%;
}
aside {
	width: 20%;
	float: left;
}
section {
	margin-bottom: 10px;
	width: 80%;
	float: right;
}
article {
	width: 90%;
	margin: 10px;
}
.nav ul li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
	]
}
.asideMenu ul li {
	list-style: none;
	margin-bottom: 10px;
}
footer {
	width: 100%;
	background-color: black;
	float: left;
}
select {
	width: 100px;
	height: 30px;
	float: right;
	padding: 2px;
}
option {
	font_size: 5px;
}
img {
	width: 150px;
	height: 200px;
}
ul {
	list-style: none;
}
.content li {
	float: left;
}
</style>
</head>
<!-- script import : src로 한번 불러오면 이 페이지 내에서는 계속 쓸 수 있음 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	$(document).ready(function(){
// 		$(".select").on("change", function(){
				
// 		})
	})
</script>
<body class="is-preload">
	<div id="wrapper">
		<!-- Header -->
		<header class="header">
			<a href="/main">
				<h2>ICTCOOP shop</h2>
			</a>
		</header>
		<!-- nav -->
		<nav class="nav">
			<ul>
				<c:choose>
					<c:when test="${not empty sessionScope.userId}">
						<li>${sessionScope.userName } 님</li>
						<li>마이페이지</li>
						<li>장바구니</li>
					</c:when>
					<c:otherwise>
						<li><a href="/member/memberLogin.do">로그인</a></li>
						<li><a href="/member/memberSignUp.do">회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<br />
		<hr />
		<!-- aside -->
		<aside class="asideMenu">
			<ul class="big">
				<li><a href="">WOMEN</a></li>
				<li><a href="">MAN</a></li>
				<li><a href="">LIFE</a></li>
				<li><a href="">BEAUTY</a></li>
			</ul>
			<hr />
			<ul class="adminUl">
				<li><a href="/special/makeSpecialPage.do">기획전 작성</a></li>
			</ul>
			<ul class="memberUl">
				<li><a href="/board/boardList.do">게시판</a></li>
			</ul>
		</aside>
		<!-- Main -->
		<section>
			<article class="content">
				<a href="/special/list.do">기획전 </a>
				<select name="theme">
					<option value="모든 테마">모든 테마</option>
					<c:forEach items="${themeList}" var="tList">
						<option value="${tList.br_Id}">${tList.br_Name }</option>
					</c:forEach>
				</select>
				<select name="brand">
					<option value="모든 브랜드">모든 브랜드</option>
					<c:forEach items="${brandList}" var="bList">
						<option value="${bList.br_Id}">${bList.br_Name }</option>
					</c:forEach>
				</select>
			</article>
			<ul class="content">
				<c:forEach items="${specialList}" var="sList">
					<li width=150px>
						<a href="/special/${sList.s_Num }/view.do"> 
							<img src="${sList.main_img}" />
								<div class=info>
									<span class="title">
										${sList.s_title }
										<br>
										${sList.br_Name }
									</span>
								</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</section>
		<hr />
		<!-- Footer -->
		<footer class="footer">
			<div class="inner">
				<div class="content">
					<section>
						<h3>ICTCOOP shop</h3>
						<p>ㅎㅇ</p>
					</section>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>