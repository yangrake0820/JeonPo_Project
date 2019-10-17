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
<h1>WebContent/jsp5/writePro.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//request  name,pass,subject,content 파라미터 가져와서 => 변수 저장
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결   jspdb1   jspid    jsppass
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// num 글번호 구하기
//select max(num) from board;
int num=0;
String sql="select max(num) from board";
PreparedStatement pstmt=con.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();
if(rs.next()){
	num=rs.getInt("max(num)")+1;
}
// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 insert
sql="insert into board(num,name,pass,subject,content,readcount,date) values(?,?,?,?,?,?,now());";
pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.setString(2, name);
pstmt.setString(3, pass);
pstmt.setString(4, subject);
pstmt.setString(5, content);
pstmt.setInt(6, 0);
// 4단계 - 만든 객체 실행   insert
//      readcount 0 ,   date   ? 대신에 now() mysql시스템날짜시간
		pstmt.executeUpdate();
// 글목록 이동 list.jsp 
response.sendRedirect("list.jsp");
%>
</body>
</html>