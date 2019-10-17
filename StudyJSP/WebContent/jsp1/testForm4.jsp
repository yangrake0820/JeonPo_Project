<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/testForm4.jsp</h1>
<form action="testPro4.jsp" method="get" name="fr">
이름 : <input type="text" name="name"><br>
성별 : <input type="radio" name="gender" value="1">남
<input type="radio" name="gender" value="2">여<br>
취미 : <input type="checkbox" name="hobby" value="독서">독서
<input type="checkbox" name="hobby" value="게임">게임
<input type="checkbox" name="hobby" value="축구">축구
<input type="checkbox" name="hobby" value="여행">여행<br>
학년 : <select name="grade">
	<option value="1">1학년</option>
	<option value="2">2학년</option>
	<option value="3">3학년</option>
</select>
<input type="submit" value="회원가입">
</form>
</body>
</html>