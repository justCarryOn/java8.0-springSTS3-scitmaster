<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 책장</title>
<link href="resources/main.css" rel="stylesheet" /> 
<script src="resources/jquery-3.3.1.min.js"></script>
<script>
var bookno = '';

$(function() {
	init();
	$("#bookRegist").on('click', bookregist);
	$(".del").on('click', bookdelete);
	$("#searchbtn").on('click', search);
	$("#cancel").on('click', function(){
		$("#bookRegist").val("독서평 등록");
	})
});

// 초기화
function init() {
	
	$.ajax({
		type:'GET'
		, url : 'readingList'
		, success : output
	})
}
	
// 독서노트 검색 
function search() {
	var shelfname = $("#myshelfname").val();
	$.ajax({
		type : 'GET'
		, url : 'searchshelf'
		, data : "shelfname="+shelfname
		, success : output
	});
}

function output(resp) {
	$("#bookRegist").val("독서평 등록");
	var	tag = '<tr>'
		tag += '<th>책장명</th>'
		tag += '<th>책이름</th>'
		tag += '<th>저자</th>	'	
		tag += '<th>출판사</th>'
		tag += '<th>구매날짜</th>'
		tag += '<th>책가격</th>'
		tag += '<th class="review">독서평</th>'
		tag += '<th>삭제</th>'
		tag += '</tr>'
		
 	$.each(resp, function(index, item){
		tag += '<tr class="result">'
		tag += '<td>'+item.shelfname+'</td>'
		tag += '<td>'+item.btitle+'</td>'
		tag += '<td>'+item.writer+'</td>'		
		tag += '<td>'+item.publisher+'</td>'
		tag += '<td>'+item.purchasedate+'</td>'
		tag += '<td>'+item.price+'</td>'
		tag += '<td><pre>'+item.bookreview+'</pre></td>'
		tag += '<td><input class="del" data-value="'+item.booknum+'" type="button" value="삭제"  />'
		tag += '    <input class="update"  data-value="'+item.booknum+'" type="button" value="수정"  />'
		tag += '</td>'
		tag += '</tr>'
	})
	$("#book ").html(tag);
	$(".del").on('click', bookdelete);
	$(".update").on('click', bookupdate);
}

//책 정보 수정
function bookupdate(booknum) {
	if($("#bookRegist").val() != '독서평 등록') return;
	var booknum = $(this).attr("data-value");
	
	var deltarget = $(this).parent().parent();
	
	$.ajax({
		type : 'GET'
		, url : 'updatebook'
		, data : "booknum="+booknum
		, success : function(resp) {
			var shelfname=resp.shelfname;
			var btitle = resp.btitle;
			var writer = resp.writer
			var publisher = resp.publisher;
			var purchasedate = resp.purchasedate;
			var price = resp.price;
			var bookreview = resp.bookreview;
			
			bookno = resp.booknum;
			
			$("#shelfname").val(shelfname);
			$("#btitle").val(btitle);
			$("#writer").val(writer);
			$("#publisher").val(publisher);
			$("#purchasedate").val(purchasedate);
			$("#price").val(price);
			$("#bookreview").val(bookreview);
			$("#bookRegist").val("독서평 수정");
		}
	});
}
// 책 정보 삭제
function bookdelete(booknum) {
	var booknum = $(this).attr("data-value");
	var deltarget = $(this).parent().parent();
	
	$.ajax({
		type : 'GET'
		, url : 'deletebook'
		, data : "booknum="+booknum
		, success : function(resp) {
			if(resp == 'success') {
				deltarget.remove();
			} else {
				alert("삭제 실패 하였습니다.");
			}
		}
	});
}

// 도서평 등록 / 책 정보 수정 처리
function bookregist() {
	var shelfname = $("#shelfname").val();
	var btitle  = $("#btitle").val();
	var writer = $("#writer").val();
	var publisher = $("#publisher").val();
	var purchasedate = $("#purchasedate").val();
	var price = $("#price").val();
	var bookreview = $("#bookreview").val();
	
	if(btitle.length == 0 || writer.length == 0 || publisher.length == 0) {
		alert("데이터를 정확히 입력해 주세요");
		return;
	}
	
	if(isNaN(price)) {
		alert("금액은 숫자로만 입력해 주세요");
		$("#price").select();
		return;
	}
	
	var mybookreview = {
		"shelfname" : shelfname
		, "btitle"  : btitle
		, "writer"  : writer
		, "publisher" : publisher
		, "purchasedate" : purchasedate
		, "price" : price
		, "bookreview" : bookreview
	};
	var url = '';
	if($("#bookRegist").val() == '독서평 등록') {
		url = 'regist';
	}else {
		mybookreview.booknum = bookno
		url = 'updatebook';
	}
	
	$.ajax({
		type : 'POST'
		, url : url
		, data : mybookreview
		, success : function(resp) {
			$("#shelfname").val("");
			$("#btitle").val("");
			$("#writer").val("");
			$("#publisher").val("");
			$("#purchasedate").val("");
			$("#price").val("");
			$("#bookreview").val("");
			
			init();
		}
	});
}
</script>

</head>
<body>
<div id="wrapper">
<form>
<table id="regist" >
	<tr>
		<th>책장 종류</th>
		<td>
		<select id="shelfname" name="shelfname">
			<option value="기본책장" >기본책장</option>
			<option value="소설" >소설</option>
			<option value="IT 전공서적" >IT 전공서적</option>
			<option value="완독책장" >완독책장</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>책이름</th>
		<td>
			<input id="btitle" type="text" name="btitle" />
		</td>
	</tr>
	<tr>
		<th>저자</th>	
		<td>
			<input id="writer" type="text" name="writer" />
		</td>
	</tr>
	<tr>	
		<th>출판사</th>
		<td>
			<input id="publisher" type="text" name="publisher" />
		</td>
	</tr>
	<tr>
		<th>구매날짜</th>
		<td>
			<input id="purchasedate" type="date" name="purchasedate" />
		</td>
	</tr>
	<tr>
		<th>책가격</th>
		<td>
			<input id="price" type="text" name="price" />
		</td>	
	</tr>
	<tr>
		<th>독서평</th>
		<td>
			<textarea id="bookreview" name="bookreview"  cols="50" rows="5"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input id="bookRegist" type="button" value="독서평 등록" />
			<input id="cancel" type="reset" value="취소" />
		</td>
	</tr>
</table>
</form>
<hr />
<h2>[ 내 독서 노트 ]</h2>
<div id="mybook">
<form id="search">
	<select id="myshelfname" name="myshelfname">
		<option value="전체" >전체</option>
		<option value="기본책장" >기본책장</option>
		<option value="소설" >소설</option>
		<option value="IT 전공서적" >IT 전공서적</option>
		<option value="완독책장" >완독책장</option>
	</select>
	<input id="searchbtn" type="button" value="검색" />
</form>
<table id="book">
</table>
</div>
</div>
</body>
</html>
