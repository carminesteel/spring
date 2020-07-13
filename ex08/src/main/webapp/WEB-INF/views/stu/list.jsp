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

<title>학생목록</title>
</head>
<body>
	<h1>학생목록</h1>
	<table border=1 id="tbl1" style="border-collapse: collapse;">
		<tr>
			<td width=100>학번</td>
			<td width=100>성명</td>
			<td width=100>학과</td>
			<td>수강신청</td>
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
	<div id="courses">
		<span id="scode"></span>
		<span id="sname"></span>		
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
		<th width=100>강좌번호</th>
		<th width=200>강좌이름</th>
		<th width=100>수강신청일</th>
		<th width=100>점수</th>
		<th width=100>취소</th>
	</tr>
	{{#each .}}
	<tr class="row">
		<td class="lcode">{{lcode}}</td>
		<td>{{lname}}</td>
		<td>{{edate}}</td>
		<td>{{grade}}</td>
		<td><button>취소</button></td>
	</tr>
	{{/each}}
	</script>
</body>
<script>
	var scode, sname;
	
	$("#courses").hide();
	
	$("#tbl").on("click", " .row button", function(){
		var lcode=$(this).parent().parent().find(".lcode").html();
		if(!confirm(scode + lcode + "을(를) 취소하시겠습니까?")) return;
		$.ajax({
			type:"post",
			url:"/enroll/delete",
			data:{"scode":scode, "lcode":lcode},
			success:function(){
				alert("취소완료!");
				getList();
			}
		})
	});
		
	$("#tbl1").on("click",".row button", function(){
		var row=$(this).parent().parent();
		scode=row.find(".scode").html();
		sname=row.find(".sname").html();
		$("#scode").html(scode);
		$("#sname").html(sname);
		$("#courses").show();
		getList();
	});
	
	$("#btnInsert").click(function(){
		var lcode=$("#lcode").val();
		if(!confirm(scode + lcode + "을(를) 신청하시겠습니까?")) return;		
		$.ajax({
			type:"post",
			url:"/enroll/insert",
			data:{"scode":scode,"lcode":lcode},
			success:function(count){
				if(count==0){
					alert("신청완료");
					getList();
				}else{
					alert("이미 신청된 강좌입니다.");				
				}				
			}
		})
	});
	
	function getList(){
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
	}
	
	$("#pagination a").click(function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		location.href="list?page="+page;
	});
</script>
</html>