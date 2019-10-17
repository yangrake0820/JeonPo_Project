<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/response.jsp</h1>
<%
// 서버에서 클라이언트의 헤더 정보를 수정
response.setHeader("accept-language", "EN");
// 쿠키정보를 클라이언트에 저장
Cookie cookie=new Cookie("cook","cookvalue");
response.addCookie(cookie);
// 서버에서 클라이언트 응답페이지 내용 타입 설정
response.setContentType("text/html; charset=UTF-8");
// 서버에서 클라이언트 다른 페이지 요청 => 하이퍼링크
response.sendRedirect("request.jsp");

// pageContext 객체 : 현페이지 정보 저장
pageContext.getRequest();
pageContext.getResponse();
pageContext.getSession();
%>
</body>
</html>




