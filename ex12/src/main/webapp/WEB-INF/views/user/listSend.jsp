<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>보낸메시지</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>보낸메시지</h1>
	<table border=1 style="border-collapse: collapse">
		<tr>
			<td>보낸이:</td>
			<td><span id=name>${vo.name}</span>&nbsp;포인트:${vo.point}<span id="point"></span>점</td>
		</tr>
		<tr>
			<td>받는이:</td>
			<td><select id="receiver">
					<c:forEach items="${list}" var="vo">
						<c:if test="${vo.id!=param.id}">
							<option value="${vo.id}">${vo.id} - ${vo.name}</option>
						</c:if>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>내용:</td>
			<td><input type="text" size=50 id="message"></td>
		</tr>
	</table>
	<input type="button" value="보내기" id="btnSend">
	<table id="tbl" border=1 width=500></table>	
 	<script id="temp" type="text/x-handlebars-template">
		<tr>
			<td>no</td>
			<td>receiver</td>
			<td>message</td>
			<td>view</td>
		</tr>
 		{{#each .}}
 			<tr>
 				<td width=20>{{mid}}</td>
 				<td style="font-size:8pt;"><b>{{uname}}-{{receiver}}</b></td>
 				<td>{{message}}</td>
				<td><button>view</button></td>
 			</tr>
 		{{/each}}
 	</script>
</body>
<script>
	var id;
	getList();
	
	$("#btnSend").on("click", function(){
		var sender=id;
		var receiver=$("#receiver").val();
		var message=$("#message").val();
		if(message==""){
			alert("메세지를 입력하세요");
			$("#message").focus();
			return;
		}
		$.ajax({
			type:"post",
			url:"/message/insert",
			data:{"sender":sender,"receiver":receiver,"message":message},
			success:function(){
				alert("전송완료");
				$("#message").val("");
				getList();
			}
		})
	})
	
	function getList(){
		id="${vo.id}"
		
		$.ajax({
			type:"get",
			url:"/list/send",
			data:{"id":id},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
	            $("#tbl").html(temp(data));
			}
		});
	}
</script>
</html>