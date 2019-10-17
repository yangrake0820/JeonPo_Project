<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionSet.jsp</h1>
<%
// 세션값 생성(만들기)
session.setAttribute("sesname", "session Value");
session.setAttribute("sesname2", "session Value2");

// "세션값 생성"
// sessionTest.jsp 이동
%>
<script type="text/javascript">
 	alert("세션값 생성");
 	location.href="sessionTest.jsp"
</script>
</body>
</html>

