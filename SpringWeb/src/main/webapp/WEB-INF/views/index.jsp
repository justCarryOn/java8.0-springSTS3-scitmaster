<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>parameter 전송</title>
</head>
<body>
	<a href="send5">model 객체 실습</a><br>
	<c:if test="${data != null && vo != null}">
		test : ${data}<br>
		vo.a : ${vo.a}<br>
		vo.b : ${vo.b}<br>
		requestScope.data : ${requestScope.data}<br>
		requestScope.vo.a : ${requestScope.vo.a}<br>
		requestScope.vo.b : ${requestScope.vo.b}<br>
	</c:if>

	<img src="resources/img/write_64.png" />
	<img src="/web/resources/img/write_64.png" />
	<img src='<c:url value="/resources/img/write_64.png"/>' />
	<img src="abcdef/write_64.png" />
	<ul>
		<li><h2><a href="send1?a=테스트&b=2222">a 태그로 전송</a></h2></li>
		<li>
			<h2>form 태그로 전송(get)</h2>
			<form action="send2" method="get">
				a <input type="text" name="a"><br>
				b <input type="text" name="b"><br>
				<input type="submit" value="전송!">
			</form>
		</li>
		<li>
			<h2>form 태그로 전송(post)</h2>
			<form action="send3" method="post">
				a <input type="text" name="a"><br>
				b <input type="text" name="b"><br>
				<input type="submit" value="전송!">
			</form>
		</li>
		<li>
			<h2><a href="send4?a=테스트&b=2222">a 태그로 전송(VO)</a></h2>
		</li>
		<li>
			<h2>form 태그로 전송(get / VO)</h2>
			<form action="send4" method="get">
				a <input type="text" name="a"><br>
				b <input type="text" name="b"><br>
				<input type="submit" value="전송!">
			</form>
		</li>
		<li>
			<h2>form 태그로 전송(post / VO)</h2>
			<form action="send4" method="post">
				a <input type="text" name="a"><br>
				b <input type="text" name="b"><br>
				<input type="submit" value="전송!">
			</form>
		</li>
	</ul>
</body>
</html>
