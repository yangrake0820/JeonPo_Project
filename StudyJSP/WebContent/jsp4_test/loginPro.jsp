<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp4_test/loginPro.jsp</h1>
<%
// 한글처리
request.setCharacterEncoding("utf-8");

// request id,pass 파라미터 가져와서 => 변수 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");

// 1단계 - 드라이버 연결
Class.forName("com.mysql.jdbc.Driver");

// 2단계 - 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

// 3단계 - 연결정보를 이용해서 sql 구문을 만들고 실행할 객체생성 select
//      디비에 id 정보가 있는지 조회(가져오기)
String sql="select * from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);

// 4단계 - 만든객체 실행 select => 결과 저장 내장객체
ResultSet rs=pstmt.executeQuery();

// 5단계 - if 첫행으로 이동 데이터 있으면 true "아이디있음"
//        if 폼 비밀번호 디비 비밀번호 비교 맞으면 세션값 생성 main.jsp 이동
//        else 틀리면 "비밀번호 틀림"
//        else 틀리면 "아이디 틀림"
if(rs.next()){
	out.println("아이디 있음");
	if(pass.equals(rs.getString("pass"))){
		session.setAttribute("id", id);
		%>
		<script type="text/javascript">
			alert("로그인 성공");
			location.href = "main.jsp";
		</script>
		<%
		response.sendRedirect("main.jsp");
	}else{
		%>
		<script type="text/javascript">
			alert("비밀번호 틀림!")
			history.back();
		</script>
		<%
	}
}else{
	%>
	<script type="text/javascript">
		alert("아이디 없음, 다시 입력해주세요!")
		history.back();
	</script>
	<%
}




%>

</body>
</html>