<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강좌목록</title>
</head>
<body>
	<h1>[강좌목록]</h1>
	<table id=tbl1 border=1>
		<tr>
			<th width=100>강좌번호</th>
			<th width=300>강좌이름</th>
			<th width=100>담당교수</th>
			<th width=100>수강학생</th>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr class="row">
				<td class="lcode">${vo.lcode}</td>
				<td class="lname">${vo.lname}</td>
				<td>${vo.pname}</td>
				<td><button>수강학생</button></td>
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
		<div id="courses">
			<span id="lcode"></span>
			<span id="lname"></span>
		</div>
	</div>
	<table border=1 id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
	<tr>
		<th width=100>학생번호</th>
		<th width=200>학생이름</th>
		<th width=100>신청일</th>
		<th width=100>점수</th>
	</tr>
	{{#each .}}
	<tr class="row">
		<td class="scode">{{scode}}</td>
		<td>{{sname}}</td>
		<td>{{edate}}</td>
		<td>
			<input type="text" class = grade value="{{grade}}" size=2>
			<button class=btnUpdate>수정</button>
		</td>
	</tr>
	{{/each}}
	</script>
</body>
<script>
	var lcode, row, lname, scode;
	
	$("#tbl1").on("click", ".row button",function(){
		row=$(this).parent().parent();
		lcode=$(this).parent().parent().find(".lcode").html();
		lname=$(this).parent().parent().find(".lname").html();
		$("#lcode").html(lcode);
		$("#lname").html(lname);
		getList();
	});
	
	$("#tbl").on("click", ".row .btnUpdate",function(){
		
		row=$(this).parent().parent()
		var grade=$(this).parent().find(".grade").val();	
		var scode=row.find(".scode").html();
		alert(lcode+scode+grade)
		if(grade>100||grade<0){
			alert("점수는 100점 이내로 입력해주세요!")
		}else{
		$.ajax({
			type:"post",
			url:"/enroll/update",
			data:{"lcode":lcode,"scode":scode,"grade":grade},
			success:function(){
	            getList();
				alert("good")
				}
			});
		}		
	});
	

	function getList(){
		$.ajax({
			type:"get",
			url:"/cou/rest/slist",
			data:{"lcode":lcode},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
	            $("#tbl").html(temp(data));
			}
		});
	}
	
	$("#pagination a").click(function(e){
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "list?page=" + page;
	});
</script>
</html>