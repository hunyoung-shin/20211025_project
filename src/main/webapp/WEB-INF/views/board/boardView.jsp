<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<body>
<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					${board.boardUserName}
					<form action="/board/boardDelete.do" method="get" name="delboard">
					<input type ="hidden" name="Number" value=${board.boardNum }>
					</form>
					
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
		
			<a href="javascript:void(0);" onclick="testFunction()">Delete |</a>
			<a href="/board/${board.boardType}/${board.boardNum}/boardModify.do">Modify | </a>
			<a href="/board/boardList.do">List</a>
		</td>
	</tr>
</table>
<script type = "text/javascript">
	function testFunction(){
		var msg="정말로 삭제하시겠습니까?";
		var flag = confirm(msg);
		var Number = document.delboard
		if(flag==true) {
			alert("삭제 완료되었습니다.");
			Number.submit();
			//location.href="board/boardDelete.do?Number="
		}
	}
</script>
	
</body>
</html>