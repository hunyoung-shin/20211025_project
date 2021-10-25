<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>

<script>
	$j(document).ready(function(){
			var i = 0;
			var count = 0;
			var index = 0;
		
			
		$j("#submit").on("click",function(){
			var arr = new Array();
			var $frm = $j('.boardWrite :input');
			list = $frm;
			alert(list);
			$j.ajax({
			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : list,
			    
			    success: function(data, textStatus, jqXHR)
			    {
					alert("작성완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    	
			    	
			    }
			});
		});
		//폼 추가
		$j("#addForm").on("click", function(){
			count = $j("tr").length;
			i += 1;
			var html = "";
			//html +='<table border="1" id="mytable" align="center">';
			html +='<tr class ='+i+' bgcolor="gray">';
			html +='<td width="120" align="center">Type</td>';
			html +='<td width="400">';
			html += '<select name="boardVoList['+i+'].boardType">';
			html += '<c:forEach items="${comCode}" var="list">';
			html += '<option value ="${list.codeId}">${list.codeName}</option>';
			html += '</c:forEach>';
			html += '</select>';
			html +='</td></tr>'
			
			html +='<tr class ='+i+'>';
			html +='<td width="120" align="center">Title</td><td width="400">';
			html +='<input name="boardVoList['+i+'].boardTitle" type="text" size="50" value="${board.boardTitle}">';
			html +='</td></tr>';
			
			html +='<tr class ='+i+'><td height="300" align="center">Comment</td>';
			html +='<td valign="top">';
			html +='<textarea name="boardVoList['+i+'].boardComment"rows="20" cols="55">${board.boardComment}</textarea></td>'	;
			html +='</tr>';
			
		/* 	html +='<tr class ='+i+'>';
			html +='<td width="120"align="center">Writer</td>';
			html +='<td width="400">${sessionScope.userName}</td>';	
			html +='</tr>'
			 */
			html +='<tr class ='+i+'>';
			html +='<td align="right" colspan ="2"><input type=button value="삭제" id="selectDel"></td>';
			html +='</tr>';
			//html +='</table>';
			
			$j('#myTable').append(html);
			//$j('#mainTable').append('<table border ="1" id ="myTable" align="center"><tr id ='+i+'><td width="120" align="center">Title</td><td width="400"><input name="boardVoList['+i+'].boardTitle" type="text" size="50" value="${board.boardTitle}"></td></tr>');
			//$j('#tbody').append('<tr id ='+i+'><td height="300" align="center">Comment</td><td valign="top"><textarea name="boardVoList['+i+'].boardComment"rows="20" cols="55">${board.boardComment}</textarea></td></tr>');
			//$j('#tbody').append('<tr id ='+i+'><td align="right" colspan ="2"><input type=button value="삭제" id="selectDel"></td></tr></table>');
			//console.log("현재 i 의 값은? : "+ i);
			console.log("현재 tr의 갯수는? :"+count);
		});
		
		$j(document).on("click","#formDel", function(){
			console.log("제거전 i 의 값은? : "+ i);
			msg ="테이블을 삭제하시겠습니까? (맨 밑 테이블이 삭제됩니다.)"
			if(i > 0){
				pop = confirm(msg)
				if(pop == true){
					var test1 = document.getElementsByTagName('tr');
					var delclass = $j(test1[test1.length-1]).attr('class');
					$j("."+delclass).remove();						
					
					//$j("."+findClass).remove();
					i -= 1;
					if(i > 0){
					count = $j("tr").length;
					//console.log("제거 후 i 의 값은? : "+ i);
					//console.log("현재 tr의 갯수는? :"+count);
						}
				}
			}
		
		});
		
		$j(document).on("click","#selectDel",function(){
			var msg = "정말 삭제하시겠습니까?"
			var pop = confirm(msg)
			if(pop == true){
				var aa = $j(this).closest('tr')
				var dd = aa.attr("class")
				$j("."+dd).remove();
			}
		});
		
		$j(document).on("click","#test1",function(){
			var aaa = $j("#myTable").children()
			var sss = aaa.attr("class")
			console.log(aaa);
			console.log(sss);
			
			
		})
		
		
		
	});

</script>
<body>
<head>

</head>

<form class="boardWrite" onsubmit=check();>
	
				<table border ="1" id ='myTable' align='center'>
					<tr bgcolor ="gray">
						<td align="right" colspan ="2">
							<input type="button" value="Textarea 삭제" id="formDel">
							<input type="button" VALUE="Textarea 추가" id="addForm">
							<input id="submit" type="button" value="작성">
							<input type="button" value="리스트"onclick="location.href='/board/boardList.do'">
						</td>
					</tr>
						<tr bgcolor='gray'><td width="120" align="center">Type</td><td>
							<select name="boardVoList[0].boardType" style="bg:gray">
								<c:forEach items="${comCode}" var="list">
									<option value ="${list.codeId}">${list.codeName}</option>	
								</c:forEach>
							</select> 
						</td>
					</tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardVoList[0].boardTitle" type="text" size="48" value="${board.boardTitle}">
						</td> 
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardVoList[0].boardComment" rows ="20" cols="60">${board.boardComment}</textarea>
						</td>
					</tr>
					<input name="creator" type="hidden" size="48" value="${sessionScope.userId}">
					<%-- <tr>
						<td width="120"align="center">Writer</td>
						<td width="400">${sessionScope.userName}</td>
					</tr> --%>
				
				</table>
				<table border ="1" align='center'>
					<footer>
						<tr>
							<td width="120"align="center">Writer</td>
							<td width="458">${sessionScope.userName}</td>
						</tr>
					</footer>
				</table>
			
</form>	
</body>



</html>