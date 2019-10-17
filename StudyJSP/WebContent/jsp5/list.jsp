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
<h1>WebContent/jsp5/list.jsp</h1>
<%
//1단계 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
String sql="select * from board";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 - 만든 객체 실행   select => 결과 저장 내장객체
ResultSet rs=pstmt.executeQuery();
//5단계 rs에 저장된 내용을 => 화면에 출력
%>
<table border="1">
<tr><td>번호</td><td>제목</td><td>작성자</td><td>날짜</td><td>조회수</td></tr>
<%
while(rs.next()){
%><tr><td><%=rs.getInt("num") %></td>
      <td><a href="content.jsp?num=<%=rs.getInt("num")%>"><%=rs.getString("subject") %></a></td>
      <td><%=rs.getString("name") %></td>
      <td><%=rs.getDate("date") %></td>
      <td><%=rs.getInt("readcount") %></td></tr><%	
}
%>

</table>
</body>
</html>
