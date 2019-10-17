<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/session.jsp</h1>
<%
// 세션 : 클라이언트 서버 연결정보를 저장 내장객체
%>
세션 아이디: <%=session.getId() %><br>
세션 만들어진 시간 : <%=session.getCreationTime() %><br>
세션 최근 접속 시간 : <%=session.getLastAccessedTime() %><br>
세션 유지되는 시간 : <%=session.getMaxInactiveInterval() %>초 / 30분<br>
세션 유지시간 변경:
<%
session.setMaxInactiveInterval(3600);
%><br>
세션 유지되는 시간 : <%=session.getMaxInactiveInterval() %>초 / 60분<br>
세션 전체삭제(로그아웃) : <% session.invalidate();  %><br>
</body>
</html>




