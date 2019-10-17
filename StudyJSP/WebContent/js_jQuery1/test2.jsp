<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 대상.함수().함수()
	// 대상, 선택자(전체선택자, 태그선택자, 아이디선택자, 클래스선택자)
	
	// $('대상').css()
	$('*').css('color','red');
	
	// h2 태그 대상 color blue 변경
	$('h2').css('color', 'blue');
	
	// 아이디 선택자 대상 color green 변경
	$('#ta').css('color', 'green');
	
	// 클래스 선택자 대상 color orange 변경
	$('.ta1').css('color', 'orange');
	
	// 대상 태그[속성=값]
	// input태그 type이 text 인 글자색  'yellow' 변경
	$('input[type=text]').css('color', 'yellow');
	$('input[type=text]').val('p123');
	
	// 태그:odd 홀수번째 태그:even 짝수번쨰
	// 태그:first 첫번째 태그:last 마지막
	
	// tr 홀수번째 배경색 background 'yellow'
	$('tr:odd').css('background', 'yellow');
	// tr 짝수번째 배경색 background 'green'
	$('tr:even').css('background', 'green');
	// tr 첫번째 배경색 background 'blue'
	$('tr:first').css('background', 'blue');
	
	
	
	
	
});
</script>
</head>
<body>
<h1>js_jQuery1/test2.jsp</h1>
<table border="1">
<tr><td>번호</td><td>제목</td><td>작성자</td></tr>
<tr><td>1</td><td>제목1</td><td>작성자1</td></tr>
<tr><td>2</td><td>제목2</td><td>작성자2</td></tr>
<tr><td>3</td><td>제목3</td><td>작성자3</td></tr>
<tr><td>4</td><td>제목4</td><td>작성자4</td></tr>
</table>
<input type="text">
<input type="password">
<h2>제목1</h2>
<h2 id="ta">제목2</h2>
<h2 class="ta1">제목3</h2>
내용

</body>
</html>