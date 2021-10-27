<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>shop shop</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet"  href="/resources/assets/css/main.css" />
		<style>
			*{margin: 0;padding: 0;}
			header {display: inline-block; float:right;}
			body {text-align: center;}
			div#wrapper{text-align: left; width: 800px; margin: 0 auto;}
			header, footer, aside, nav, section, article{display: block; margin-top: 10px;}
			header, nav, footer{width: 100%;}
			aside{width:20%; float: left;}
			section{margin-bottom: 10px; width: 80%; float: right;}
			article{width:90%; margin: 10px;}
 			.nav ul li {list-style-type:none; float:left; margin-left: 20px;]}
 			.asideMenu ul li {list-style:none; margin-bottom: 10px;}
 			footer {width: 100%; background-color: black; float: left; }
		</style>
	</head>
	<body class="is-preload">
		<!-- Scripts -->
		<script>
			var str = "[";
			str += ${sessionscope.brandInit};
			str += "] ";
			if(${sessionscope.brandInit}.length <= 10){
				str += ${sessionscope.title};
			}
			str += " | shopshop";
			document.title = str;
		</script>
		
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
					<c:if test="${sessionscope.memberId } != null">
						<li>
							${sessionscope.memberId } 님
						</li>
						<li>
							마이페이지
						</li>
						<li>
							장바구니
						</li>
					</c:if>
					<c:otherwise>
						<li>
							<a href="/member/memberLogin.do" >로그인</a>
						</li>
						<li>
							<a href="/member/memberSignUp.do" >회원가입</a>
						</li>
					</c:otherwise>
				</ul>
			</nav>
			<br/>
			<hr/>
		<!-- aside -->
			<aside class="asideMenu">
				<ul class="big">
					<li>
						<a href="">WOMEN</a>
					</li>
					<li>
						<a href="">MAN</a>
					</li>
					<li>
						<a href="">LIFE</a>
					</li>
					<li>
						<a href="">BEAUTY</a>
					</li>
				</ul>
				<hr/>
				<ul class="adminUl">
					<li>
						<a href="/special/makeSpeicalPage.do">기획전 작성</a>
					</li>
					<li>
						<a href="javascript:void(0);" onclick="addGoods();return false;">기획전 상품추가</a>
					</li>
				</ul>
				<ul class="memberUl">
					<li>
						<a href="/board/boardList.do">게시판</a>
					</li>
				</ul>
			</aside>
		<script type="text/javascript">
			function addGoods(){
				document.specialInfo.method = "get";
				document.specialInfo.action = "/special/makeSpeicalGoods.do";
			}
		</script>
		<!-- Main -->
			<section>
				<article class="content">
					<form name="specialInfo" class="specialInfo">
						<a href="/special/list.do">기획전</a>
						<span>
							> [${sessionscope.s_brandInit }] ${sessionscope.s_title }
						</span>
						<c:if test="${sessionscope.s_brandInit } != null">
							<input type="hidden" id="s_brandInit" value="${sessionscope.s_brandInit }">
						</c:if>
						<c:if test="${sessionscope.s_title } != null">
							<input type="hidden" id="s_title" value="${sessionscope.s_title }">
						</c:if>
					</form>
				</article>
				<article class="imgBan">
					<div class="innerImgBan">
						<div class="contentImgBan">
							<p>상품 이미지 배너 모음</p>
		 					<%--	<c:forEach items="${ }" var="list"> --%>
							<!-- 		asd -->
							<%-- 	</c:forEach> --%>
						</div>
					</div>
				</article>
				<br/>
				<article class="specialBan">
					<div class="innerSpecialBan">
						<div class="contentSpecialBan">
							<p>브랜드 내 타 기획전 이동 이미지 배너(최근부터 최대 3개)</p>
						</div>
					</div>	
				</article>
				<hr/>
				<br/>
				<hr/>
				<article class="specialTab">
					<div class="tabContent">
							탭(이벤트, 상품 종류)
						</div>
				</article>
				<br/>
				<article class="specialGoods">
					<div class="goods">
							세부 상품 항목(상품종류와 일치하는 것만 가져올 것)
					</div>
				</article>
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