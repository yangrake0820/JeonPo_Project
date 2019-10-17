<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/application.jsp</h1>
<%
//application내장객체 : 웹애플리케이션서버에 기억장소 하나만 만들어짐
//                  : 서버가 start되면 만들어지고 stop 사라짐
//                  : 웹애플리케이션 전체 영역에서 자원을 공유 할때 사용
//                  : 방문자수 등의 통계 사용 
%>
서버(컨테이너)정보 : <%=application.getServerInfo() %><br>
서버 물리적인 경로 : <%=application.getRealPath("/") %><br>
<%
//out 내장객체 : 출력 정보를 저장하는 내장객체
out.println("출력 정보를 저장하는 내장객체<br>");
%>
출력정보 저장한 공간 크기 :<%=out.getBufferSize() %><br>
남아있는 공간 크기:<%=out.getRemaining() %><br>
<%
out.close();
out.println("out.close()한후 출력 불가능");
// config 환경설정내장객체,page,exception 내장객체 
%>
</body>
</html>


