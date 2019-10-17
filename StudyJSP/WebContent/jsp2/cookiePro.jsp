<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/cookiePro.jsp</h1>
<%
// 문자열 lang 변수 = 파라미터 "lang" 가져와서 저장
String lang=request.getParameter("lang");
// 쿠키값 생성  이름 "clang", 값 파라미터 가져온값
Cookie cookie=new Cookie("clang",lang);
// 시간설정
cookie.setMaxAge(1800);
// 클라이언트 저장
response.addCookie(cookie);

// "언어설정"
// cookieForm.jsp 이동
%>
<script type="text/javascript">
	alert("<%=lang%> 언어설정");
	location.href="cookieForm.jsp";
</script>
</body>
</html>