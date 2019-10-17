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
		// submit() 이벤트 발생
		$('#my_form').submit(function(){
			// name val()
			var name=$('#name').val();
			// pass val()
			var pass=$('#pass').val();
			// alert()
// 			alert(name+":"+pass);
			if(name==""){
				alert("이름입력하세요");
				//포커스 focus()
				$('#name').focus();
				//되돌아가기 리턴 false 
				return false;
			}
			if(pass.length==0){
				alert("비밀번호입력하세요");
				//포커스 focus()
				$('#pass').focus();
				//되돌아가기 리턴 false 
				return false;
			}
			// 성별체크
			if($('#gender_man').is(":checked")==false && $('#gender_woman').is(":checked")==false){
				alert("성별체크하세요");
				$('#gender_man').focus();
				return false;
			}
			
			// 나이체크
			if($('#age').val()==""){
				alert("나이를 선택해주세요")
				$('#age').focus();
				return false;
			}
			
			
		});
	});
</script>
</head>
<body>
<h1>js_jQuery2/test2.jsp</h1>
<form action="a.jsp" method="post" id="my_form">
이름:<input type="text" name="name" id="name"><br>
비밀번호:<input type="password" name="pass" id="pass"><br>
성별:<input type="radio" name="gender" id="gender_man" value="남">남
<input type="radio" name="gender" id="gender_woman" value="여">여<br>
<select name="age" id="age">
	<option value="">선택해주세요</option>
	<option value="10">10대</option>
	<option value="20">20대</option>
	<option value="30">30대</option>
</select><br>
<input type="submit" value="전송">
</form>
</body>
</html>