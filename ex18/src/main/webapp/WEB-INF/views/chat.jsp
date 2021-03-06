<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta charset="UTF-8">
<title>채팅</title>
<style>
* {
	font-size: 10px;
}

body {
	overflow: hidden;
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	background: #D4F4FA;
}

#container {
	overflow: auto;
	height: 87%;
	margin: 0px;
}

.content {
	overflow: hidden;
	width: 100%;
}

.content_left {
	float: left;
	margin: 5px;
	padding: 7px;
	border-radius: 5px 5px 5px 5px;
	background: white;
}
.content_right {
	float: right;
	margin: 5px;
	padding: 7px;
	border-radius: 5px 5px 5px 5px;
	background: yellow;
}
#bottom {
	position: fixed;
	height: 10%;
	left: 0px;
	right: 0px;
	bottom: 0px;
	padding-top: 15px;
	text-align: center;
}
#txtMessage {
	width: 70%;
	height: 25px;
	margin: 0px;
}
#btnSend {
	height: 25px;
	margin: 0px;
}
small {
	cursor: pointer;
	color: red;
}
.sdate {
	font-size: 8px;
	color: blue;
}
</style>
</head>
<body>
	<div id="container"></div>
	<div id="bottom">
		<b><span id="userid">${id}</span></b>
		<input type="text" id="txtMessage">
		<input type="button" value="Enter" id="btnSend">
	</div>
</body>
<script>
	if($("#userid").html()==""){
		$("#userid").html("Guest");
	}
	
	$("#btnSend").on("click", function(){
		if($("#txtMessage").val()==""){
			alert("내용을 입력하세요!")
		}
	})
	
	$("#txtMessage").keydown(function(key){
		if(key.keyCode==13){
			$("#btnSend").click();
		}
	})
	
	//websocket 관련 프로그램//
	var webSocket = new WebSocket("ws://localhost:8088/websocket");
</script>
</html>