<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>주소읽기</title>
</head>
<body>
	<h1>[주소등록]</h1>
	<form name="frm" action="update" method="post">
		<input type="hidden" name="id" value="${vo.id}">
		<table border=1>
			<tr>
				<td width=100>Name:</td>
				<td width=400><input type="text" name="name" value="${vo.name}"></td>
			</tr>
			<tr>
				<td width=100>Address:</td>
				<td width=400><input type="text" name="address" value="${vo.address}"></td>
			</tr>
			<tr>
				<td width=100>Tel:</td>
				<td width=400><input type="text" name="tel" value="${vo.tel}"></td>
			</tr>
		</table>
		<input type="submit" value="수정">
		<input type="button" value="삭제" id="btnDelete">
		<input type="reset" value="취소">
		<input type="button" value="목록" onClick="location.href='list'">
	</form>
</body>
<script>
	$("#btnDelete").on("click", function(){
		if(!confirm("삭제하시겠습니까?")) return;
		frm.action="delete";
		frm.submit();
	});
	
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?")) return;
		frm.submit();
	})
</script>
</html>