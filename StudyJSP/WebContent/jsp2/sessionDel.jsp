<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionDel.jsp</h1>
<%
// "sesname"이름을 가진 세션값 하나만 삭제
session.removeAttribute("sesname");
//"세션값 하나만 삭제"
//sessionTest.jsp 이동
%>
<script type="text/javascript">
 	alert("세션값 하나만 삭제");
 	location.href="sessionTest.jsp"
</script>
</body>
</html>

