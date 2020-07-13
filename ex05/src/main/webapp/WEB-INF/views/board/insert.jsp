<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form name="frm" action="insert" method="post">
		<table class="tbl" border=1 width=500>
			<tr>
				<td width=100>제목</td>
				<td><input type="text" name="title" size=50></td>
			</tr>
			<tr>
				<td width=100>내용</td>
				<td><textarea rows="10" cols="52" name="content"></textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" value="user00" readonly
					size=10></td>
			</tr>
		</table>
		<input type="submit" value="저장"> <input type="reset"
			value="취소"> <input type="button" value="목록"
			onClick="location.href='list'">
	</form>
</body>
</html>