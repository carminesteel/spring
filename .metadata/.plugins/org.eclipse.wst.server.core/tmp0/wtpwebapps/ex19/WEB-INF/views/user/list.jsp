<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����ڸ��</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1 id="vos">${vos}</h1>
	<h1>����ڸ��</h1>
	<table border=1 style=border-collapse:collapse>
		<tr>
			<td>���̵�</td>
			<td>��й�ȣ</td>
			<td>����</td>
			<td>point</td>
			<td>�����޽���</td>
			<td>�����޽���</td>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr>
			<td class="id">${vo.id}</td>
			<td>${vo.pass}</td>
			<td class="name">${vo.name}</td>
			<td>${vo.point}</td>
			<td><button class=btnSend>�����޽���</button></td>
			<td><button class=btnReceived>�����޽���</button></td>
		</tr>
		</c:forEach>
	</table>
</body>
<script>
	$("#vos").on("click", function(){
		session.invalidate();
	})

	var id, name, row;
	$(".btnSend").on("click",function(){
		row=$(this).parent().parent();
		var id=row.find(".id").html();
		var name=row.find(".name").html();
		location.href="listSend?id="+id
	})
	
	$(".btnReceived").on("click",function(){
		row=$(this).parent().parent();
		var id=row.find(".id").html();
		var name=row.find(".name").html();		
		location.href="listReceived?id="+id
	})
</script>
</html>