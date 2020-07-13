<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
 	.box { width:100px;height:150px;padding:5px;margin:5px;background:gray;color:white;float:left; font-size:15px; }
 	a { color:pink;}
 </style>
 	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>상품목록</h1>	
	<div style="width: 480px; background: yellow; overflow: hidden;">
		<c:forEach items="${list}" var="vo">
			<div class="box">
				<c:if test="${vo.image!=null && vo.image!=''}">
					<img src="/display?fileName=${vo.image}" width=100>
				</c:if>
				<c:if test="${vo.image==null || vo.image==''}">
					<img src="http://placehold.it/100x80" width=100>
				</c:if>
				<div>
					<a href="read?id=${vo.id}">${vo.id}</a>
				</div>
				<div>${vo.name}</div>
			</div>
		</c:forEach>
	</div>
	<button onclick="location.href='insert'">사용자등록</button>
</body>
</html>