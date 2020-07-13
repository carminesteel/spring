<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>통장목록</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>
	<h1>[통장 목록]</h1>
	<table border=1 width=600>
		<tr>
			<th width=100>계좌번호</th>
			<th width=130>계좌주명</th>
			<th width=180>개설일</th>
			<th width=100>잔액</th>
			<th width=100>거래내역</th>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.ano}</td>
				<td>${vo.name}</td>
				<td><fmt:formatDate value="${vo.openDate}" pattern="yyyy년 MM월 dd일"/></td>
				<td><fmt:formatNumber value="${vo.balance}" pattern="#,###" /></td>
				<td><button onClick="location.href='read?ano=${vo.ano}'">거래내역</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
