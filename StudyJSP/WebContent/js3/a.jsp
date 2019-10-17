<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/js3/a.jsp</h1>
<%
// jsp 내장객체 : request 내장객체 : 폼에서 가져온 데이터 저장
//                               폼id상자이름=값
//             request.변수
//             request.함수()  
//             request.getParameter("id상자이름") 
//             => 이름에 해당하는 값 가져오기
%>
아이디 : <%=request.getParameter("id") %><br>
비밀번호  :<%=request.getParameter("pass") %><br>
이름 : <%=request.getParameter("name") %><br>
자기소개 :<%=request.getParameter("intro") %><br>
성별 :<%=request.getParameter("gender") %><br>
취미 : <%=request.getParameter("hob") %><br>
학년선택 : <%=request.getParameter("hak") %><br>
</body>
</html>

