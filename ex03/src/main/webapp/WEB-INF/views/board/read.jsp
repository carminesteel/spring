<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글읽기</title>
</head>
<body>
	<h1>[게시글읽기]</h1>
	<form name="frm1" action="list">
		<input type="text" name="page" value="${cri.page}">
		<input type="text" name="searchType" value="${cri.searchType}">
		<input type="text" name="keyword" value="${cri.keyword}">
	</form>
	<form name="frm" action="update" method="post">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="text" name="searchType" value="${cri.searchType}">
		<input type="text" name="keyword" value="${cri.keyword}">
		<input type="hidden" name="bno" value="${vo.bno}">
		<table class="tbl" border=1 width=500>
			<tr>
				<td width=100>제목</td>
				<td><input type="text" name="title" size=50 value="${vo.title}"></td>
			</tr>
			<tr>
				<td width=100>내용</td>
				<td><textarea rows="10" cols="52" name="content">${vo.content}</textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" size=10 value="${vo.writer}">
				</td>
			</tr>
		</table>
		<input type="submit" value="수정">
		<input type="button" id=btnDelete value="삭제">  
		<input type="reset" value="취소"> 
		<input type="button" value="목록" id="btnList">
	</form>
</body>
<script>
	$("#btnList").on("click", function(){

		frm1.submit();
	})

	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?")) return;
		frm.submit();
	});
	
	$("#btnDelete").on("click", function(){
		if(!confirm("삭제하시겠습니까?")) return;
		frm.action="delete";
		frm.submit();
	})
</script>
</html>