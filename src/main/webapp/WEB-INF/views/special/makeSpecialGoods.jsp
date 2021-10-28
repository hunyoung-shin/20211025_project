<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품 추가 페이지</title>
</head>

<script>
	$j(document).ready(function(){
			var i = 0;
			var count = 0;
			var index = 0;
		
			
		$j("#submit").on("click",function(){
			var arr = new Array();
			var $frm = $j('.makeGoods :input');
			list = $frm;
			alert(list);
			$j.ajax({
			    url : "/special/makeSpecialGoodsAction.do",
			    dataType: "json",
			    type: "POST",
			    data : list,
			    
			    success: function(data, textStatus, jqXHR)
			    {
					alert("작성완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/special/list.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    	
			    	
			    }
			});
		});
		// 수정 필요
		$j("#addForm").on("click", function(){
			count = $j("tr").length;
			i += 1;
			var html = "";
			
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
			
			html +='<tr class ='+i+'>';
			html +='<td align="right" colspan ="2"><input type=button value="삭제" id="selectDel"></td>';
			html +='</tr>';
			
			$j('#myTable').append(html);
			console.log("현재 tr의 갯수는? :"+count);
		});
		
		$j(document).on("click","#formDel", function(){
			console.log("제거전 i 의 값은? : "+ i);
			msg ="테이블을 삭제하시겠습니까? (맨 밑 테이블이 삭제됩니다.)";
			if(i > 0){
				pop = confirm(msg)
				if(pop == true){
					var test1 = document.getElementsByTagName('tr');
					var delclass = $j(test1[test1.length-1]).attr('class');
					$j("."+delclass).remove();
					i -= 1;
					if(i > 0){
						count = $j("tr").length;
					}
				}
			}
		});
		
		$j(document).on("click","#selectDel",function(){
			var msg = "정말 삭제하시겠습니까?";
			var pop = confirm(msg);
			if(pop == true){
				var aa = $j(this).closest('tr')
				var dd = aa.attr("class")
				$j("."+dd).remove();
			}
		});
		
		$j(document).on("click","#test1",function(){
			var aaa = $j("#myTable").children();
			var sss = aaa.attr("class");
			console.log(aaa);
			console.log(sss);
		})
	});

</script>
<body>
<form class="makeGoods" onsubmit=check();>
	<table border ="1" id ='myTable' align='center'>
		<thead>
		<tr>
			<td align="right" colspan ="2">
				<input type="button" value="상품등록 삭제" id="formDel">
				<input type="button" VALUE="상품등록 추가" id="addForm">
			</td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td width="120" align="center">
				기획전
			</td>
			<td width="400">
				${view.s_title }
				<input type="hidden" id="s_num" value="${view.s_num }">
			</td>
		</tr>
		<tr>
			<td>
				상품명
			</td>
			<td>
				<input type="text" id="g_Name">
			</td> 
		</tr>
		<tr>
			<td>
				가격
			</td>
			<td>
				<input type="text" id="g_Price">
			</td>
		</tr>
		<tr>
			<td>
				제품 분류
			</td>
			<td>
				<input type="text" id="g_Class">
			</td>
		</tr>
		<tr>
			<td>
				제품 대표 이미지
			</td>
			<td>
				<input type="file" id="g_Img">
			</td>
		</tr>
		<tr>
			<td>
				색상
			</td>
			<td>
<!-- 				<select id="g_Class" > -->
<%-- 					<c:forEach items="" var=""> --%>
					
<%-- 					</c:forEach> --%>
<!-- 				</select> -->
			</td>
		</tr>
		<tr>
			<td>
				할인율
			</td>
			<td>
				<input type="text" id="g_Sale">
			</td>
		</tr>
		<tr>
			<td>
				제품 정보
			</td>
			<td>
				<textarea rows="10" cols="100" id="g_Info"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				제품 상세 이미지
			</td>
			<td>
				<input type="file" id="g_Inimg">
			</td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<td>
				<input id="submit" type="button" value="작성">
				<input type="button" value="리스트" onclick="location.href='/special/list.do'">
			</td>
		</tr>
		</tfoot>
	</table>
</form>	
</body>



</html>