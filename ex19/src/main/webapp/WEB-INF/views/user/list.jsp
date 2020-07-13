<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자목록</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1 id="vos">${vos}</h1>
	<h1>사용자목록</h1>
	<table border=1 style=border-collapse:collapse>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>성명</td>
			<td>point</td>
			<td>보낸메시지</td>
			<td>받은메시지</td>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr>
			<td class="id">${vo.id}</td>
			<td>${vo.pass}</td>
			<td class="name">${vo.name}</td>
			<td>${vo.point}</td>
			<td><button class=btnSend>보낸메시지</button></td>
			<td><button class=btnReceived>받은메시지</button></td>
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