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
<h1>WebContent/jsp4/info.jsp</h1>
<%
// 세션값 가져오기 "id"
String id=(String)session.getAttribute("id");
//1단계 드라이버 가져오기
Class.forName("com.mysql.jdbc.Driver");
//2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
String sql="select * from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
ResultSet rs=pstmt.executeQuery();
//5단계 - 첫행으로 이동 데이터 있으면 true  첫행, 1열,2열,3열,4열 화면출력
if(rs.next()){
%>
아이디 :<%=rs.getString("id") %><br>
비밀번호 :<%=rs.getString("pass") %><br>
이름:<%=rs.getString("name") %><br>
가입날짜:<%=rs.getTimestamp("reg_date") %><br>
<%
}
%>
</body>
</html>

