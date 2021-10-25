<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>


<script type="text/javascript">
	//체크박스 전체체크
	$j(document).ready(function(){
		$j("#chkAll").on("click", function(){
			if($j("#chkAll").is(":checked")){
				$j("input[name=chk]").prop("checked", true);
			}
			else $j("input[name=chk]").prop("checked", false);
		})
	//체크박스 확인 전체체크 	
		$j(".boxChk").on("click", function(){
			var totalChk = $j("input[name=chk]").length;
			var checked = $j("input[name=chk]:checked").length;
			if(checked == totalChk){
				$j("input[name=allchk]").prop("checked", true);
			}
			else $j("input[name=allchk]").prop("checked", false)
		})
		//id값이 존재할때
		$j(function(){
			if( test = ${not empty sessionScope.userId})
				{
					$j(".login").hide();
					$j(".logout").show();
				}
			else{
				$j(".login").show();
				$j(".logout").hide();
					}		
		})
		//SUBMIT 처리
		$j("#target" ).on("click",function() {
			if($j("input[name=chk]:checked").length > 0 ){
			  $j( "#inputValue" ).submit();
		}
			});
	});

</script>
<body>
<table  align="center">
	<tr>
	<td align ="left">${sessionScope.userName}
					  <a href ="/member/memberLogin.do" class ="login">Login</a>  
					  <a href ="/member/memberSignUp.do" class ="login">SignUp</a>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>

		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
		</td>
	</tr>
	<tr>
		<td>
		<form action="/board/selectBoardList.do" method="post" id="inputValue">
			<input type="checkbox" name = "allchk" id = "chkAll">전체
			<c:forEach items="${comCode}" var="list">
				<input type="checkbox" name = "chk" value = "${list.codeId}" class="boxChk">${list.codeName}	
			</c:forEach>
			<input type="hidden" name = "pageNo" value= 1>
			<input type="button" id="target" value="조회" >
			<a href="/logOutUser.do" class="logout"style="display:none">로그아웃</a>
		</form> 
		</td>
	</tr>

</table>	
</body>
</html>