<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<title>댓글목록</title>
<style>
a {
	text-decoration: none;
	color: green;
}


#condition {
	border: 1px dotted;
	width: 690px;
	background: gray;
	color: white;
	padding: 5px;
}

.content {
	width: 500;
	background: white;
	color: black;
	margin: 10px;
	padding: 10px;
	margin: auto;
	
}

.replyDate {
	font-size: px;
	font-weight: bold;
}
</style>
</head>
<body>
	<h1>[댓글목록]${pm.totalCount}</h1>
	<form action="insert" method="post">
		<input type="hidden" name="bno" value="1">
		<input type="hidden" name="replyer" value="user01">
		<input type="text" name="reply" size=50>
		<input type="submit" value="입력">
	</form>
	<c:forEach items="${list}" var="vo">
		<div class="content">
			<div class="replyDate">
				<span class="rno">${vo.rno}</span> <span> ${vo.replyDate}
					<button>삭제</button>
				</span>
			</div>
			<div class="reply">${vo.reply}</div>
		</div>
	</c:forEach>

	<nav aria-label="Page navigation example">
	<ul class="pagination" style="text-align: center; margin: auto">
		<li class="page-item">
			<c:if test="${pm.prev}">
				<a class="page-link" href="${pm.startPage-1}">Previous</a>
			</c:if>
		</li>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">			
			<c:if test="${pm.cri.page==i}">
				<li class="page-item">
					<a class="page-link" href="${i}">${i}</a>
				</li> 
			</c:if>
			<c:if test="${pm.cri.page!=i}">
				<li class="page-item">
					<a class="page-link" href="${i}">${i}</a>
				</li> 
			</c:if>
		</c:forEach>
		<li class="page-item">
			<c:if test="${pm.next}">
				<a class="page-link" href="${pm.endPage+1}">Next</a>
			</c:if>
		</li>
	</ul>
	</nav>

</body>
<script>
	$(".replyDate").on("click", "button", function() {
		var rno = $(this).parent().parent().find(".rno").html();
		if (!confirm(rno + "을(를)삭제하시겠습니까?"))
			return;
		location.href = "delete?rno=" + rno;
	});

	$(".pagination").on("click", ".page-item .page-link", function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "list?page=" + page;	
	});
	
	$("#pagination").on("click", "a", function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "list?page=" + page;
	});

	$(frm).submit(function() {
		$(frm.page).val(1)
	})

	$(".page-item").on("click", "a", function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "list?page=" + page;
	});

	$(".row").on("click", function() {
		var bno = $(this).find(".bno").html();
		$(frm.bno).val(bno);
		frm.action = "read";
		frm.submit();
	});
</script>
</html>