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
//int num =  파라미터 num 가져와서 저장
int num=Integer.parseInt(request.getParameter("num"));
%>
<h1>WebContent/jsp5/deleteForm.jsp</h1>
<form action="deletePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<table border="1">
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2"><input type="submit" value="글삭제"></td></tr>
</table>
</form>
</body>
</html>