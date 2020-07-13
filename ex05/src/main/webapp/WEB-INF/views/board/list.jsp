<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<style>
		.row:hover{background:gray; color:white;}
		.row{cursor:pointer;}
		a{text-decoration:none;}
		a{color:green;}
		.active{color:red;}
	</style>
</head>
<body>
	<h1>게시판 목록</h1>
	<a href="insert">글쓰기</a>
	검색수 : <span>${pm.totalCount}</span>
	
	<form name="frm" action="list">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="bno">
		<select name="searchType">
			<option value="title" <c:out value="${cri.searchType=='title'?'selected':''}"/>>제목</option>
			<option value="writer" <c:out value="${cri.searchType=='writer'?'selected':''}"/>>작성자</option>
			<option value="content"<c:out value="${cri.searchType=='content'?'selected':''}"/>>내용</option>
		</select>
		<input type="text" name="keyword" value="${cri.keyword}">
		<input type="submit" value="검색">
	</form>
	<table border=1 id="tbl">
		<tr>
			<td width=100>글번호</td>
			<td width=150>제목</td>
			<td width=150>내용</td>
			<td width=150>작성자</td>
			<td width=150>게시일</td>
			<td width=150>수정일</td>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="bno">${vo.bno}</td>
			<td>${vo.title}</td>
			<td>${vo.content}</td>
			<td>${vo.writer}</td>
			<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy년MM월dd일"/></td>
			<td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy년MM월dd일"/></td>
		</tr>
		</c:forEach>
	</table>
	<div id="pagination">
		<c:if test="${pm.prev}">
			<a href="${pm.startPage-1}">◀</a>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:if test="${cri.page==i}">
				<a href="${i}" class="active">[${i}]</a>
			</c:if>
			<c:if test="${cri.page!=i}">
				<a href="${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${pm.next}">
			<a href="${pm.endPage+1}">▶</a>
		</c:if>
	</div>
</body>
<script>

	$(frm).submit(function(){
		$(frm.page).val(1);
	});


	$("#pagination").on("click", "a", function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		$(frm.page).val(page);
		frm.submit();
	});

	$(".row").on("click", function(){
		var bno=$(this).find(".bno").html();
		$(frm.bno).val(bno);
		frm.action="read";
		frm.submit();
	});
</script>
</html>