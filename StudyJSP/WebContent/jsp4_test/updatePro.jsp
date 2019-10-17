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
<h1>WebContent/jsp4_test/updatePro.jsp</h1>
<%
// 한글처리
request.setCharacterEncoding("utf-8");

// request id,pass 파라미터 가져와서 => 변수 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");

// 1단계 - 드라이버 연결
Class.forName("com.mysql.jdbc.Driver");

// 2단계 - 디비 연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

// 3단계 - sql 구문을 활용한 조건 id 정보 조회 
String sql="select * from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);

// 4단계 - 만든객체 실행 select => 결과 내장객체
ResultSet rs=pstmt.executeQuery();

// 5단계 - 실행
if(rs.next()){
	if(pass.equals(rs.getString("pass"))){
		String sql1="update member set name=? where id=?";
		PreparedStatement pstmt1=con.prepareStatement(sql1);
		pstmt1.setString(1, name);
		pstmt1.setString(2, id);
		pstmt1.executeUpdate();
		%>
		<script type="text/javascript">
			alert("회원정보 수정완료")
			location.href="main.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("비밀번호 틀림!!")
			history.back();
		</script>
		<%
	}
}
%>

</body>
</html>