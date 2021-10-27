<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입창입니다.</title>
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
			//아이디 널 체크
			if($j('#memberId').val() == null || $j('#memberId').val() == "" || $j('#memberId').val() == "undefined"){
				alert("아이디를 입력해주세요.");
				$j("#memberId").focus();
				return
				}
			//아이디 중복확인 유무
			if(chk_ok == false){
				alert("아이디 중복확인을 해주세요.")
				return
			}
			
			//아이디 길이
			if($j('#memberId').val().length < 4 || $j('#memberId').val().length > 15){
				alert("아이디는 최소 4자 ~ 15자")
				$j("#memberId").focus();
				return
			}
			//아이디 중복유무
			if(overlap == true){
				alert("중복된 아이디입니다.")
				return
			}
			//비밀번호 널 체크
			if(pw_val == null || pw_val == "" || pw_val =="undefined"){
				alert("비밀번호를 입력해주세요");
				$j("#memPw").focus();
				return
			}
			//비밀번호 확인체크
			if(pwCon_val == null || pwCon_val == "" || pwCon_val =="undefined"){
				alert("비밀번호 재확인을 입력해주세요.");
				$j("#memPwCon").focus();
				return
			}
			//비밀번호 일치 체크
			if(pw_val != pwCon_val){
				alert("비밀번호가 일치하지 않습니다.");
				$j("#memPwCon").focus();
				return
			}
			//이름 널 체크
			if(name_val == null|| name_val == "" || name_val =="undefined")
				{
				alert("이름을 입력해주세요");
				$j("#memName").focus();
				return
				}
			//이름 길이체크
			if(name_val.length > 7)
				{
				alert("이름을 입력해주세요");
				alert(test.length)
				$j("#memName").focus();
				
				return
				}	
			//번호 널 체크
			if(phone1_val == null|| phone1_val == "" || phone1_val =="undefined" 
					|| $j('#userPhone2').val().length < 4){
				if($j('#userPhone2').val().length >= 1){
					alert("전화번호 2번째 자리를 계속해서 입력해 주세요.");
					$j("#userPhone2").focus();
				}
				else{
					alert("전화번호 2번째 자리를 입력해 주세요.");
					$j("#userPhone2").focus();
				}
				return
			}
			//번호2 널 체크
			if(phone2_val == null|| phone2_val == "" || phone2_val =="undefined" 
					|| $j('#userPhone3').val().length < 4){
				if( $j('#userPhone3').val().length >= 1){
					alert("전화번호 3번째 자리를 계속해서 입력해 주세요.");
					$j("#userPhone3").focus();
				}
				else{
					alert("전화번호 3번째 자리를 입력해 주세요.");
					$j("#userPhone3").focus();
				}
				return
			}
			//우편번호 값체크
			if(post_val.length > 0){
				if($j("#userAddr1").val().length != 7){
					alert("우편번호 6자리를 모두 입력해주세요");
					$j("#userAddr1").focus();
					return	
				}
			}
			else{}
				
			
			//정규식 검사
			var idJ = /^[a-z0-9]{4,12}$/;
			var pwJ = /^[A-Za-z0-9]{4,12}$/;
			var nameJ = /^[\uac00-\ud7a3]*$/;
			
			
			//값 전송
			$j.ajax({
				url: "/member/memberSignUpAction.do",
				dataType:"json",
				type:"POST",
				data : param,
				success: function(data, textStatus, jqXHR)
				{
						alert("가입완료");
						location.href="/board/boardList.do"
				},
				
				error: function(jqXHR, textStatus, errorThrown)
				{
					alert("가입실패..");
				}
			});
				
		});
		//비밀번호 중간변경
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
		
		//비밀번호 중복체크
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
			//아이디 중복체크
			$j('#id_check').on("click",function(){
				$j('#id_chk').hide();
				$j('#id_y').hide();
				$j('#id_n').hide();
				$j('#id_over').hide();
				id_val = $j('#memberId').val();
				//아이디 길이체크
				const regExp = /^[a-z0-9]{4,15}$/; 
				if(regExp.test(id_val) && id_val!=null){
					}
				
				else{
					
					$j('#id_over').show();
					$j('#memberId').focus();
					return;
				}
				//ajax 값 전송
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
							$j('#id_n').val("중복된 아이디입니다.")
							$j('#id_n').show();
							$j('#id_chk').hide();
							overlap = true;
							$j("#memberId").focus();
							chk_ok = false;
							return
						}
						else{
							//아이디 사용가능
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
						alert("에러")
				    }			
			
				})
				}
			});
			//한글정규식
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
	 		//한글 정확성 체크
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
			
			//아이디 중복검사요청
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
			
			
			
			
			  //우편번호 입력제한
			  $j('#userAddr1').keyup(function(){
				  if(event.keyCode<48 || event.keyCode>57){
			           event.returnValue=false;
			        }
			  })
			//우편번호 하이픈처리
			  $j(document).on("keydown", "#userAddr1", function() { 
				  $j(this).val($j(this).val().replace(/[^0-9]/g,"").replace(/([0-9]{3})([0-9])/,"$1-$2"));
				  //$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
				});
			  //아이디 한글 제외
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
			 					<input type="button" value="중복확인"id="id_check">
			 					 <div id="id_n">중복된 아이디입니다.</div>
			 					 <div id="id_y">사용가능한 아이디입니다.</div>
			 					 <div id="id_chk">아이디 중복확인을 해주세요.</div>
			 					 <div id="id_over">영어, 숫자로 구성 4~16자 미만</div>
			 					</td>
			</tr>
		
			<tr>
				<td>Pw</td>
				<td><input type="password" id="memPw" name="userPw" style="'ime-mode:disabled;" required></td>
			</tr>
			<tr>
				<td>Pw Check</td>
				<td><input type="password" id="memPwCon" name="memPwCon" value=""required>
			 		<div id="pw_y">사용가능한 비밀번호입니다.</div>
			 		<div id="pw_n">비밀번호가 일치하지않습니다.</div>				
				</td>
			</tr>
			<tr>
				<td>name</td>
				<td><input type="text" name="userName" value="" maxlength="5" id ="memName" required>
				<div id="name_y">한글만 입력해주세요.</div>
				<div id="name_yy">이름을 정확히 입력해주세요.</div> 
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
			<td colspan="2" align="right"><input type="button" id="submit" value="작성완료"></td>
			</tr>
	</table>
		</form>	
</body>
</html>