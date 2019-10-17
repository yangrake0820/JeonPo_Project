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
<h1>WebContent/jsp4/loginPro.jsp</h1>
<%
//request  id,pass 파라미터 가져와서 => 변수 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
// 로그인 인증(폼아이디,비밀번호 / 디비아이디,비밀번호 일치 확인
//		=>일치하면 권한부여/페이지 상관없이 값을 저장사용)
//1단계 드라이버 가져오기
// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결   jspdb1   jspid    jsppass
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
//       디비에 id정보가 있는지 조회(가져오기)
String sql="select * from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,id);
//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
ResultSet rs=pstmt.executeQuery();
//5단계 - if 첫행으로 이동 데이터 있으면 true "아이디있음"
//             if 폼 비밀번호 디비비밀번호 비교 맞으면 세션값 생성 main.jsp이동
//             else  틀리면 "비밀번호틀림"
//      else  데이터 없으면 false "아이디없음"        
if(rs.next()){
	out.println("아이디있음");//아이디있음
	if(pass.equals(rs.getString("pass"))){
		out.println("비밀번호맞음");
		// 세션값 생성  "id",id
		session.setAttribute("id", id);
		// 이동 main.jsp 
		response.sendRedirect("main.jsp");
	}else{
		out.println("비밀번호틀림");
		%>
		<script>
			alert("비밀번호틀림");
			history.back(); //뒤로이동
		</script>
		<%
	}
}else{
	out.println("아이디없음");//아이디없음
	%>
		<script>
			alert("아이디없음");
			history.back(); //뒤로이동
		</script>
	<%
}

%>

</body>
</html>


