<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교수등록</title>
</head>
<body>
	<h1>[교수등록]</h1>
	<form action="insert" method="post">
		<table border=1>
			<tr>
				<td width=100>학번</td>
				<td width=100><input type="text" name="pcode"></td>
			</tr>
			<tr>
				<td width=100>학생이름</td>
				<td width=100><input type="text" name="pname"></td>
			</tr>
		</table>
		<input type="submit" value="입력">
		<input type="reset" value="취소">
	</form>
</body>
</html>