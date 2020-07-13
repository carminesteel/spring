<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크롤링 결과</title>
 </style>
 	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
	img{width:250px;}
</style>
</head>
<body>
	<h1>[다음날씨]</h1>
	<div id="daum">
		<span id="today"></span> <span id="weather"></span>
	</div>
	<h1>[네이버 거래상위]</h1>
	<div id="naver"></div>
	<span id="stock"></span>

	<h1>[CGV 영화차트]</h1>
	<div id="movie"></div>
	<span id="poster"></span>
	<br>
	<span id="movieInfo"></span>
</body>
<script>
	getWeather();
	getStock();
	getMovie();
	
	
	var weather=[];
	
	function getWeather(){
		$.ajax({
			type : "get",
			url : "/weather.json",
			dataType : "json",
			success : function(data) {
				$("#today").html(data.date);
				var i=0;
				$(data.array).each(function(){
					var part=this.part;
					var ico=this.ico;
					var temper=this.temper;
					var wa=this.wa;
					console.log(part + ico + temper + wa);
					weather[i]=part + "" + ico + "" + temper + "" + wa
					i++;
				});
				
				i=0
				var interval=setInterval(function(){
					$("#weather").html(weather[i]);
					if(i<weather.length-1){
						i++;
					}else{
						i=0;
					}
				},2000);
			}
		})	
	}
	
	var stock=[];
	
	function getStock(){
		$.ajax({
			type : "get",
			url : "/stock.json",
			dataType : "json",
			success : function(data) {
				var i=0;
				$(data.array).each(function(){
					var title=this.title;
					var no1=this.no1;
					var no2=this.no2;
					var no3=this.no3;
					stock[i]=title + "" + no1 + "" + no2 + "" + no3
					i++;
				});
				
				i=0
				var interval=setInterval(function(){
					$("#stock").html(stock[i]);
					if(i<stock.length-1){
						i++;
					}else{
						i=0;
					}
				},1500);
			}
		})	
	}
	
	var mov=[];
	var pos=[];
	
	function getMovie(){
		$.ajax({
			type : "get",
			url : "/movie.json",
			dataType : "json",
			success : function(data) {
				var i=0;
				$(data.array).each(function(){
					var rank=this.rank;
					var title=this.title;
					var date=this.date;
					var image=this.image;
					mov[i]=rank + "" + title +  "" + date
					pos[i]=image
					i++;
				});
				
				i=0
				var interval=setInterval(function(){
					$("#movieInfo").html(mov[i]);
					$("#poster").html("<img src="+pos[i]+">");
					if(i<mov.length-1){
						i++;
					}else{
						i=0;
					}
				},0.1);
			}
		})	
	}
</script>
</html>