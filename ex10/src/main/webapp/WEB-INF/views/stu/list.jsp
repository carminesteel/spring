<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	.active{color:black;font-weight:bold}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생목록</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

</head>
<body>
	<h1>학생목록</h1>
	학생수 : ${pm.totalCount}
	<input type="text" class=curPage value="">
	<table border=1 id="tbl" style="border-collapse: collapse;">
		<tr>
			<td>학번</td>
			<td>이름</td>
			<td>학과</td>
			<td>학년</td>
			<td>생일</td>
			<td>교수이름</td>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr class="row">
				<td class="scode">${vo.scode}</td>
				<td>${vo.sname}</td>
				<td>${vo.dept}</td>
				<td>${vo.year}</td>
				<td>${vo.birthday}</td>
				<td>${vo.pname}(${vo.advisor})</td>
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

	$("#tbl").on("click",".row", function(){
		var scode=$(this).find(".scode").html();
		var page=$(".active").html();
		location.href="read?scode="+scode+"&page="+page;
	});
		

	$("#pagination a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "list?page=" + page;
	});
</script>
</html>