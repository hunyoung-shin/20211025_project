<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ �߰� ������</title>
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
		// ���� �ʿ�
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
			html +='<td align="right" colspan ="2"><input type=button value="����" id="selectDel"></td>';
			html +='</tr>';
			
			$j('#myTable').append(html);
			console.log("���� tr�� ������? :"+count);
		});
		
		$j(document).on("click","#formDel", function(){
			console.log("������ i �� ����? : "+ i);
			msg ="���̺��� �����Ͻðڽ��ϱ�? (�� �� ���̺��� �����˴ϴ�.)";
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
			var msg = "���� �����Ͻðڽ��ϱ�?";
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
		<tr>
			<td align="right" colspan ="2">
				<input type="button" value="��ǰ��� ����" id="formDel">
				<input type="button" VALUE="��ǰ��� �߰�" id="addForm">
				<input id="submit" type="button" value="�ۼ�">
				<input type="button" value="����Ʈ" onclick="location.href='/special/list.do'">
			</td>
		</tr>
		<tr>
			<td width="120" align="center">
				��ȹ��
			</td>
			<td width="400">
				��ȹ�� �� -> �� ����(s_title�� ��������, ���� s_num)
			</td>
		</tr>
		<tr>
			<td>
				��ǰ��
			</td>
			<td>
				text
			</td> 
		</tr>
		<tr>
			<td>
				����
			</td>
			<td>
				text
			</td>
		</tr>
		<tr>
			<td>
				��ǰ �з�
			</td>
			<td>
				(selectbox)
			</td>
		</tr>
		<tr>
			<td>
				��ǰ ��ǥ �̹���
			</td>
			<td>
				(multipartfile)
			</td>
		</tr>
		<tr>
			<td>
				����
			</td>
			<td>
				(selectbox)
			</td>
		</tr>
		<tr>
			<td>
				������
			</td>
			<td>
				%
			</td>
		</tr>
		<tr>
			<td>
				��ǰ ����
			</td>
			<td>
				text
			</td>
		</tr>
		<tr>
			<td>
				��ǰ �� �̹���
			</td>
			<td>
				(multipartfile)
			</td>
		</tr>
	</table>
</form>	
</body>



</html>