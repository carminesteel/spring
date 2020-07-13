<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<title>게시판 목록</title>
<style>
	a: {text-decoration: none;}	
	.active {color: orange;}	
	select {height: 200;}
</style>
</head>
<body>
	<h1>[Board List]</h1>
	전체글수 : ${pm.totalCount}
	<input type="text" class=curPage value="">
	<table border=1 id="tbl" style="border-collapse: collapse;">
		<tr>
			<td width=180>제목</td>
			<td width=250>내용</td>
			<td width=70>글쓴이</td>
			<td width=180>등록일</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${list}" var="vo">		
			<tr class="row">						
				<td class="title"><input type="hidden" class="bno" value="${vo.bno}">${vo.title}[${vo.replycnt}]</td>
				<td class="content">${vo.content}</td>
				<td class="writer">${vo.writer}</td>
				<td class="regdate"><fmt:formatDate value="${vo.regdate}"
						pattern="yyyy년 MM월 dd일" /></td>
				<td class="viewcnt">${vo.viewcnt}</td>
			</tr>
		</c:forEach>
	</table>
	<div id="pagination">
		<c:if test="${pm.prev}">
			<a href="${pm.startPage-1}">◀</a>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:if test="${pm.cri.page == i }">
                [<a href="${i}" class='active'>${i}</a>]
            </c:if>
			<c:if test="${pm.cri.page != i }">
                [<a href="${i}">${i}</a>]
            </c:if>
		</c:forEach>
		<c:if test="${pm.next}">
			<a href="${pm.endPage+1}">▶</a>
		</c:if>
	</div>
</body>
<script>
	var row,bno,curPage;
	
	var curPage=$(".active").html();
	$(".curPage").val(curPage);

	$("#pagination a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "list?page=" + page;
	});
	
	$("#tbl .row").on("click", function(){
		bno=$(this).find(".bno").val();
		location.href = "read?bno=" + bno +"&page=" + curPage
	})
</script>
</html>