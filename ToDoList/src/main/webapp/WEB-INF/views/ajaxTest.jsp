<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link>
<meta charset="UTF-8">
<title>ajaxTest</title>
<script src="<c:url value="/js/jquery-3.4.1.js"/>"></script>
<script>
	$(function() {
		$("#btn1").on("click", test1);
		$("#btn2").on("click", test2);
		$("#btn3").on("click", test3);
		$("#btn4").on("click", test4);
		$("#btn5").on("click", test5);
		$("#btn6").on("click", test6);
		$("#btn7").on("click", test7);
		$("#btn8").on("click", test8);
	});
	
	function test1() {
		$.ajax({
			url: "test1",
			type: "get",
			data: {"id":$("#id").val(), "name":$("#name").val()},
			success: function() { alert("성공"); },
			error: function() { alert("에러 발생"); }
		});
	}
	
	function test2() {
		$.ajax({
			url: "test2",
			type: "post",
			data: {"id":$("#id").val(), "name":$("#name").val()},
			success: function() { alert("성공"); },
			error: function() { alert("에러 발생"); }
		});
	}
	
	function test3() {
		$.ajax({
			url: "test3",
			type: "post",
			contentType : "application/json; charset=utf-8",
			data: JSON.stringify({"id":$("#id").val(), "name":$("#name").val()}),
			success: function() { alert("성공"); },
			error: function() { alert("에러 발생"); }
		});
	}
	
	function test4() {
		$.ajax({
			url: "test6",
			type: "post",
			contentType : "application/json; charset=utf-8",
			data: JSON.stringify([1,'a','하하']),
			success: function() { alert("성공"); },
			error: function() { alert("에러 발생"); }
		});
	}
	
	function test5() {
		$.ajax({
			url: "test5",
			type: "post",
			data: $("#test5").serialize(),
			success: function() { alert("성공"); },
			error: function() { alert("에러 발생"); }
		});
	}
	
	function test6() {
		$.ajax({
			url: "test6",
			type: "post",
			dataType: "json",
			success: function(result) {
				$(result).each(function(index, item) {
					$("#li").append("<tr><td>" + item.id + "</td><td>" + item.name + "</td></tr>");
				});
			},
			error: function() { alert("에러 발생"); }
		});
	}
	
	function test7() {
		$.ajax({
			url: "test7",
			type: "post",
			dataType: "json",
			success: function(result) {
				$("#li").append("<tr><td>" + result.id + "</td><td>" + result.name + "</td></tr>");
			},
			error: function() { alert("에러 발생"); }
		});
	}
	
	function test8() {
		$.ajax({
			url: "test8",
			type: "post",
			dataType: "json",
			success: function(result) {
				$(result).each(function(index, item) {
					$("#li").append("<tr><td>" + item.id + "</td><td>" + item.name + "</td></tr>");
				});
			},
			error: function() { alert("에러 발생"); }
		});
	}
	
	function test9() {
		var form = $("#uploadForm")[0];
		var formData = new FormData(form);
		
		$.ajax({
			url: "test9",
			type: "post",
			data: formData,
			contentType: false,
			processData: false,
			success: function() { alert("성공"); },
			error: function() { alert("에러 발생"); }
		});
	}
</script>
</head>
<body>
	<form id="test5">
		ID : <input type="text" id="id" name="id"><br>
		NAME : <input type="text" id="name" name="name"><br>
	</form>
	
	<input type="button" id="btn1" value="파라미터 전송"><br>
	<input type="button" id="btn2" value="VO객체 전송"><br>
	<input type="button" id="btn3" value="Map객체 전송"><br>
	<input type="button" id="btn4" value="List객체 전송"><br>
	<input type="button" id="btn5" value="직렬화 전송"><br>
	<input type="button" id="btn6" value="JSON(List) 수신"><br>
	<input type="button" id="btn7" value="JSON(Map) 수신"><br>
	<input type="button" id="btn8" value="JSON(List + Map) 수신"><br>
	
	<div>
		<table id="li">
		<tr>
			<th>ID</th>
			<th>NAME</th>
		</tr>
		</table>
	</div>
<hr>	
	<form id="uploadForm">
		ID<input type="text" name="id"><br>
		NAME<input type="text" name="name"><br>
		<input type="file" name="uploadFile"><br>
		<input type="button" value="파일 전송" onclick="test9()">
	</form>
</body>
</html>
