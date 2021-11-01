<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>기획전 추가 페이지</title>
</head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
   
   $(document).ready(function(){
      
      $("#selectBrand").change(function(){
         var value = $("#selectBrand").val()
         $("#s_brandId").val(value);
      });
      $("#selectTheme").change(function(){
         var value = $("#selectTheme").val()
         $("#s_theme").val(value);
      });
      
      $("#submit").click(function(){
    	  var $frm = $('.makeSpecialPageAction :input');
    	  var param = $frm.serialize();
    	  $.ajax({
			    url : "/special/makeSpecialPageAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					if(data.success == 'Y'){
						document.makePageImgAction.submit();
					}
					else{
						alert('controller 이후실패');
						alert(param);
					}
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert('그냥 실패');
			    	alert(param);
			    	alert(errorThrown);   	
			    }
			});
      })
   });
   
</script>
<body>
<table border ="1" id ='myTable' align='center'>
	<thead>
	<form class="makeSpecialPageAction">
		<tr>
			<td width="120" align="center">
            	기획전 명
         	</td>
         	<td width="400">
            	<input type="text" id="s_title" name="s_title">
         	</td>
      	</tr>
      	<tr>
         	<td align="center">
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
         	<td align="center">
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
         	<td align="center">
            	유의 사항
         	</td>
         	<td>
            	<textarea rows="5" cols="40" id="s_notice" name="s_notice"></textarea>
         	</td>
      	</tr>
	</form>
	</thead>
	<tbody> 
	<form class="makePageImgAction" name="makePageImgAction" action="/special/makePageImgAction.do" method="post" enctype="multipart/form-data">
		<tr>
			<td align="center">
            	대표 이미지
         	</td>
         	<td>
            	<input type="file" id="main_imgFile" name="main_imgFile">
         	</td> 
      	</tr>
      	<tr>
         	<td align="center">
            	링크 이미지
         	</td>
         	<td>
            	<input type="file" id="link_imgFile" name="link_imgFile">
         	</td>
      	</tr>
      	<tr>
      		<td align="center">
      			배너 이미지
      		</td>
      		<td>
				<input type="file" id="ban_imgFile" name="ban_imgFile" multiple="multiple" >
      		</td>
      	</tr>
      	<tr>
      		<td align="center">
      			동영상 링크
      		</td>
      		<td>
      			<input type="text" id="ban_video" name="ban_video" >
      		</td>
      	</tr>
      	<tr>
         	<td align="right" colspan="2">
            	<input type="button" id="submit" value="기획전 작성">
            	<input type="button" value="리스트" onclick="location.href='/special/list.do';">
         	</td>
      	</tr>
	</form>
	</tbody>
</table>
</body>