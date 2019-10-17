<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><base>
<style type="text/css">
	.high_0{background:yellow;}
	.high_1{background:orange;}
	.high_2{background:blue;}
	.high_3{background:green;}
	.high_4{background:pink;}
</style>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function (){
		//		대상(태그).each()		반복
		$('h1').each(function (index) {
 			// alert(index);
			$(this).addClass('high_'+index);
		});
		
		// 배열변수
		var array=[
			{name:'홍길동',age:20,location:'부산'},
			{name:'이순신',age:30,location:'서울'},
			{name:'유관순',age:40,location:'대구'}
		];
		//		.each(배열변수대상,)   반복
		$.each(array,function(index,item) {
// 			alert(item.name);
// 			alert(item.age);
// 			table 태그 추가 append()
			$('table').append('<tr><td>'+item.name+'</td><td>'+item.age+'</td><td>'+item.location+'</td></tr>')
		});
		
		
		
		
		
	});

</script>
</head>
<body>
<table border="1">
<tr><td>이름</td><td>나이</td><td>위치</td></tr>

</table>




<h1>item-0</h1>
<h1>item-1</h1>
<h1>item-2</h1>
<h1>item-3</h1>
<h1>item-4</h1>


</body>
</html>