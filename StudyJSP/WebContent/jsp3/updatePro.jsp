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
<h1>WebContent/jsp3/updatePro.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
// num name 파라미터 값 변수에 저장
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
// 1단계 드라이버 연결
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 update
String sql="update student set name=? where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setInt(2, num); //parameterIndex ? 순서
// 4단계 - 만든 객체 실행   update
pstmt.executeUpdate();
%>
학생번호 :<%=num %><br>
수정할 학생이름 :<%=name %><br>
<%="학생수정 성공"+pstmt %>

</body>
</html>