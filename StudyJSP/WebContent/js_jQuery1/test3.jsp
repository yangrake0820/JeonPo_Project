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
		// 대상.css() => 속성에 해당하는 값을 가져오기 
		var col = $('h1').css('color');
// 		alert(col); // rgb(0,0,0)
		
		// 대상.css(속성, 값) => h1 대상에 속성값을 변경 
		$('h1').css('color','green');
	
		// 대상.css(속성, 값) => h2 대상에 속성값을 변경
		var c=['red','blue','purple'];
		$('h2').css('color', function(index){
// 			alert(index);
// 			alert(c[index]);
			return c[index];
		});
		
		// 변경속성 여러개 
// 		$('h2').css('color','green').css('background', 'yellow');
		$('h2').css({
			color: 'green',
			background: 'pink'
		});
		
		// 변경속성, 값 여러개
		var c1=['pink','yellow','brown'];
		$('h2').css({
			color: function(index){
				return c[index];
			},
			background: function(index){
				return c1[index];
			}
		});
		
		
	});
	
	
</script>
</head>
<body>
<h1>js_jQuery1/test3.jsp</h1>
<h2>head-0</h2>
<h2>head-1</h2>
<h2>head-2</h2>




</body>
</html>