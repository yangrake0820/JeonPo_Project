<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/scopeProPro.jsp</h1>
<%
// http가 들고온 서버정보,파라미터정보("id"),클라이언트정보 => request저장
//  request에서 파라미터 "id" 정보를 => 변수 String id 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext 영역내장객체 값 :<%=pageContext.getAttribute("page") %><br>
request 영역내장객체 값 : <%=request.getAttribute("req") %><br>
session 영역내장객체 값 : <%=session.getAttribute("ses") %><br>
application 영역내장객체 값 : <%=application.getAttribute("app") %><br>
</body>
</html>