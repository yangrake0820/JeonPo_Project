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
<h1>WebContent/jsp3/jdbcTest.jsp</h1>
<%
//java,jsp => DB (Mysql,Oracle..) 접속
//JDBC(Java Data Base Conectivity) : 자바와  DBMS을 연결시켜주는 API(응용프로그램 인터페이스) 
//JDBC 프로그램 설치
//이클립스
//WebContent-WEB-INF-lib -복사해서 붙여넣기
//mysql-connector-java-5.1.47.jar

//1단계 - JDBC 프로그램을 가져오기(불러오기)
// Class.forName("com폴더mysql폴더jdbc폴더 Driver.class파일");
Class.forName("com.mysql.jdbc.Driver");
//2단계 - 설치한 JDBC프로그램을 이용해서 디비연결(디비접속주소,아이디,비밀번호) => 연결정보 저장(Connection)
// Connection : 연결정보를 저장하는 내장객체
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 
//4단계 - 만든 객체 실행   insert,update,delete 
//      만든 객체 실행 결과를 저장 select
//5단계 - 저장된 결과를 출력, 배열저장 select
%>
<%="디비연결 성공"+con %>
</body>
</html>