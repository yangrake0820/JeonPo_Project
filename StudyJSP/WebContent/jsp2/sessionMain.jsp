<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionMain.jsp</h1>
<%
// "id"이름을 가진 세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 없으면  "sessionLogin.jsp" 이동
if(id==null){
	response.sendRedirect("sessionLogin.jsp");
}
%>
<%=id %> 님 로그인 하셨습니다.
<input type="button" value="로그아웃" 
 onclick="location.href='sessionLogout.jsp'">
</body>
</html>


