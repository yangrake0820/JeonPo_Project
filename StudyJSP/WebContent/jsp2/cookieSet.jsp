<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/cookieSet.jsp</h1>
<%
// 쿠키값 만들기
Cookie cookie=new Cookie("cookname","cookie value");
// 쿠키값 시간 설정 - 초설정
cookie.setMaxAge(1800); 
// 쿠키값 클라이언트에 저장
response.addCookie(cookie);
%>
<script type="text/javascript">
	alert("쿠키값 생성");
	location.href="cookieTest.jsp";
</script>
</body>
</html>



