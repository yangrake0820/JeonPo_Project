<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/testPro2.jsp</h1>
<%
// form태그에서 post방식일때 request한글처리 
request.setCharacterEncoding("utf-8");

String sname=request.getParameter("name");
String sage=request.getParameter("age");

//문자열을 => 정수형을  변경
int age=Integer.parseInt(sage);

out.println(sname+"<br>");
out.println(sage+100+"<br>");
out.println(age+100+"<br>");
%>
이름 : <%=sname %><br>
나이 : <%=sage+100 %><br>
나이 +100 : <%=age+100 %><br>
</body>
</html>




