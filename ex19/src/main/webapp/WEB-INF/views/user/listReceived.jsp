<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>받은 메시지 목록</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
<jsp:include page="../menu.jsp"/>
	<h1>[받은메시지]</h1>
	<div style="margin-bottom: 10px;">
		<table border=1>
			<tr>
				<td>받은이:<span id="name">${vo.name}</span></td>
				<td>포인트:<span id="point">${vo.point}</span>점
				</td>
			</tr>
		</table>
		<table id="tbl" border=1 width=500></table>
 	<script id="temp" type="text/x-handlebars-template">
		<tr>
			<td>no</td>
			<td>sender</td>
			<td>message</td>
			<td>view</td>
		</tr>
 		{{#each .}}
 			<tr class=row {{printStyle readDate}}>
 				<td class="mid" width=20>{{mid}}</td>
 				<td style="font-size:8pt;"><b>{{uname}} - {{receiver}}</b></td>
 				<td>{{message}}</td>
				<td><button>view</button></td>
 			</tr>
 		{{/each}}
 	</script>
	</div>
	<div style="background:gray;color:white;margin:0px 10px 0px 10px;padding:10px;width:500px;" id="divR">
		Sender:<span id="sender"></span><br>
		Message:<span id="message"></span><br>
		Send Date:<span id="sendDate"></span><br>
		Read Date:<span id="readDate"></span><br>
	</div>
</body>
<script>
	var id="${vo.id}";
	
	getList();
	
	$("#divR").hide();
	
	$("#divMessage").hide();
	
	Handlebars.registerHelper("printStyle", function(readDate){
		var src;
		if(readDate==null) src="style=color:red";
		return src
	})
	
	$("#tbl").on("click", ".row button", function(){
		var mid=$(this).parent().parent().find(".mid").html();
		$.ajax({
			type:"get",
			url:"/message/read",
			data:{"mid":mid},
			dataType:"json",
			success:function(data){
				$("#sender").html(data.sender + ":" + data.name);
				$("#message").html(data.message);
				$("#sendDate").html(data.sendDate);
				$("#readDate").html(data.readDate);
				$("#divR").show();

				$.ajax({
					type:"get",
					url:"/user/getUser",
					data:{"id":id},
					dataType:"json",
					success:function(data){
						$("#point").html(data.point);
					}
				})
				getList();
				
			}
		})
	});
	
	function getList() {
		id = "${vo.id}"
		
		$.ajax({
			type : "get",
			url : "/list/received",
			data : {
				"id" : id
			},
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
			}
		});
	}
</script>
</html>