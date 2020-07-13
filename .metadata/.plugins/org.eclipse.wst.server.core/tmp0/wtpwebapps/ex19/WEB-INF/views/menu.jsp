<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div id="divMenu">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:if test="${id!=null}">
	<span class="item"><a href="/account/list?id=${id}">������</a></span>
	<span class="item"><a href="/user/listReceived?id=${id}">�����޼�����</a></span>
	<span class="item"><a href="/user/listSend?id=${id}">�����޼�����</a></span>
		<span class="item">
			${id}����
			<a href="/user/logout">�α׾ƿ�</a>
		</span>
	</c:if>
	<c:if test="${id==null}">
		<span class="item">
			<a href="/user/login">�α���</a>
		</span>
	</c:if>	
</div>
<hr>