<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 목록</title>
</head>
<body>
	<h1>[게시판 목록]</h1>
	<a href="insert">입력</a>
   <table class=tbl border=1 width=700>
      <tr>
         <th>번호</th>
         <th>제목</th>
         <th>작성자</th>
         <th>작성일</th>
         <th>수정날짜</th>
      </tr>
      <c:forEach items="${list}" var="vo">
      <tr class="row">
         <td class="bno">${vo.bno}</td>
         <td>${vo.title}</td>
         <td>${vo.writer}</td>
         <td><fmt:formatDate value="${vo.regdate}" pattern="yyyy년 MM월 dd일"/></td>
         <td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy년 MM월 dd일"/></td>
      </tr>
      </c:forEach>
   </table>
</body>
<script>
	$(".row").on("click",function(){
		var bno=$(this).find(".bno").html();
		alert(bno);
		location.href="read?bno="+bno;
	});
</script>
</html>
