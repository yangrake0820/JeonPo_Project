<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp3/select.jsp</h1>
<%
//1단계 드라이버 연결
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
String sql="select * from student";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 - 만든 객체 실행   select => 결과 저장 내장객체
ResultSet rs=pstmt.executeQuery();
//5단계 rs에 저장된 내용을 => 화면에 출력
// while(rs.next()){ 
	//  rs.next() 다음행 이동 -> 그 행 데이터 있으면 true/없으면 false
	//조건이 false이면 반복문을 빠져나옴
	//조건이 true이면 반복할 실행문장
	// 그 행에 해당하는 열 접근  열이름 "num" ,열번호  1열 getInt()
	// 그 행에 해당하는 열 접근  열이름 "name" ,열번호  2열  getString()
// 	rs.getInt("num");
// 	rs.getString("name");
// }
%>
<table border="1">
	<tr><td>학생번호</td><td>학생이름</td></tr>
	<%
	while(rs.next()){
		%><tr><td><%=rs.getInt("num") %></td>
		      <td><%=rs.getString("name") %></td></tr><%
	}
	%>
</table>
</body>
</html>
