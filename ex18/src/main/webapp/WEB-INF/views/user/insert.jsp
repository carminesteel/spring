<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>로그인</title>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<h1>[회원가입]</h1>
	<form name="frm" action="insert" method="post">
		<table border=1 width=400>
			<tr>
				<td width=150>회원 아이디</td>
				<td>
					<input type="text" name="id" size=10>
					<a href="#" id="btnCheck">[중복확인]</a>
				</td>
			</tr>
			<tr>
				<td width=150>회원 비밀번호</td>
				<td><input type="password" name="pass" size=20></td>
			</tr>
			<tr>
				<td width=150>회원 성명</td>
				<td><input type="text" name="name" size=20></td>
			</tr>
		</table>
		<input type="submit" value="가입">
		<input type="reset"	value="취소">
	</form>
</body>
<script>
	var check=false;
	$(frm).submit(function(e){
		e.preventDefault();
		if(!check){
			alert("아이디 중복체크 하세요!")
		}else{
			frm.submit();
		}	
	});
	
	$(frm.id).change(function(){
		check=false;
	});

	$("#btnCheck").on("click", function(e){
		var id=$(frm.id).val();
		e.preventDefault();
		$.ajax({
			type:"post",
			url:"/user/login",
			data:{"id":id},
			success:function(data){
				if(data!=0){
					alert("이미 존재하는 아이디입니다.")
					$(frm.id).focus();
				}else{
					alert("사용가능한 아이디입니다.");
					check=true;
				}
			}
		});
	});
</script>
</html>