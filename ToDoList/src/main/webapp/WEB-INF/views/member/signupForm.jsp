<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/default.css"/>" />
<script>
	function checkidForm() {
		open("checkidForm", "_blank", "width=500, height=200");
	}
</script>
</head>
<body>
<div id="wrap">
	<h1 class="title">회원가입</h1>
	<div class="menu">
		<form action="signup" method="post">
			<table>
				<tr>
					<td>아이디 :</td>
					<td><input type="text" id="userid" name="userid" maxlength="5" required="required" readonly="readonly"></td>
					<td><input type="button" name="checkid" value="중복확인" onclick="checkidForm()"></td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="userpwd" maxlength="5" required="required"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="username" required="required"></td>
				</tr>
				<tr class="btn">
					<td class="btn">
						<input type="submit" id="submitBtn" value="가입" disabled="disabled">
					</td>
					<td colspan="2" class="btn">
						<a href="<c:url value="/"/>"><input type="button" value="취소"></a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

</body>
</html>
