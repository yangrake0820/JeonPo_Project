<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/request.jsp</h1>
http 헤더 정보 : <%=request.getHeader("accept") %><br>
http 헤더 정보 : <%=request.getHeader("accept-language") %><br>
http 헤더 정보 : <%=request.getHeader("user-agent") %><br>
http 헤더 정보 : <%=request.getHeader("host") %><br>
http 헤더 정보 : <%=request.getHeader("connection") %><br>
세션(연결)정보 : <%=request.getSession() %><br>
서버정보 : <%=request.getServerName() %><br>
서버포트 : <%=request.getServerPort() %><br>
요청주소(URL) : <%=request.getRequestURL() %><br>
요청주소(URI) : <%=request.getRequestURI() %><br>
클라언트 IP주소 : <%=request.getRemoteAddr() %><br>
프로토콜 : <%=request.getProtocol() %><br>
전송(요청)방식 : <%=request.getMethod() %><br>
컨텍스트경로(프로젝트경로) : <%=request.getContextPath() %><br>
물리적경로: <%=request.getRealPath("/") %><br>
</body>
</html>




