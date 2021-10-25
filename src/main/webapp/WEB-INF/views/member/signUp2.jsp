<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창입니다.</title>
<style type="text/javaScript">

</style>
</head>
<body>
	<table align="center" width="350">
		
		<tr ><td align="left"><a href ="/board/boardList.do">List</a></td></tr>
		<tr><td>
		<table border = "1" align = "center">
	
			<form action="member/memberSignUp.do" method='get'>
			<tr>
			 	<td width="100">Id</td>
			 	<td width="250"><input type="text" name="memId" value=""></td>
			</tr>
			<tr>
				<td>Pw</td>
				<td><input type="password" name="memPw" value=""></td>
			</tr>
	
		</form>
		</table>
		</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="로그인"></td>
			</tr>
	</table>	
</body>
</html>