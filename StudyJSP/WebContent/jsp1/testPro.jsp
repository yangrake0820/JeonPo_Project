<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/testPro.jsp</h1>
<%
// 웹애플리케이션서버(WAS) 처리담당서버
// request,response 자동생성 
// request : http가 들고온 요청정보를 저장하는 서버내장객체(서버기억장소)
// 서블릿(Servlet) : 생성,초기화,스레드
//                : 처리담당자 - request에 저장된 정보를 가지고 처리
//             request.getParameter("id상자이름") 
//             => 이름에 해당하는 값 가져오기
// 변수 선언  문자열 sid이름 에  "id상자이름"에 해당하는 값을 가져와서 저장

String sid="";
sid=request.getParameter("id");

String ssid=request.getParameter("id");
//콘솔,커맨트창에 보임
System.out.println("아이디 : " + sid);
// 웹화면 출력
out.println("아이디는: "+sid+"<br>");
%>
아이디 : <%=sid %>
</body>
</html>




