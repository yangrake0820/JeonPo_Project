<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%=s %>
    <%! 
    // 전역변수선언 : 현페이지 모든곳에서 사용가능한 변수
     String s="jsp";
    // 메서드() 함수선언
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/testPro3.jsp</h1>
<%
// 한글처리는 request나오기 전에 처리
request.setCharacterEncoding("utf-8");

String sword=request.getParameter("word");
String snum=request.getParameter("num");
%>
좋아하는 글자 : <%=sword %><br>
좋아하는 숫자 : <%=snum %><br>
<%
// 좋아하는 숫자가  "10보다 크거나 같다"  아니면 "10보다 작다"
int num=Integer.parseInt(snum);
if(num >= 10){
	out.println("10보다 크거나 같다");
}else{
	out.println("10보다 작다");
}
%>
</body>
</html>




