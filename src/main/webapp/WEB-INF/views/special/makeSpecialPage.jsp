<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>기획전 추가 페이지</title>
</head>
<script>
	$j(document).ready(function(){
		
		$j("#selectBrand").change(function(){
			var value = $j("#selectBrand").val()
			$j("#s_brandId").val(value);
		});
		$j("#selectTheme").change(function(){
			var value = $j("#selectTheme").val()
			$j("#s_theme").val(value);
		});
		
		$j("#submit").on("click",function(){
			
			// 조건은 일단 생략
			// 예) 입력을 다 안했거나, 이미지 파일이 아닌 다른 파일을 업로드 했을 경우
			
			document.makeSpecialPage.submit();
		});
	});
</script>
<body>
<form class="makeSpecialPage" method="post" enctype="multipart/form-data">
	<table border ="1" id ='myTable' align='center'>
		<tr>
			<td width="120" align="center">
				기획전 명
			</td>
			<td width="400">
				<input type="text" id="s_title" name="s_title">
			</td>
		</tr>
		<tr>
			<td>
				브랜드
			</td>
			<td>
				<select id="selectBrand">
					<c:forEach items="${brandVoList}" var="brandVoList">
						<option value="${brandVoList.br_Id }">${brandVoList.br_Name}</option>
					</c:forEach>
				</select>
				<input type="hidden" id="s_brandId" name="s_brandId" value="1">
			</td> 
		</tr>
		<tr>
			<td>
				테마
			</td>
			<td>
				<select id="selectTheme" >
					<c:forEach items="${themeList }" var="themeList">
						<option value="${themeList.br_Id }">${themeList.br_Name }</option>
					</c:forEach>
				</select>
				<input type="hidden" id="s_theme" name="s_theme" value="a01">
			</td>
		</tr>
		<tr>
			<td>
				유의 사항
			</td>
			<td>
				<textarea rows="5" cols="40" id="s_notice" name="s_notice"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				대표이미지
			</td>
			<td>
				<input type="file" id="s_image" name="s_image">
			</td> 
		</tr>
		<tr>
			<td>
				기획전 링크용 이미지
			</td>
			<td>
				<input type="file" id="s_linkImg" name="s_linkImg">
			</td>
		</tr>
		<tr>
			<td align="right" colspan="2">
				<input id="submit" type="button" value="기획전 작성">
				<input type="button" value="리스트" onclick="location.href='/special/list.do'">
			</td>
		</tr>
	</table>
</form>	
</body>
