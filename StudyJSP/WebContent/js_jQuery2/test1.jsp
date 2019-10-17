<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="../js/"></script>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function (){
	
	// 이벤트 연결 // click 이벤트  .bind()  .on()   .click()
	$('h2').bind('click',function(){
// 		alert('h2클릭')
		// h2를 클릭했을 경우 대상을 h2click으로 글자로 변경하는 구문 : 변경은 html 함수 사용
		$(this).html('h2 click');
	});
	
	$('h3').click(function(){
// 		alert('h3클릭')
		// h3를 클릭했을때 대상(this)을 내용 변경 html()   기존글자 + 추가
		$(this).html(function(index,h3){
			return h3+'+';	
		});	
		// 이벤트 한번만 수행하고 끝내기
		$(this).unbind();
	});
	
	// 이미지 마우스오버(mouseover()) 이벤트 attr     src   2.jpg변경
	// 이미지 마우스아웃(mouseout())  이벤트 attr     src   1.jpg변경
	$('img').mouseover(function(){
		$(this).attr('src','../js_jQuery1/2.jpg');
	});
	$('img').mouseout(function(){
		$(this).attr('src','../js_jQuery1/1.jpg');
	});
	
	
	
	



});	
</script>
</head>
<body>
<img src="../js_jQuery1/1.jpg">




<h1>js_jQuery2/test1.jsp</h1>
<h2>head2</h2>
<h3>head3</h3>
</body>
</html>