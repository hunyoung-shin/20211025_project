<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ������â�Դϴ�.</title>
<style type="text/css">
#id_over{color: red; display: none; font-size:8px;}
#id_chk{color: red; display: none; font-size:8px;}
#id_y{color: blue; display: none; font-size:8px;}
#id_n{color: red; display: none;font-size:8px;}
#pw_y{color: blue; display: none;font-size:8px;}
#pw_n{color: red; display: none;font-size:8px;}
#name_y{color:red; display: none;font-size:8px;}
#name_yy{color:red; display: none;font-size:8px;}
</style>
</head>

<script type="text/javascript">
var chk_ok= false;
var overlap = false;
	$j(document).ready(function(){
		$j('#submit').on("click", function(){
			var $frm = $j('.signUp');
			var param = $frm.serialize();
			id_val = $j('#memberId').val();
			pw_val = $j('#memPw').val();
			pwCon_val = $j('#memPwCon').val();
			name_val = $j("#memName").val();
			phone_val = $j("#userPhone1").val();
			phone1_val = $j("#userPhone2").val();
			phone2_val = $j("#userPhone3").val();
			post_val = $j("#userAddr1").val();
			const regExp =/^[\uac00-\ud7a3]*$/;
			//���̵� �� üũ
			if($j('#memberId').val() == null || $j('#memberId').val() == "" || $j('#memberId').val() == "undefined"){
				alert("���̵� �Է����ּ���.");
				$j("#memberId").focus();
				return
				}
			//���̵� �ߺ�Ȯ�� ����
			if(chk_ok == false){
				alert("���̵� �ߺ�Ȯ���� ���ּ���.")
				return
			}
			
			//���̵� ����
			if($j('#memberId').val().length < 4 || $j('#memberId').val().length > 15){
				alert("���̵�� �ּ� 4�� ~ 15��")
				$j("#memberId").focus();
				return
			}
			//���̵� �ߺ�����
			if(overlap == true){
				alert("�ߺ��� ���̵��Դϴ�.")
				return
			}
			//��й�ȣ �� üũ
			if(pw_val == null || pw_val == "" || pw_val =="undefined"){
				alert("��й�ȣ�� �Է����ּ���");
				$j("#memPw").focus();
				return
			}
			//��й�ȣ Ȯ��üũ
			if(pwCon_val == null || pwCon_val == "" || pwCon_val =="undefined"){
				alert("��й�ȣ ��Ȯ���� �Է����ּ���.");
				$j("#memPwCon").focus();
				return
			}
			//��й�ȣ ��ġ üũ
			if(pw_val != pwCon_val){
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				$j("#memPwCon").focus();
				return
			}
			//�̸� �� üũ
			if(name_val == null|| name_val == "" || name_val =="undefined")
				{
				alert("�̸��� �Է����ּ���");
				$j("#memName").focus();
				return
				}
			//�̸� ����üũ
			if(name_val.length > 7)
				{
				alert("�̸��� �Է����ּ���");
				alert(test.length)
				$j("#memName").focus();
				
				return
				}	
			//��ȣ �� üũ
			if(phone1_val == null|| phone1_val == "" || phone1_val =="undefined" 
					|| $j('#userPhone2').val().length < 4){
				if($j('#userPhone2').val().length >= 1){
					alert("��ȭ��ȣ 2��° �ڸ��� ����ؼ� �Է��� �ּ���.");
					$j("#userPhone2").focus();
				}
				else{
					alert("��ȭ��ȣ 2��° �ڸ��� �Է��� �ּ���.");
					$j("#userPhone2").focus();
				}
				return
			}
			//��ȣ2 �� üũ
			if(phone2_val == null|| phone2_val == "" || phone2_val =="undefined" 
					|| $j('#userPhone3').val().length < 4){
				if( $j('#userPhone3').val().length >= 1){
					alert("��ȭ��ȣ 3��° �ڸ��� ����ؼ� �Է��� �ּ���.");
					$j("#userPhone3").focus();
				}
				else{
					alert("��ȭ��ȣ 3��° �ڸ��� �Է��� �ּ���.");
					$j("#userPhone3").focus();
				}
				return
			}
			//�����ȣ ��üũ
			if(post_val.length > 0){
				if($j("#userAddr1").val().length != 7){
					alert("�����ȣ 6�ڸ��� ��� �Է����ּ���");
					$j("#userAddr1").focus();
					return	
				}
			}
			else{}
				
			
			//���Խ� �˻�
			var idJ = /^[a-z0-9]{4,12}$/;
			var pwJ = /^[A-Za-z0-9]{4,12}$/;
			var nameJ = /^[\uac00-\ud7a3]*$/;
			
			
			//�� ����
			$j.ajax({
				url: "/member/memberSignUpAction.do",
				dataType:"json",
				type:"POST",
				data : param,
				success: function(data, textStatus, jqXHR)
				{
						alert("���ԿϷ�");
						location.href="/board/boardList.do"
				},
				
				error: function(jqXHR, textStatus, errorThrown)
				{
					alert("���Խ���..");
				}
			});
				
		});
		//��й�ȣ �߰�����
		$j('#memPw').on("keyup",function(){
				nullchk = $j("#memPwCon").val();
				if(typeof nullchk != "undefined" && nullchk != null && nullchk!=""){
				var firstPw = $j('#memPw').val();
				var secondPw = $j('#memPwCon').val();
				$j('#pw_y').hide();
				$j('#pw_n').hide();
				if(firstPw == secondPw){
					$j('#pw_y').show();}
				else{$j('#pw_n').show();}
				}
		})
		
		//��й�ȣ �ߺ�üũ
			$j('#memPwCon').on("keyup",function(){
				nullchk = $j("#memPwCon").val();
				if(typeof nullchk != "undefined" && nullchk != null && nullchk!=""){
				var firstPw = $j('#memPw').val();
				var secondPw = $j('#memPwCon').val();
				$j('#pw_y').hide();
				$j('#pw_n').hide();
				if(firstPw == secondPw){
					$j('#pw_y').show();}
				else{$j('#pw_n').show();}
				}
			
		});
			//���̵� �ߺ�üũ
			$j('#id_check').on("click",function(){
				$j('#id_chk').hide();
				$j('#id_y').hide();
				$j('#id_n').hide();
				$j('#id_over').hide();
				id_val = $j('#memberId').val();
				//���̵� ����üũ
				const regExp = /^[a-z0-9]{4,15}$/; 
				if(regExp.test(id_val) && id_val!=null){
					}
				
				else{
					
					$j('#id_over').show();
					$j('#memberId').focus();
					return;
				}
				//ajax �� ����
				var memid = { memid : $j('#memberId').val()}
				var nullchk = $j('#memberId').val();
				if(typeof nullchk != "undefined" && nullchk != null && nullchk!=""){
				$j.ajax({
					url : "/member/memberIdCheck.do",
				    dataType: "json",
				    type: "POST",
				    data : memid,
				    
				    success: function(data, textStatus, jqXHR)
				    {	
						if(data.success =="Y"){
							$j('#id_n').val("�ߺ��� ���̵��Դϴ�.")
							$j('#id_n').show();
							$j('#id_chk').hide();
							overlap = true;
							$j("#memberId").focus();
							chk_ok = false;
							return
						}
						else{
							//���̵� ��밡��
							if(nullchk != null){
							$j('#id_y').show();
							$j("#id_chk").hide();
							chk_ok = true;
							overlap = false;
							return
							}
						}			
						
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
						alert("����")
				    }			
			
				})
				}
			});
			//�ѱ����Խ�
			$j('#memName').on("keyup",function(){
				
				name_val = $j('#memName').val();
				var regExp = /[\u3131-\u314e|\u314f-\u3163|\uac00-\ud7a3]/g;
				if(regExp.test(name_val) && name_val !=""){
					regExp =/^[\uac00-\ud7a3]*$/;
					if(regExp.test(name_val)){
						$j("#name_y").hide();
						$j("#name_yy").hide();
					}
					else{
						$j("#name_y").hide();
						$j("#name_yy").show();}
				}
				else{
					$j("#name_y").show();
					$j("#name_yy").hide();
					$j('#memName').val("");
					
				}
			});
	 		//�ѱ� ��Ȯ�� üũ
			$j('#memName').blur(function(){
				$j("#name_y").hide();
				$j("#name_yy").hide();	
				name_val = $j('#memName').val();
				const regExp =/^[\uac00-\ud7a3]*$/;
				if(regExp.test(name_val)){
					$j("#name_y").hide();
					$j("#name_yy").hide();	
				}
				else{
					$j("#name_yy").show();
					$j('#memName').focus();
					
				}
			});
			
			//���̵� �ߺ��˻��û
			$j("#memberId").on("keyup", function(){
				chk_ok = false;
				if($j("#memberId").val() != null){
				$j("#id_y").hide();
				$j("#id_n").hide();
				$j("#id_over").hide();
				$j("#id_chk").show();
				}
				else{
					$j("#id_y").hide();
					$j("#id_n").hide();
					$j("#id_over").hide();
					$j("#id_chk").hide();
				}
			});
			
			
			
			
			  //�����ȣ �Է�����
			  $j('#userAddr1').keyup(function(){
				  if(event.keyCode<48 || event.keyCode>57){
			           event.returnValue=false;
			        }
			  })
			//�����ȣ ������ó��
			  $j(document).on("keydown", "#userAddr1", function() { 
				  $j(this).val($j(this).val().replace(/[^0-9]/g,"").replace(/([0-9]{3})([0-9])/,"$1-$2"));
				  //$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
				});
			  //���̵� �ѱ� ����
			  $j(document).on("keyup", "#memberId", function() { 
				  $j(this).val($j(this).val().replace(/[^a-zA-Z0-9]/g,""));
				  //$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
				});
	});
