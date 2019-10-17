<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionInval.jsp</h1>
<%
//세션값 전체 삭제=> 로그아웃 사용
session.invalidate();
//"세션값 전체 삭제"
//sessionTest.jsp 이동
%>
<script type="text/javascript">
 	alert("세션값 전체 삭제");
 	location.href="sessionTest.jsp"
</script>
</body>
</html>

