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
<h1>WebContent/jg/insertPro.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//파라미터 가져와서 => 변수 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
int age =Integer.parseInt(request.getParameter("age"));
String gender=request.getParameter("gender");
String email=request.getParameter("email");

Timestamp reg_date=new Timestamp(System.currentTimeMillis()); 
//1단계 드라이버 연결
Class.forName("com.mysql.jdbc.Driver");
//2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser,dbPass);
//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성
//PreparedStatement,Statement,CallableStatement 내장객체
String sql="insert into member(id,pass,name,reg_date,age,gender,email) values(?,?,?,?,?,?,?);";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,id);
pstmt.setString(2,pass);
pstmt.setString(3,name);
pstmt.setTimestamp(4,reg_date);
pstmt.setInt(5,age);
pstmt.setString(6,gender);
pstmt.setString(7,email);
//4단계 - 만든 객체 실행   insert,update,delete 
pstmt.executeUpdate();
%>
회원아이디 : <%=id %><br>
회원비밀번호 : <%=pass %><br>
회원비밀번호 : <%=name %><br>
가입날짜 : <%=reg_date %><br>
나이 : <%=age %><br>
성별 <%=gender %><br>
<%
//gender가 null 이 아니면 동작
if(gender != null){
	int gen=Integer.parseInt(gender);
	// 정수형 비교
	if(gen==1){
		//out.println("남");
		%>남<%
	}else{
//		out.println("여");
		%>여<%
	}
	
	//문자열비교 .equals() 함수 사용
	if(gender.equals("1")){
//		out.println("남");
		%>남<%
	}else{
//		out.println("여");
		%>여<%
	}
}
%>
email :<%=email %><br>
<%="회원가입성공"+pstmt %>
<script type="text/javascript">
alert("회원가입 성공!")
location.href="loginForm.jsp";
</script>







%>
</body>
</html>