<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/member/deletePro.jsp</h1>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// id,pass,name 파라미터 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
//MemberDAO 객체생성
// int check= userCheck(id,pass)
// check==1 이면  수정작업
//   삭제   deleteMember(id) 호출
//  세션값 초기화
//      main.jsp 이동
// check==0 이면  "비밀번호틀림" 뒤로이동 
// check==-1 이면  "아이디없음" 뒤로이동
		%>
		<script>
			alert("비밀번호틀림");
			history.back(); //뒤로이동
		</script>
		<%
	%>
		<script>
			alert("아이디없음");
			history.back(); //뒤로이동
		</script>
	<%
%>
</body>
</html>