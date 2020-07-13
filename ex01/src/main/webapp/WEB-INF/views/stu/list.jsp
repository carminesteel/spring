<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>students list</title>
</head>
<body>
   <h1>Students List</h1>
   <a href="insert">입력</a>
   <table border=1>
      <tr>
         <td>학생번호</td>
         <td>학생이름</td>
         <td>학생학과</td>
         <td>학년</td>
         <td>지도교수번호</td>
         <td>지도교수이름</td>
      </tr>
      <c:forEach items="${list}" var="vo">
      <tr>
         <td>${vo.scode}</td>
         <td>${vo.sname}</td>
         <td>${vo.dept}</td>
         <td>${vo.year}</td>
         <td>${vo.advisor}</td>
         <td>${vo.pname}</td>
      </tr>
      </c:forEach>
   </table>
</body>
</html>