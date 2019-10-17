<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionTest.jsp</h1>
<%
// 세션값 가져오기
String sname=(String)session.getAttribute("sesname");
// 세션값이 null이면  sname변수에 "세션값 없음" 저장
if(sname==null){
	sname="세션값 없음";
}
%>
세션값1 : <%=sname %><br>
세션값2 : <%=session.getAttribute("sesname2") %><br>
<input type="button" value="세션값 만들기" 
       onclick="location.href='sessionSet.jsp'">
<input type="button" value="특정 세션값  하나만 삭제" 
       onclick="location.href='sessionDel.jsp'">
<input type="button" value="세션값  전체삭제" 
       onclick="location.href='sessionInval.jsp'">              
</body>
</html>