</script>

<body>
	<table align="center" width="400">
		
		<tr ><td align="left"><a href ="/board/boardList.do">List</a></td></tr>
		<tr><td>
		<table border = "1" align = "center">
	
			<form  method='get' class="signUp">
			<tr>
			 	<td width="100">Id</td>
			 	<td width="300"><input type="text" name="userId" id="memberId" maxlength="15" pattern="^[a-zA-Z0-9]+$">
			 					<input type="button" value="�ߺ�Ȯ��"id="id_check">
			 					 <div id="id_n">�ߺ��� ���̵��Դϴ�.</div>
			 					 <div id="id_y">��밡���� ���̵��Դϴ�.</div>
			 					 <div id="id_chk">���̵� �ߺ�Ȯ���� ���ּ���.</div>
			 					 <div id="id_over">����, ���ڷ� ���� 4~16�� �̸�</div>
			 					</td>
			</tr>
		
			<tr>
				<td>Pw</td>
				<td><input type="password" id="memPw" name="userPw" style="'ime-mode:disabled;" required></td>
			</tr>
			<tr>
				<td>Pw Check</td>
				<td><input type="password" id="memPwCon" name="memPwCon" value=""required>
			 		<div id="pw_y">��밡���� ��й�ȣ�Դϴ�.</div>
			 		<div id="pw_n">��й�ȣ�� ��ġ�����ʽ��ϴ�.</div>				
				</td>
			</tr>
			<tr>
				<td>name</td>
				<td><input type="text" name="userName" value="" maxlength="5" id ="memName" required>
				<div id="name_y">�ѱ۸� �Է����ּ���.</div>
				<div id="name_yy">�̸��� ��Ȯ�� �Է����ּ���.</div> 
			</tr>
			<tr>
				<td>Phone</td>
				<td>
					<select name="userPhone1">
					<c:forEach items="${phone_num}" var="list">
						<option value ="${list.codeId}">${list.codeName}</option>	
					</c:forEach>
					</select>
					<input type="text" name="userPhone2" id ="userPhone2" maxlength="4" style="width:36px"
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/> -
					<input type="text" name="userPhone3"id ="userPhone3" maxlength="4" style="width:36px"
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/></td>
			</tr>
			<tr>
				<td>PostNo</td>
				<td><input type="text" id="userAddr1"name="userAddr1" value="" maxlength="7"></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="userAddr2" value=""maxlength="100"></td>
			</tr>
			<tr>
				<td>Company</td>
				<td><input type="text" name="userCompany" value=""maxlength="50"></td>
			</tr>
		
		</table>
		</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="button" id="submit" value="�ۼ��Ϸ�"></td>
			</tr>
	</table>
		</form>	
</body>
</html>