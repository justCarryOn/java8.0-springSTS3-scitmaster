<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoList</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/todolist.css"/>" />
</head>
<body>
<div id="wrap">
	<div id="input form">
		<h1 class="title">${sessionScope.userid}님 todo List</h1>
		<div class="menu">
			<form action="insertTodolist" method="post">
				<table>
					<tr>
						<td class="left"><fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 (E)"/></td>
						<td></td>
						<td class="left">
							<input type="button" value="전체조회">
							<input type="button" value="기간조회">
							<input type="button" value="백업">
						</td>
					</tr>
					<tr>
						<td class="center">할 일</td>
						<td class="center">중요도</td>
						<td>기간</td>
					</tr>
					<tr>
						<td class="center">
							<input type="text" name="tododata" required="required"><br>
							<input type="text" name="comments" placeholder="Comment">
						</td>
						<td class="center">
							<input type="radio" name="importance" value="good">상
							<input type="radio" name="importance" value="average">중
							<input type="radio" name="importance" value="poor">하
						</td>
						<td>
							<input type="date" id="deadline" name="deadline" min="<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>">
							<input type="submit" value="등록" >
						</td>
					</tr>
				</table>
			</form>
		</div>
		
	</div> <!-- input form end -->
	<hr>
	<div id="print form">
		<table>
			<c:forEach items="${cnt}" var="regCount">
				<c:set var="endNum" value="${startNum + regCount - 1}" />
			<tr>
				<th><fmt:formatDate value="${list[endNum].regdate}" pattern="yyyy년 MM월 dd일 (E)"/></th>
				<th>중요도</th>
				<th>기간</th>
				<th colspan="2">결과</th>
			</tr>
				<c:forEach items="${list}" var="vo" begin="${startNum}" end="${endNum}" varStatus="status">
					<tr>
						<td>
							${vo.tododata}<br>
							<input type="text" value="${vo.comments}" placeholder="Comment" disabled="disabled">
						</td>
						<td class="center">
							<c:choose>
								<c:when test="${vo.importance == 'good'}">상</c:when>
								<c:when test="${vo.importance == 'average'}">중</c:when>
								<c:when test="${vo.importance == 'poor'}">하</c:when>
							</c:choose>
						</td>
						<td class="center">${vo.deadline}</td>
						<td class="center">
							<input type="radio" name="result" disabled="disabled"> 완료
							<input type="radio" name="result" disabled="disabled"> 실패
							<input type="radio" name="result" disabled="disabled"> 보류
						</td>
						<td>
							<input type="button" value="삭제">
							<input type="button" value="수정">
						</td>
					</tr>
				<c:set var="startNum" value="${status.index + 1}" />
				</c:forEach>
			</c:forEach>
		</table>
	</div> <!-- print form end -->
</div> <!-- wrap end -->
</body>
</html>
