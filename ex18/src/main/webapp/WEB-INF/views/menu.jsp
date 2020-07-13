<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="divMenu" style="width:800px;padding:10px;background:white;">
	<button onClick="location.href='/board/insert'">
		글쓰기
	</button>
	<c:if test="${id != null}">
		${id}님
		<button onClick="location.href='/user/logout'">로그아웃</button>
	</c:if>
	<c:if test="${id == null }">
		<button onClick="location.href='/user/login'">로그인</button>
	</c:if>
</div>