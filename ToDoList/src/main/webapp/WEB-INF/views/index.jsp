<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link>
<meta charset="UTF-8">
<title>Todo List</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/default.css"/>" />
</head>
<body>
<div id="wrap">
	<h1 class="title">Todo List</h1>
	<div class="menu">
		<table>
		<c:choose>
			<c:when test="${sessionScope.userid == null }">
			<tr>
				<td>
					<a href="member/signupForm">회원가입</a><br>
				</td>
			<tr>
				<td>
					<a href="member/loginForm">로그인</a><br>
				</td>
			</tr>
			<tr>
				<td>
					<a href="ajaxTest">AJAX test</a><br>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr>
				<td>
					<a href="member/logout">로그아웃</a><br>
				</td>
			</tr>
			<tr>
				<td>
					<a href="member/withdrawForm">탈퇴</a><br>
				</td>
			</tr>
			<tr>
				<td>
					<a href="tlist/todolist">todo 리스트 작성</a><br>
				</td>
			</tr>
			</c:otherwise>
		</c:choose>
		</table>
	</div>
</div>
</body>
</html>
