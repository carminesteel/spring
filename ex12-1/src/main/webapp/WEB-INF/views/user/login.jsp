<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>로그인</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>
	<h1>[로그인]</h1>
	<form action="login" method="post" name="frm">
		<table width=300 border=1>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="id" size=10></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" size=10></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
<script>


	
	$(frm).submit(function(e){
		var id=$(frm.id).val();
		var pass=$(frm.pw).val();
		e.preventDefault();
		$.ajax({
			type:"post",
			url:"/user/login",
			data:{"id":id,"pass":pass},
			success:function(data){
				
				if(data==0){
					alert("아이디가 존재하지 않습니다.");
				}else if(data==1){
					alert("비밀번호가 틀립니다")
				}else{
					alert("성공");
					location.href="/";
				}
			}
		})
	})
	
</script>

</html>