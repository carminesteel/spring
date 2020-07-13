<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>주소록</title>
</head>
<body>
	<h1>주소록</h1>
	<table border=1>
		<tr>
			<td width=100>Name:</td>
			<td width=400><input type="text" id="name"></td>
		</tr>
		<tr>
			<td width=100>Address:</td>
			<td width=400><input type="text" id="address" size=50></td>
		</tr>
		<tr>
			<td width=100>Tel:</td>
			<td width=400><input type="text" id="tel"></td>
		</tr>
	</table>
	<input type="button" value="입력" id="btnInsert">
	<hr>
	<table id="tbl" border=1></table>
	<script id="temp" type="text/x-handlebars-template"> 
	<tr>
		<th width=50>No.</th>
		<th width=100>Name</th>
		<th width=200>Address</th>
		<th width=100>Telephone</th>
		<th width=100>수정/삭제</th>
	</tr>
	{{#each list}}
	<tr class="row">
		<td class="id">{{id}}</td>
		<td><input class="name" type="text" value="{{name}}" size=10></td>
		<td><input class="address" type="text" value="{{address}}" size=50></td>
		<td><input class="tel" type="text" value="{{tel}}" size=20></td>
		<td>
			<button class="btnUpdate">수정</button>
			<button class="btnDelete">삭제</button>
		</td>
	</tr>
	{{/each}}
	</script>
</body>
<script>
	getList();

	function getList(){
		$.ajax({
			type:"get",
			url:"/add/rest/list",
			dataType:"json",
			success:function(data){
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));	
			}
		});		
	}
	
	$("#btnInsert").on("click", function(){
		if(!confirm("저장하시겠습니까?")) return;
		
		var name=$("#name").val();
		var address=$("#address").val();
		var tel=$("#tel").val();
		$.ajax({
			type:"post",
			url:"/add/rest/insert",
			data:JSON.stringify({"name":name,"address":address,"tel":tel}),
			contentType:"application/json;charset=UTF-8",
			success:function(){
				getList();
			}		
		});
	});
	
	$("#tbl").on("click",".row .btnUpdate", function(){
		if(!confirm("수정하시겠습니까?")) return;
		
		var row=$(this).parent().parent();
		var id=row.find(".id").html();
		var name=row.find(".name").val();
		var address=row.find(".address").val();
		var tel=row.find(".tel").val();
		
		$.ajax({
			type:"post",
			url:"/add/rest/update",
			data:{"name":name,"address":address,"tel":tel,"id":id},
			success:function(){
				getList();
			}		
		});
	});
	
	$("#tbl").on("click",".row .btnDelete", function(){
		if(!confirm("삭제하시겠습니까?")) return;
		
		var row=$(this).parent().parent();
		var id=row.find(".id").html();
		
		$.ajax({
			type:"post",
			url:"/add/rest/delete",
			data:{"id":id},
			success:function(){
				alert("삭제되었습니다")
				getList();
			}		
		});
	});
</script>
</html>