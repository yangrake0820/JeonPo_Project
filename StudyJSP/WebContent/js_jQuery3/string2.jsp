<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <h1>처리작업 js_jQuery3/string2.jsp</h1> -->
<%
// name, age 파라미터 값 가져와서 저장
// String name=request.getParameter("name");
// String age=request.getParameter("age");
String id=request.getParameter("id");
if(id.equals("kim")){
	out.println("아이디 중복");
}else{
	out.println("아이디 사용가능");
}
%>
<%-- <h1>이름:<%=name %>,나이:<%=age %></h1> --%>