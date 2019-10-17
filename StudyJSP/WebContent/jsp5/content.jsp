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
<h1>WebContent/jsp5/content.jsp</h1>
<%
// int num =  파라미터 num 가져와서 저장
int num=Integer.parseInt(request.getParameter("num"));
//1단계 드라이버 가져오기
Class.forName("com.mysql.jdbc.Driver");
//2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 sql update 수정 readcount=readcount+1  조건 num=?
String sql="update board set readcount=readcount+1 where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
//4단계 실행 
pstmt.executeUpdate();

//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select 조건 num=?
sql="select * from board where num=?";
pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
//4단계 - 만든 객체 실행   select => 결과 저장 내장객체	
ResultSet rs=pstmt.executeQuery();
//5단계 - 첫행으로 이동 데이터 있으면 true  첫행, 열 화면출력
if(rs.next()){
%>
<table border="1">
<tr><td>글번호</td><td><%=rs.getInt("num") %></td>
    <td>글쓴날짜</td><td><%=rs.getDate("date") %></td></tr>
<tr><td>글쓴이</td><td><%=rs.getString("name") %></td>
    <td>조회수</td><td><%=rs.getInt("readcount") %></td></tr>
<tr><td>제목</td><td colspan="3"><%=rs.getString("subject") %></td></tr>
<tr><td>내용</td><td colspan="3"><%=rs.getString("content") %></td></tr>
<tr><td colspan="4">
<input type="button" value="글수정"
onclick="location.href='updateForm.jsp?num=<%=num%>'">
<input type="button" value="글삭제" 
onclick="location.href='deleteForm.jsp?num=<%=num%>'">
<input type="button" value="글목록" 
onclick="location.href='list.jsp'"></td></tr>
</table>
<%
}
%>
</body>
</html>