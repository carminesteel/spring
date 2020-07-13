<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<title>게시판 목록</title>

</head>
<body>
	<h1>[Board Read]</h1>
	<form name="frm" action="update" method="post">
		<input type="text" name="page" value="${param.page}">
		<table border=1 style=border-collapse:collapse;>
			<tr>
				<th>Title</th>
				<td><input type="text" name="title" value="${vo.title}" size=50></td>
			</tr>
			<tr>
				<th>Writer</th>
				<td><input type="text" name="writer" value="${vo.writer}" size=50></td>
			</tr>
			<tr>
				<th>Date</th>
				<td><input type="text" name="regdate" value="${vo.regDate}" size=50></td>
			</tr>
			<tr>
				<td colspan=2>
					<textarea rows="10" cols="80" name="content">${vo.content}</textarea>
				</td>
			</tr>
		</table>
		<input type="button" id="btnUpdate" value="수정">
		<input type="reset" id="btnCancel" value="취소">
		<input type="button" id="btnDelete" value="삭제">
		<input type="button" id="btnList" value="목록">
		<input type="text" name="bno" value="${vo.bno}">
	</form>
	<hr>
	<jsp:include page="../reply/reply.jsp"/>
</body>
<script>
	var page=$(frm.page).val();
	var title, content, writer, bno;

	$("#btnList").on("click", function(){
		location.href="/board/list?page="+ page;
	});
	/*
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?")) return;
		frm.submit();
	});
	*/
	
	$("#btnUpdate").on("click", function(){
		title=$(frm.title).val()
		writer=$(frm.writer).val()
		content=$(frm.content).val()
		bno=$(frm.bno).val();
		if(!confirm("수정하시겠습니까?")) return;
			$.ajax({
				type:"post",
				url:"/board/update",
				data:{"title":title,"content":content,"writer":writer,"bno":bno, "page":page},
				error:function(){
					alert("zzz그거아닌데");
				},
				success:function(){					
					alert("good")
					location.href="/board/list?page="+page;
					}
				});
	});
	
		
	$("#btnDelete").on("click", function(){
		bno=$(frm.bno).val();
		if(!confirm("삭제하시겠습니까?")) return;
			$.ajax({
				type:"get",
				url:"/board/delete",
				data:{"bno":bno},
				dataType:"json",
				success:function(cnt){
					alert(cnt);
					if(!cnt==0){
						alert("댓글이 있기 때문에 삭제 불가")
					}else{
					alert("good 삭제완료")
					location.href="/board/list?page="+page;
				}
				}
		});
	})
</script>
</html>