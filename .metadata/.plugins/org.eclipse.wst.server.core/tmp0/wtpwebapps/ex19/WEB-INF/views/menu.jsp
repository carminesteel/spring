<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div id="divMenu">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:if test="${id!=null}">
	<span class="item"><a href="/account/list?id=${id}">내통장</a></span>
	<span class="item"><a href="/user/listReceived?id=${id}">받은메세지함</a></span>
	<span class="item"><a href="/user/listSend?id=${id}">받은메세지함</a></span>
		<span class="item">
			${id}입장
			<a href="/user/logout">로그아웃</a>
		</span>
	</c:if>
	<c:if test="${id==null}">
		<span class="item">
			<a href="/user/login">로그인</a>
		</span>
	</c:if>	
</div>
<hr>