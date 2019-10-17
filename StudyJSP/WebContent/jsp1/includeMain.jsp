<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeSet.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=col3%>">
<h1>WebCotent/jsp1/includeMain.jsp</h1>
<table border="1" width="600" height="600">
<tr height="100">
<td colspan="2">
<jsp:include page="includeTop.jsp">
	<jsp:param name="id" value="kim" />
</jsp:include></td></tr>
<tr><td width="100"><jsp:include page="includeLeft.jsp"/></td>
<td>본문</td></tr>
<tr height="100">
<td colspan="2"><jsp:include page="includeBottom.jsp"/></td></tr>
</table>
</body>
</html>

