
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
MemberDAO mdao=new MemberDAO();
int check=mdao.idcheck(id);
if(check==1){
	out.println("아이디 중복");
}else{
	out.println("아이디 사용가능");
}
%>