<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>학생목록</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>학생목록</h1>
	<table id="stbl" border=1>
		<tr>
			<th width=100>학생번호</th>
			<th width=100>학생이름</th>
			<th width=100>학생학과</th>
			<th width=100>수강신청</th>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="scode">${vo.scode}</td>
			<td class="sname">${vo.sname}</td>
			<td>${vo.dept}</td>
			<td><button>수강신청</button></td>
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
	<hr>
	<div>
		<span id="scode"></span>
		<span id="sname"></span>
	</div>
	<table id="tbl" border=1></table>
	<script id="temp" type="text/x-handlebars-template">
	<tr>
		<th width=100>강좌번호</th>
		<th width=200>강좌명</th>
		<th width=100>점수</th>
	</tr>
	{{#each array}}
	<tr class="row">
		<td>{{lcode}}</td>
		<td>{{lname}}</td>
		<td>{{grade}}</td>
	</tr>
	{{/each}}
	</script>
</body>
<script>
	$("#stbl").on("click",".row button", function(){
		var row=$(this).parent().parent();
		var scode=row.find(".scode").html();
		var sname=row.find(".sname").html();
		$("#scode").html(scode);
		$("#sname").html(sname);
		$.ajax({
			type:"get",
			url:"/stu/rest/elist",
			data:{"scode":scode},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
                $("#tbl").html(temp(data));
			}
		});
	});
	
	$("#pagination a").click(function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		location.href="list?page="+page;
	});
</script>
</html>