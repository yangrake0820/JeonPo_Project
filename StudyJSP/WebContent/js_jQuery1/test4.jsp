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
		// 대상 attr()
		var a=$('img').attr('width');
// 		alert(a);
		// img 대상 width 500 으로 변경
// 		$('img').attr('width', '500');
// 		$('img').attr('src', '5.jpg');

		// img 3개 0 1 2 접근 속성값 여러개 변경
		// img 대상 width 100, 200, 300 으로 변경
		var w=['100','300','500'];
		$('img').attr({
			width: function(index){
				return w[index];
			}
		});

// 		$('img').attr('width', function(index){
// 			return (index+1) * 100;
// 		});

		// 속성 여러개 width 300 400 500
		//          height 200 300 400
		
// 		var w1['300','400','500'];
// 		var h1['200','300','400'];
// 		$('img').attr({
// 			width: function(index){
// 				   return w1[index];
// 				},
// 			height: function(index){
// 				return h1[index];
// 				}
// 	});

		$('img').attr({
			width:function(index){
				return (index+3)*100;
			},
			height:function(index){
				trturn (index+1)*100;
			}
		
		});
		



		
	});
</script>
</head>
<body>
<h1>js_jQuery1/test4.jsp</h1>
<img src="1.jpg" width="300" height="200" border="2">
<img src="2.jpg">
<img src="3.jpg">

</body>
</html>