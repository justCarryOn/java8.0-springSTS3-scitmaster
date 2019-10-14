<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" type="text/css" href="<c:url value="/css/default.css" />" />
</head>
<body>
<script>
	function boardUpdate() {
		if(confirm("수정 하시겠습니까?")) {
			var updateForm = document.getElementById("updateForm");
			updateForm.submit();
		}
	}
</script>
<h1>[ 글 수정 ]</h1>
<form action="/web/board/boardUpdate" id="updateForm" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>번호</th>
			<td>${vo.boardNum}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.userid}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${vo.inputdate}</td>
		</tr>
		<tr>
			<th>조회</th>
			<td>${vo.hit}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="title" value="${vo.title}">
			</td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td>
				<a href="/web/board/download?boardNum=${vo.boardNum}">${vo.originalFileName }</a>
				<input type="file" name="uploadFile">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content">${vo.content}</textarea>
			</td>
		</tr>
		<tr>
			<td class="right" colspan="2">
				<input type="button" value="수정" onclick="boardUpdate()">
				<a href=""><input type="button" value="취소"></a>
			</td>
		</tr>
	</table>
	<input type="hidden" name="boardNum" value="${vo.boardNum}">
	<input type="hidden" name="savedFileName" value="${vo.savedFileName}">
</form>
</body>
</html>










