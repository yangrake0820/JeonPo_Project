
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
<h1>WebContent/jsp3/insertPro.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
// request  num,name 파라미터 가져와서 => 변수 저장
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
// 1단계 드라이버 연결
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성
//      PreparedStatement,Statement,CallableStatement내장객체
//String sql="insert into student(num,name) values(1,'홍길동');";
//String sql="insert into student(num,name) values("+num+",'"+name+"');";
String sql="insert into student(num,name) values(?,?);";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num); //parameterIndex ? 순서
pstmt.setString(2, name);
// 4단계 - 만든 객체 실행   insert,update,delete 
pstmt.executeUpdate();
%>
학생번호 : <%=num %><br>
학생이름 : <%=name %><br>
<%="학생등록 성공"+pstmt %>
</body>
</html>



