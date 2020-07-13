<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>댓글목록</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		.divContent{width:500px;padding:10px;margin-bottom:10px;
			background:gray;color:white;border:1px solid black;
			font-size:10px;}
		#divInput{width:500px;padding:10px;margin-bottom:10px;
			background:gray;color:white;font-size:10px;}	
		button{font-size:10px;}
	</style>
</head>
<body>
	<div id="divInput">
		게시글수:<span id="count"></span>&nbsp;&nbsp;
		<input type="text" id="txtReply" size=50>
		<button id="btnInsert">입력</button>
	</div>
	<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
		<div class="divContent">
			<div class="replydate">
				{{replydate}}
				[<b>{{replyer}}</b>]
				<button rno={{rno}}>삭제</button>
			</div>
			<div class="reply">{{reply}}</div>
		</div>
	{{/each}}
	</script>
</body>
<script>
	var bno="${vo.bno}";
	
	$("#tbl").on("click", ".replydate button", function(){
		var rno=$(this).attr("rno");
		if(!confirm(rno+" 를(을) 삭제하시겠습니까?")) return;
		
		$.ajax({
			type:"post",
			url:"/reply/delete",
			data:{"rno":rno},
			success:function(){
				getList();
				alert("똥을 삭제했습니다~");
			}
		});
	});
	
	$("#txtReply").keydown(function(key){
		if(key.keyCode==13){
			$("#btnInsert").click();
		}	
	});
	
	$("#btnInsert").on("click", function(){
		var reply=$("#txtReply").val();
		if(reply=="") {
			alert("댓을 내용을 입력하세요!");
			return;
		}
		var replyer="user00";
		$.ajax({
			type:"post",
			url:"/reply/insert",
			data:{"bno":bno, "reply":reply, "replyer":replyer},
			success:function(){
				getList();
				$("#txtReply").val("");
				alert("똥이 입력되었습니다.");
			}
		});
	});
	
	getList();
	function getList(){
		$.ajax({
			type:"get",
			url:"/reply/list",
			data:{"bno":bno},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
                $("#tbl").html(temp(data));
                $("#count").html(data.count);
			}
		});
	}
</script>
</html>