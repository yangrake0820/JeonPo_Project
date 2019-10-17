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
<h1>WebContent/jsp5/deletePro.jsp</h1>
<%
//num,pass 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
//1단계 드라이버 가져오기
Class.forName("com.mysql.jdbc.Driver");
//2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select 조건 num=?
String sql="select * from board where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1,num);
//4단계 - 만든 객체 실행   select => 결과 저장 내장객체	
ResultSet rs=pstmt.executeQuery();
//5단계 - if 첫행으로 이동 데이터 있으면 true "글있음"
//             if 폼 비밀번호 디비비밀번호 비교 맞으면  삭제 , list.jsp이동
//             else  틀리면 "비밀번호틀림" 뒤로이동
//      else  데이터 없으면 false "글없음"  뒤로이동
if(rs.next()){
	if(pass.equals(rs.getString("pass"))){
		// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 
//      조건 id일치 하면 이름 수정
sql="delete from board where num=?";
pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
//4단계 - 만든 객체 실행   insert,update,delete 
pstmt.executeUpdate();
//"게시판글삭제"
		response.sendRedirect("list.jsp");
	}else{
		%>
		<script>
			alert("비밀번호틀림");
			history.back(); //뒤로이동
		</script>
		<%
	}
}else{
	%>
	<script>
		alert("글없음");
		history.back(); //뒤로이동
	</script>
<%
}
%>
</body>
</html>