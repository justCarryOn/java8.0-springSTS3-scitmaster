<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/default.css"/>" />
</head>
<body>
<div id="wrap">
	<h1 class="title">로그인</h1>
	<div class="menu">
		<form action="login" method="post">
			<table>
				<tr>
					<td>
						아이디:
					</td>
					<td>
						<input type="text" name="userid" required="required">
					</td>
					<td>
						<input type="checkbox" name="saveuserid">아이디 저장
					</td>
				</tr>
				<tr>
					<td>
						비밀번호:
					</td>
					<td>
						 <input type="password" name="userpwd" required="required">
					</td>
				</tr>
				<tr>
					<td class="btn">
						<input type="submit" value="로그인">
					</td>
					<td class="btn" colspan="2">
						<a href="<c:url value="/"/>"><input type="button" value="취소"></a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>
