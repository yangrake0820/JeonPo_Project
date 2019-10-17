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
<%
//1단계 드라이버 연결
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
String sql="select * from member";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 - 만든 객체 실행   select => 결과 저장 내장객체
ResultSet rs=pstmt.executeQuery();
//5단계 rs에 저장된 내용을 => 화면에 출력
%>
<table border="1">
	<tr><td>회원아이디</td><td>회원이름</td><td>비밀번호</td><td>가입날짜</td><td>나이</td><td>성별</td><td>이메일주소</td></tr>
	<%
	while(rs.next()){
		%><tr><td><%=rs.getString("id") %></td>
		      <td><%=rs.getString("name") %></td>
		      <td><%=rs.getString("pass") %></td>
		      <td><%=rs.getTimestamp("reg_date") %></td>
		      <td><%=rs.getString("age") %></td>
		      <td><%=rs.getInt("gender") %></td>
		      <td><%=rs.getString("email") %></td>
		      
		      </tr><%
	}
	%>
</table>

</body>
</html>