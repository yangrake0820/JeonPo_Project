<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 세션값 가져오기 "id"
String id=(String)session.getAttribute("id"); // 세션값 가져오는 변수선언 및 초기화

// 세션값 없을시 접근제어
if(id==null){
	response.sendRedirect("loginForm.jsp");
}
%>
<h1>WebContent/jsp4_test/main.jsp</h1>
<%=id %> 님 로그인 하셨습니다.<br>
<a href="info.jsp"> 회원정보조회</a>
<a href="updateForm.jsp"> 회원정보 수정</a>
<a href="deleteForm.jsp"> 회원정보 삭제</a>
<a href="list.jsp"> 회원목록</a>
</body>
</html>