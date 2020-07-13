<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생읽기</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

</head>
<body>
	<h1>학생읽기</h1>
	<form name="frm" action="update" method="post">
		<input type="hidden" name="page" value="${param.page}">
		<table border=1>
			<tr>
				<th width=100>학생번호</th>
				<th width=100><input type="text" name="scode" value="${vo.scode}"></th>
			</tr>
			<tr>
				<th width=100>학생이름</th>
				<th width=100><input type="text" name="sname" value="${vo.sname}"></th>
			</tr>
			<tr>
				<th width=100>학생학과</th>
				<th width=100>				
					<select name="dept">
						<option <c:out value="${vo.dept=='전산'?'selected':''}"/>>전산</option>
						<option <c:out value="${vo.dept=='전자'?'selected':''}"/>>전자</option>
						<option <c:out value="${vo.dept=='건축'?'selected':''}"/>>건축</option>
					</select>				
				</th>
			</tr>
				
			</tr>
			<tr>
				<th> 학생학년 </th>
				<td><input type="text" name="year" value="${vo.year}"></td>
			</tr>
			<tr>
				<th> 생년월일 </th>
				<td><input type="text" name="birthday" value="${vo.birthday}"></td>
			</tr>
			<tr>
				<th> 지도교수 </th>
				<th width=100>	
					<input type="text" name="advisor" value="${vo.advisor}" size=8>			
					<select name="pname">
						<c:forEach items="${plist}" var="vo">
							<option value="${vo.pcode}">${vo.pname}</option>
						</c:forEach>
					</select>				
				</th>
			</tr>
		</table>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
		<input type="button" id="btnDel" value="삭제">
		<input type="button" id="btnList" value="목록">
	</form>
	<div>
		<select id="lcode">
			<c:forEach items="${clist }" var="vo">
				<option value="${vo.lcode }">${vo.lname }</option>
			</c:forEach>
		</select>
		<input type=button id="btnInsert" value="수강신청">
	</div>
	<table id="tbl" border=1></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr>
			<th width=100>Code</th>
			<th width=100>courseName</th>
			<th width=180>regDate</th>
			<th width=150>grade</th>
		</tr>
		{{#each list}}
		<tr class="row">
			<td class="lcode">{{lcode}}</td>
			<td>{{lname}}</td>
			<td>{{edate}}</td>
			<td>
				<input type="text" class="grade" value="{{grade}}" size=1>
				<button class="btnUpdate">수정</button>
				<button class="btnDelete">삭제</button>
			</td>
		</tr>
		{{/each}}
	</script>
	<div id="chart">
		<jsp:include page="chart.jsp"/>
	</div>
</body>
<script>
	
	var scode="${vo.scode}";
	
	getList();
	
	$("#btnInsert").on("click", function(){
		var lcode=$("#lcode").val();
		$.ajax({
			type:"get",
			url:"/enroll/read",
			data:{"scode":scode,"lcode":lcode},
			success:function(data){
				if(data==0){
					$.ajax({
						type:"post",
						url:"/enroll/insert",
						data:{"scode":scode,"lcode":lcode},
						success:function(){
							getList();	
							changeChart();
						}
					})
				}else{
					alert("이미 수강신청!")
				}
			}
		});		
	});
	
	$("#tbl").on("click",".row .btnDelete", function(){
		var lcode=$(this).parent().parent().find(".lcode").html();
		
		$.ajax({
			type:"post",
			url:"/enroll/delete",
			data:{"scode":scode,"lcode":lcode},
			success:function(){
				alert("삭제 완료!");
				getList();			
				changeChart();
			}
		});
	});
	
	
	$("#tbl").on("click",".row .btnUpdate", function(){
		var row=$(this).parent().parent();
		var lcode=row.find(".lcode").html();
		var grade=row.find(".grade").val();
		$.ajax({
			type : "post",
			url : "/enroll/update",
			data : {"scode":scode,"lcode":lcode,"grade":grade},
			success : function() {
				alert("수정완료!");
				getList();
				changeChart();
			}
		});
	})
	
	function getList() {
		var scode=$(frm.scode).val();
		$.ajax({
			type : "get",
			url : "/stu/listEnroll",
			data : {"scode":scode},
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
			}
		});
	}

	$(frm.pname).change(function(){
		var pcode=$(frm.pname).val();
		$(frm.advisor).val(pcode);
	})
	
	
	
	$("#btnList").on("click",function(){
		var page=$(frm.page).val();
		location.href="/stu/list?page="+page	
	})
	
</script>
</html>