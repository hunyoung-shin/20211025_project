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
			str += ${sessionScope.brandInit};
			str += "] ";
			if(${sessionScope.brandInit}.length <= 10){
				str += ${sessionScope.title};
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
					<c:choose>
						<c:when test="${not empty sessionScope.userId}">
							<li>
								${sessionScope.userName } 님
							</li>
							<li>
								마이페이지
							</li>
							<li>
								장바구니
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="/member/memberLogin.do" >로그인</a>
							</li>
							<li>
								<a href="/member/memberSignUp.do" >회원가입</a>
							</li>
						</c:otherwise>
					</c:choose>
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
						<a href="/special/makeSpecialPage.do">기획전 작성</a>
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
				document.specialInfo.action = "/special/makeSpecialGoods.do";
			}
		</script>
		<!-- Main -->
			<section>
				<article class="content">
					<form name="specialInfo" class="specialInfo">
						<a href="/special/list.do">기획전</a>
						<span>
							> [${sessionScope.s_brandInit }] ${sessionScope.s_title }
						</span>
						<c:if test="${not empty sessionscope.s_brandInit }">
							<input type="hidden" id="s_brandInit" value="${sessionScope.s_brandInit }">
						</c:if>
						<c:if test="${not empty sessionScope.s_title }">
							<input type="hidden" id="s_title" value="${sessionScope.s_title }">
						</c:if>
					</form>
				</article>
				<article class="imgBan">
					<ul class="innerImgBan">
<%-- 						<c:forEach items="${bannerList }" var="bList"> --%>
<!-- 							<li> -->
<%-- 								<img src="${bList.ban_img}" /> --%>
<!-- 							</li> -->
<%-- 						</c:forEach> --%>
						<li>
							<p>
								동영상 위치
<%-- 								${bannerList.ban_video } --%>
							</p>
						</li>
					</ul>
				</article>
				<br/>
				<article class="specialBan">
					<ul class="innerSpecialBan">
					<c:forEach items="${linkImgList }" var="lList">
						<li>
							<a href="#">
<%-- 여기 이렇게하면 안됨 -> 리스트 형태로 수정 또는 map형태로 	<img src="${lList}" /> --%>
							</a>
						</li>
					</c:forEach>
					</ul>	
				</article>
				<hr/>
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