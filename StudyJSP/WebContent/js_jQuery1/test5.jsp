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
		// 대상.html() 대상태그에 태그내용을 넣을때
		// 대상.append() 대상태그에 태그내용을 추가 할때
		
		var ht = $('h2').html();
// 		alert(ht);
		$('h2').html('html Method');
// 		$('div').html('<h1>head</h1>');
		$('div').html(function(index){
			return '<h1>head-'+index+'</h1>';
		});
		// 기존태그에 내용을 들고와서 수정해서 기존태그 수정 
		$('div').html(function(index,h){
			// h 변수 <= 대상태그의 내용 저장
			return '*'+h+'*';
		});
		
		
	});

</script>
</head>
<body>
<h1>js_jQuery1/test5.jsp</h1>
<div>div0</div>
<div>div1</div>
<div>div2</div>
<h2>head-0</h2>
<h2>head-0</h2>
<h2>head-0</h2>

</body>
</html>