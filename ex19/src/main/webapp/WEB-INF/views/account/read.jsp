<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>통장내역</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
<jsp:include page="../menu.jsp"/>
	<h1>[통장 내역]</h1>
	<table border=1 width=600>
		<tr>
			<td>계좌번호</td>
			<td id="ano">${vo.ano}</td>
			<td>성명</td>
			<td>${vo.name}</td>
			<td>잔액</td>
			<td>
				<input id="balance" type="text" value="${vo.balance}" size=5 readonly>
			</td>
		</tr>
	</table>
	<div style="border:1px dotted;width:580px;margin-top:20px;padding:10px;margin-bottom:20px;">
		<span>이체정보 : </span>
		<select>
			<c:forEach items="${list}" var="vo">
			<c:if test="${vo.ano!=param.ano}">
				<option id="tradeNo" value="${vo.ano}">${vo.ano}:${vo.name}</option>
			</c:if>
			</c:forEach>			
		</select>
		<input type="text" id="amount">
		<button id="btnInsert">이체</button> 
	</div >
		
	<table id="tbl" border=1></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr>
			<td>계좌번호</td>
			<td>이름</td>
			<td>입금/출금</td>
			<td>거래금액</td>
			<td>거래일</td>
		</tr>
		{{#each .}}
		<tr {{printStyle type}}>
			<td>{{ano}}</td>
			<td>{{name}}</td>
			<td>{{printType type}}</td>
			<td>{{amount}}</td>
			<td>{{tradeDate}}</td>
		</tr>
		{{/each}}
	</script>
	<div style="margin-top:10px;"><button onClick="location.href='list'">통장목록</button></div>
</body>
<script>
	Handlebars.registerHelper("printStyle", function(type){
		var src;
		if(type=="1") src="style=color:red";
		return src;
	})
	
	Handlebars.registerHelper("printType", function(type){
		var src;
		if(type=="1") src="출금";
		else src="입금";
		return src;
	})

	getList();

	$("#btnInsert").on("click",function(){
		if(!confirm("이체하실래요?")) return;
		var ano=$("#ano").html();
		var tradeNo=$("#tradeNo").val();
		var amount=$("#amount").val();
		var balance=$("#balance").html();
		var type="1";
		
		alert(amount + balance)
		
		if(amount>balance){
			alert("잔액이 부족합니다!");
			return;
		}
		
		$.ajax({
			type:"post",
			url:"/trade/insert",
			data:{"ano":ano,"tradeNo":tradeNo,"amount":amount,"type":type},
			success:function(){
				alert("이체완료");
				$("#amount").val("");
				$.ajax({
					type:"get",
					url:"/account/getBalance",
					data:{"ano":ano},
					success:function(data){
						$("#balance").html(data.balance);
					}
				})
				getList()
			}
		})
	})
	
	function getList(){
		var ano=${param.ano}
		$.ajax({
			type:"post",
			url:"/trade/list",
			data:{"ano":ano},
			success:function(data){
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
			}
		})
	}
</script>
</html>
