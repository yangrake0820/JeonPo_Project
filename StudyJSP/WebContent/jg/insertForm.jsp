<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jg/insertForm.jsp</h1>
<form action="insertPro.jsp" method="post">
아이디 : <input type ="text" name ="id"><br>
비밀번호 : <input type ="password" name="pass"><br>
이름 : <input type="text" name="name"><br>
나이 : <input type="text" name="age"><br>
성별 : <input type="radio" name="gender" value="1">남
      <input type="radio" name="gender" value="2">여<br>
e-mail : <input type="text" name="email"><br>      

<input type="submit" value="회원가입">

</form>
</body>
</html>