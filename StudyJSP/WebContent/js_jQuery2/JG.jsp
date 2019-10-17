<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	// 버튼 이벤트 
	var items=$('li'); // <li> 요소를 모두 선택하여 변수 items에 저장함.
	$('button').on("click", function(){
		$('#len').text("저장된 <li>요소의 총 개수는 " + items.length + "개입니다.");
	});
	
	// li들의 글자색을 'pink' 로 바꿔줌
	$('li').css('color', 'pink');
	
	// <li>들 클릭 
	$('li').mouseover(function() {
		$(this).css('color', 'yellow');
	});

	$('img').mouseover(function(){
		$(this).attr('src','../js_jQuery1/5.jpg');
	});
	
	$('img').mouseout(function(){
		$(this).attr('src','../js_jQuery1/3.jpg');
	});
	


});
</script>
</head>
<body>
	<h1>선택한 요소의 저장</h1>
	
	<ul>
		<li>첫 번째 아이템이에요!</li>
		<li>두 번째 아이템이에요!</li>
		<li>세 번째 아이템이에요!</li>
	</ul>
	<button>선택된 요소의 길이는??</button>
	<p id="len"></p>
<img src="../js_jQuery1/3.jpg">	
</body>
</html>