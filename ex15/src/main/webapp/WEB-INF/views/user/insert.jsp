<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>유저등록</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		input[type=file]{visibility:hidden; height:0px}
		#listFile img {width:150px;margin-left:20px; }
	</style>
</head>
<body>
	<h1>[유저등록]</h1>
	<form name="frm" action="insert" method="post" enctype="multipart/form-data">
		<table border=1>
			<tr>
				<td width=100>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td width=100>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td width=100>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td width=100>대표이미지</td>
				<td width=400>
					<input type="file" name="file">
					<img id="image" src="http://placehold.it/150x120" width=150>
				</td>
			</tr>
			<tr>
				<td width=100>
					<input type="button" value="추가이미지" id="btnImage">
				</td>
				<td width=400 height=150>
					<input type="file" name="files" accept="image/*" multiple>
					<div id="listFile"></div>
				</td>
			</tr>
		</table>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
		<input type="button" value="목록">
	</form>
</body>
<script>
	$("#btnImage").on("click", function() {
		$(frm.files).click();
	});
	$(frm.files).change(function() {
		var files = $(frm.files)[0].files;
		var html = "";
		$.each(files, function(index, file) {
			html += "<img src='" + URL.createObjectURL(file) + "'>";
			$('#listFile').html(html);
		});
	});

	$("#image").on("click", function() {
		$(frm.file).click();
	});

	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file))
	})
</script>
</html>