<%@page import="bean.BeanDB2"%>
<%@page import="bean.BeanTest2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp6/beanPro2.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//name,age,...파라미터 가져오기
// String name=request.getParameter("name");
// int age=Integer.parseInt(request.getParameter("age"));

// 전달할 데이터(10개~20개)를 모아 한번만 전달 => 자바빈
// 자바파일에 변수정의 값 저장 => 전달
// 자바빈(BeanTest2) 의 객체생성  => 클래스 기억장소 할당 name,age,set,get
// BeanTest2 bt2=new BeanTest2();
// name,age 자바빈에 멤버변수에 값 저장
// bt2.setName(name);
// bt2.setAge(age);

%>
<jsp:useBean id="bt2" class="bean.BeanTest2"/>
<jsp:setProperty property="*" name="bt2"/>
<%

// 자바파일BeanDB2 에 insertMember 메서드 정의 
// ?에  해당하는 값만 출력
// 
// 디비 자바파일BeanDB2 객체생성
BeanDB2 bdb2=new BeanDB2();
// insertMember(자바빈의 주소값)메서드호출
bdb2.insertMember(bt2);
%>
</body>
</html>