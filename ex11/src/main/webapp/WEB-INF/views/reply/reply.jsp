<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글목록</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<div id="divInput">
	댓글수 : <span id="count"></span>
      <input type="text" id="txtReply" size=15>
      <button id="btnInsert">입력</button>
   </div>
	<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">
	{{#each	list}}
		<div class="replydate">{{replyDate}}<button rno={{rno}}>삭제</button></div>
		<div class="reply">{{reply}}</div>
		<div class="replyer">{{replyer}}</div>
	{{/each}}
	</script>
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
</body>
<script>
	var bno = "${vo.bno}";
	
	getList();
	
	function getList() {
		$.ajax({
			type : "get",
			url : "/reply/list",
			data : {"bno":bno},
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				$("#count").html(data.count);
			}
		});
	}

	
	$("#txtReply").keydown(function(key){
		if(key.keyCode==13){
			$("#btnInsert").click();
		}
	})
	
	$("#tbl").on("click", ".replydate button", function(){
		var rno=$(this).attr("rno");
		if(!confirm(rno + "댓글을 삭제?")) return;
		$.ajax({
			type : "post",
			url : "/reply/delete",
			data : {"rno":rno},
			success : function() {
				alert("삭제!");
				getList();
				
			}
		});
	});


	$("#btnInsert").on("click", function(){
		var reply=$("#txtReply").val();
		if(reply==""){
			alert("댓글 내용을 입력하세요!");
			return;
		}
		var replyer="user01";
		$.ajax({
			type : "post",
			url : "/reply/insert",
			data : {"bno":bno,"reply":reply,"replyer":replyer},
			success : function() {
				getList();
				alert("댓글입력!");
				$("#txtReply").val("");
				
			}
		});
	});
	
	
</script>
</html>