<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<title>shop shop</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<style>
			header {display: inline-block; float:right}
			ul li {list-style-type:none; float:left; margin-left: 20px;]}
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
		
		
		<!-- Header -->
		<header id="header">
			<ul>
				<li>
					<a href="/member/memberLogin.do" >로그인</a>
				</li>
				<li>
					<a href="/member/memberSignUp.do" >회원가입</a>
				</li>
				<li>
					마이페이지
				</li>
				<li>
					장바구니
				</li>
			</ul>
		</header>
		<h1>shop shop</h1>
		
		<!-- Main : class명은 차후에 수정할 것 -->
		<section class="flow">
			<div class="inner">
				<div class="content">
					<a href="/special/list.do">기획전</a>
					<span>
						> [${sessionscope.brandInit }] ${sessionscope.title }
					</span>
				</div>
			</div>
		</section>
		<br/>
		<section class="imgBan">
			<div class="inner">
				<div class="content">
					배너 이미지 칸
				</div>
			</div>
		</section>
		<hr/>
		<br/>
		<hr/>
		<section class="flow">
			<div class="inner">
				<div class="content">
					탭(이벤트, 상품 종류)
				</div>
			</div>
		</section>
		<br/>
		<section>
			<div class="inner">
				<div class="content">
					세부 상품 항목
				</div>
			</div>
		</section>
		
		<hr />
		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<div class="content">
					<section>
						<h3>shop shop</h3>
						<p>ㅎㅇ</p>
					</section>
				</div>
			</div>
		</footer>

		
	</body>
</html>