<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ȸ������â�Դϴ�.</title>
<style type="text/javaScript">

</style>
<script type="text/javascript">
	$j(document).ready(function(){
		$j("#submit").on("click", function(){
			var $frm = $j("#login");
			var param = $frm.serialize();
			var idChk = $j("#userId").val();
			var pwChk = $j("#userPw").val();
			if($j("#userId").val() == null || $j("#userId").val() == "" || $j("#userId").val() == "undefined" ){
				alert("���̵� �Է����ּ���");
				$j("#userId").focus();
				return
			}
			if ($j("#userPw").val() == null){
				alert("��й�ȣ�� �Է����ּ���");
				$j("#userPw").focus();
				return
			}
			if($j("#userId").val() != null && pwChk !=null){
				$j.ajax({
					url:"/loginUser.do",
					dataType:"json",
					type:"POST",
					data:param,
					success: function(data, textStatus, jqXHR){
						if(data.success == "1"){
							location.href ="/special/list.do";
						}
						else if(data.success == "2"){
							alert("�������� �ʴ� ���̵��Դϴ�.");
							$j("#userId").focus();
						}
						else if(data.success == "3"){
							alert("��й�ȣ�� Ȯ�����ּ���.");	
							$j("#userPw").focus();
						}
					},
					error: function(data){
						alert(data.success);
						}
				})
			}
				
			})
			
			
		})
	
	

</script>
</head>
<body>
	<table align="center" width="350">
		
		<tr ><td align="left"><a href ="/board/boardList.do">List</a></td></tr>
		<tr><td>
		<table border = "1" align = "center">
	
			<form method='get' id="login">
			<tr>
			 	<td width="100">Id</td>
			 	<td width="250"><input type="text" name="userId" id ="userId"></td>
			</tr>
			<tr>
				<td>Pw</td>
				<td><input type="password" name="userPw" id ="userPw"></td>
			</tr>
	
		</form>
		</table>
		</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="button" id="submit" value="�α���"></td>
			</tr>
	</table>	
</body>
</html>    