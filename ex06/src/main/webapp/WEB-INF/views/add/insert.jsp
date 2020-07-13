<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소입력</title>
</head>
<body>
	<h1>[주소등록]</h1>
	<form action="insert" method="post">
		<table border=1>
			<tr>
				<td width=100>Name:</td>
				<td width=400><input type="text" name="name"></td>
			</tr>
			<tr>
				<td width=100>Address:</td>
				<td width=400><input type="text" name="address"></td>
			</tr>
			<tr>
				<td width=100>Tel:</td>
				<td width=400><input type="text" name="tel"></td>
			</tr>
		</table>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
	</form>
</body>
</html>