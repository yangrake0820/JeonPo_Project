<%@page import="bean.BeanDB1"%>
<%@page import="bean.BeanTest1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp6/beanPro1.jsp</h1>
<%
//한글처리
// id,,...파라미터 가져오기
// String id=request.getParameter("id");

// 전달할 데이터(10개~20개)를 모아 한번만 전달 => 자바빈
// 자바파일에 변수정의 값 저장 => 전달
// 자바빈 의 객체생성  => 클래스 기억장소 할당 id,set,get 
// BeanTest1 bt1=new BeanTest1();
//bt1.id=id;
// bt1.setId(id);

// jsp문법 액션태그
// 객체생성
// 파라미터가져와서 set메서드 호출 값저장
%>
<jsp:useBean id="bt1" class="bean.BeanTest1"/>
<%-- <jsp:setProperty property="id" name="bt1" param="id"/> --%>
<jsp:setProperty property="*" name="bt1"/>
<%

// 디비 자바파일BeanDB1 객체생성
BeanDB1 bdb1=new BeanDB1();
// insertMember(자바빈의 주소값)메서드호출
bdb1.insertMember(bt1);
// 자바파일 에 메서드 정의
// 1단계 드라이버로더 2단계 디비연결 3단계 insert sql 4단계 실행
%>
</body>
</html>


