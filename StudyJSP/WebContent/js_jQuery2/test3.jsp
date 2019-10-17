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
		// 효과 .show()   .hide()    .toggle()
		//    .slideDown()     slideUp()     slideToggle()
		// 	  .fadeIn()     .fadeOut()     .fadeToggle()
		
		// h2 클릭했을때
		// h2 클릭한 대상 다음태그 .next() 효과.toggle('slow')
		
		// h2 접어두기, 펼치기 기능 시작 = .toggle()
		$('h2').click(function() {
			$(this).next().toggle('slow');
		});
		// h2 접어두기, 펼치기 기능 끝  = .toggle()
		
		
		
		
		
	});

</script>
</head>
<body>
<h1>js_jQuery2/test3.jsp</h1>
<h2>열고 닫기1</h2>
<div>
<h2>제목1</h2>
<p>내용1</p>
</div>
<h2>열고 닫기2</h2>
<div>
<h2>제목2</h2>
<p>내용2</p>
</div>


</body>
</html>