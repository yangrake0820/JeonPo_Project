<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp4/insertPro.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//request  id,pass,name 파라미터 가져와서 => 변수 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
Timestamp reg_date=new Timestamp(System.currentTimeMillis());
// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결   jspdb1   jspid    jsppass
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성
String sql="insert into member(id,pass,name,reg_date) values(?,?,?,?);";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
pstmt.setString(3, name);
pstmt.setTimestamp(4,reg_date);
// 4단계 - 만든 객체 실행   insert,update,delete 
pstmt.executeUpdate();
// "회원가입 성공"
// loginForm.jsp 이동
%>
<script type="text/javascript">
	alert("회원가입 성공");
	location.href="loginForm.jsp";
</script>
</body>
</html>

