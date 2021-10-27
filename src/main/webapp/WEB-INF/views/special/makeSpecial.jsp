<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<style type="text/css">
html, body {

    margin: 0;
	width: 100%;
	height: 100%;

    overflow: hidden;

}

.backstyle{
  height: 100%;
  display:flex;
  width: 100%;
  align : center;		

}
.div_child{
	display: inline-block;
	width : 100%;
	height : 100%;
	text-align: center;
	background-color : gray;
}
.div_left{
	width :200px;
	float: left;
	height : 100%;
	text-align: left;
	background-color :wilte;
}
.div_right{
	float: right;
	height : 100%;
	width :200px;
	text-align: center;
	background-color :blue;
}

</style>


<div class = "backstyle">
	<div class ="div_child">
		<div class ="div_left">
			aaaaa
		</div>
	
		<div>
		<h1>TTTTTTTTTTTTTT</h1>
		</div>
		
		<div class="div_right">
		zzzzzzzzzzzzzzzz
		</div>
	</div>

</div>
</body>
</html>