<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>주소목록</title>
</head>
<body>
	<h1>[주소목록]</h1>
	<button onClick="location.href='insert'">입력</button>
	<table border=1>
		<tr>
			<th width=50>No.</th>
			<th width=100>Name</th>
			<th width=300>Address</th>
			<th width=200>tel</th>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="id">${vo.id}</td>
			<td class="name">${vo.name}</td>
			<td class="address">${vo.address}</td>
			<td class="tel">${vo.tel}</td>
		</tr>
		</c:forEach>
	</table>
</body>
<script>
	$(".row").on("click", function(){
		var id=$(this).find(".id").html();
		alert(id)
		location.href="read?id="+id;
	});
</script>
</html>