<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȹ�� �߰� ������</title>
</head>
<script>
	$j(document).ready(function(){
		$j("#submit").on("click",function(){
			
			$j.("#s_brandId")
			
			var arr = new Array();
			var $frm = $j('.makeSpecialPage :input');
			list = $frm;
			alert(list);
			$j.ajax({
			    url : "/special/makeSpecialGoodsAction.do",
			    dataType: "json",
			    type: "POST",
			    data : list,
			    
			    success: function(data, textStatus, jqXHR)
			    {
					alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);
					
					location.href = "/special/list.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    	
			    	
			    }
			});
		});
	});
	
	function inputBrandId(){
		var bName = $j("#g_Class").val();
		$j("#s_brandId").val($j("#br_Id").val());
	}
</script>
<body>
<form class="makeSpecialPage">
	<table border ="1" id ='myTable' align='center'>
		<tr>
			<td width="120" align="center">
				��ȹ�� ��
			</td>
			<td width="400">
				<input type="text" id="s_title">
			</td>
		</tr>
		<tr>
			<td>
				�귣��
			</td>
			<td>
				<select id="brand" onblur="inputBrandId();">
					<c:forEach items="${brandVoList}" var="brandVoList">
						${brandVoList.br_Name}
						<input type="hidden" id="br_Id" value="${brandVoList.br_Id }">
					</c:forEach>
				</select>
				<input type="hidden" id="s_brandId" name="s_brandId">
			</td> 
		</tr>
		<tr>
			<td>
				��ǥ�̹���
			</td>
			<td>
				<input type="file" id="s_theme">
			</td> 
		</tr>
		<tr>
			<td>
				�׸�
			</td>
			<td>
				<select id="s_theme" >
					<c:forEach items="${themeList }" var="themeList">
						${themeList.br_Name }
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				���� ����
			</td>
			<td>
				<input type="text" id="s_notice">
			</td>
		</tr>
		<tr>
			<td>
				��ȹ�� ��ũ�� �̹���
			</td>
			<td>
				<input type="file" id="s_linkImg">
			</td>
		</tr>
		<tr>
			<td align="right">
				<input id="submit" type="button" value="��ȹ�� �ۼ�">
				<input type="button" value="����Ʈ" onclick="location.href='/special/list.do'">
			</td>
		</tr>
	</table>
</form>	
</body>
