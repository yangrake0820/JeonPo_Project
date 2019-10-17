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
// 한글처리
request.setCharacterEncoding("utf-8");

// String id = 세션값 가져오기
String id=(String)session.getAttribute("id");

// 1단계 - 드라이버 연결
Class.forName("com.mysql.jdbc.Driver");

// 2단계 - 디비 연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

// 3단계 - 연결정보를 이용해서 sql 구문을 만들고 실행할 객체생성 select
String sql="select * from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);

// 4단계 - 만든 객체 실행 select => 결과 저장 내장객체
ResultSet rs=pstmt.executeQuery();

// 5단계 - 첫행으로 이동 데이터 있으면 true 첫행,"name" 열 화면 출력
if(rs.next()){
	%>
	<h1>WebContent/jsp4_test/updateForm.jsp</h1>
	<form action="updatePro.jsp" method="post">
	아이디 : <input type="text" name="id" value="<%=id%>" readonly><br>
	비밀번호 : <input type="password" name="pass"><br>
	이름 : <input type="text" name="name" value="<%=rs.getString("name")%>"><br>
	나이 : <input type="text" name="age" value="<%=rs.getString("age")%>"><br>
	성별 : <input type="radio" name="gender" value="<%=rs.getInt("gender") %>">남
          <input type="radio" name="gender" value="<%=rs.getInt("gender") %>">여<br>
    e-mail : <input type="text" name="email"value="<%=rs.getString("email") %>"><br>     
	<input type="submit" value="회원정보수정">
	</form>
	<%
}
%>




</body>
</html>