<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서노트</title>
</head>
<body>

<div id="wrapper">
<h1>[ 개인 독서 노트 ]</h1>
	<c:if test="${sessionScope.loginId == null }">
		<a href="login">로그인</a><br>
	</c:if>
	<c:if test="${sessionScope.loginId != null }"> 
		<a href="logout">${sessionScope.loginName }님, 로그아웃</a><br />
	</c:if> 
	<a href="reading">내 독서노트</a>
</div>
</body>
</html>