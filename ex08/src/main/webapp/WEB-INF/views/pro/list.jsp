<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	a:{text-decoration:none;}
	.active{color:orange;}
	select{height:200}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<title>교수목록</title>
</head>
<body>
	<h1>교수목록</h1>
	<table border=1 id="tbl1" style="border-collapse: collapse;">
		<tr>
			<td width=100>교번</td>
			<td width=100>성명</td>
			<td width=100>학과</td>
			<td>수강신청</td>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr class="row">
				<td class="pcode">${vo.pcode}</td>
				<td class="pname">${vo.pname}</td>
				<td>${vo.dept}</td>
				<td><button>수강신청</button></td>
			</tr>
		</c:forEach>
	</table>
	<!--
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
	-->
	<div id="courses">
		<span id="pcode"></span>
		<span id="pname"></span>		
		<select id="lcode">
			<c:forEach items="${clist}" var="vo">
				<option value="${vo.lcode}">${vo.lname}</option>
			</c:forEach>
		</select>		
		<input type="button" value="신청" id="btnInsert">
	</div>
	<hr>
	<table id="tbl" border=1 style="border-collapse:collapse;"></table>
	<script id="temp" type="text/x-handlebars-template">
	<tr>
		<th width=100>강좌이름</th>
		<th width=200>수강신청인원</th>
		<th width=100>시수</th>
		<th width=100>강의실</th>
		<th width=100>취소</th>
	</tr>
	{{#each clist}}
	<tr class="row">
		<td class="{{lcode}}">{{lname}}</td>
		<td>{{persons}}</td>
		<td>{{hours}}</td>
		<td>{{room}}</td>
		<td><button>취소</button></td>
	</tr>
	{{/each}}
	<br>
	<tr>
		<th width=100>학생이름</th>
		<th width=200>생년월일</th>
		<th width=100>학년</th>
		<th width=100>학과</th>
		<th width=100>취소</th>
	</tr>

	{{#each slist}}
	<tr class="row">
		<td class="{{scode}}">{{sname}}</td>
		<td>{{birthday}}</td>
		<td>{{year}}</td>
		<td>{{dept}}</td>
		<td><button>취소</button></td>
	</tr>
	{{/each}}
	</script>
	
	
</body>
<script>
	var pcode, pname;
	
	$("#courses").hide();
	
	
	$("#tbl1").on("click",".row button", function(){
		var row=$(this).parent().parent();
		pcode=row.find(".pcode").html();
		pname=row.find(".pname").html();
		$("#pcode").html(pcode);
		$("#pname").html(pname);
		$("#courses").show();
		getList();
	});
	
	function getList(){
		$.ajax({
			type:"get",
			url:"/pro/plist",
			data:{"pcode":pcode},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
                $("#tbl").html(temp(data));
			}
		});
	}
	
	$("#pagination a").click(function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		location.href="list?page="+page;
	});
</script>
</html>