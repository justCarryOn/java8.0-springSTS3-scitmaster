<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script >
function login() {
	var userid = document.getElementById("userid");
	var userpwd = document.getElementById("userpwd");
	if (userid.value == '' || userpwd.value.length == 0) {
		alert('ID와 비밀번호를 입력하세요.');
		userid.focus();
		return;
	}
	var form = document.getElementById("loginForm");
	form.submit();
}
</script>
<style>
div#message {
	color :red;
}
</style>
</head>
<body>
<h2>[ 로그인 ]</h2>
<div id="message">${message }</div>
<form id="loginForm" action="login" method="post">
<table>
<tr>
	<td>아이디</td>
	<td><input type="text" id="userid" name="userid" placeholder="3~10 자리 ID 입력" />
	</td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" id="userpwd" name="userpwd" placeholder="3~10자리 비밀번호 입력"></td>
</tr>
<tr>
	<td colspan="2" >
	<input type="button" value="로그인" onclick = "login();"/>
	</td>
</table>
</form>
</body>
</html>
