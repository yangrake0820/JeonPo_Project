<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionLogout.jsp</h1>
<%
session.invalidate();
%>
		<script type="text/javascript">
			alert("로그아웃성공");
			location.href="sessionMain.jsp";
		</script>
</body>
</html>