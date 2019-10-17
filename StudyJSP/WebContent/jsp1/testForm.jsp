<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/testForm.jsp</h1>
<!-- html 태그주석 -->
<%--  jsp 주석  --%>
<%
// 자바한줄주석  ctrl shift c
/* 
ctrl shift /
자바의
여러줄 
주석 */
%>
<form action="testPro.jsp" method="get" name="fr">
아이디 : <input type="text" name="id"><br>
<input type="submit" value="전송">
</form>
</body>
</html>



