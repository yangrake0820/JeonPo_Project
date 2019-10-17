<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function (){
		
		// 대상.append() 대상태그에 태그내용을 추가 할때
		
		// body 뒷부분 '<h2>header1</h2>'
		$('body').append('<h2>header1</h2>');
		
		// table 형태의 추가는 기존의 테이블형식에 맞춰서 추가 해야됨
		$('table').append('<tr><td>번호1</td><td>지역1</td></tr>');
		$('table').css('background', 'pink');
		$('table').css('color', 'brown');
		
		// div태그 뒷부분에 'img'.first() 이미지 첫번째  추가
		// 응용 version
		setInterval(function(){
		$('div').append($('img').first());
		}, 2000);
		
		
	});

</script>

</head>
<body>
<h1>js_Query1/test6.jsp</h1>
<div>
<img src="1.jpg">
<img src="2.jpg">
<img src="3.jpg">
<img src="4.jpg">
<img src="5.jpg">
</div>

<table border="1">
	<tr><td>번호</td><td>지역</td></tr>
</table>
</body>
</html>