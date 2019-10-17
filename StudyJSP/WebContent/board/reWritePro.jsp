<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board/reWritePro.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//request  name,pass,subject,content 파라미터 가져와서 => 변수 저장
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
int num=Integer.parseInt(request.getParameter("num"));
int re_ref=Integer.parseInt(request.getParameter("re_ref"));
int re_lev=Integer.parseInt(request.getParameter("re_lev"));
int re_seq=Integer.parseInt(request.getParameter("re_seq"));
// 자바빈   패키지 board 파일이름 BoardBean
// BoardBean bb 객체생성
BoardBean bb=new BoardBean();
// 자바빈 멤버변수 <= 파라미터 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setNum(num);
bb.setRe_ref(re_ref);
bb.setRe_lev(re_lev);
bb.setRe_seq(re_seq);

// 디비자바파일 패키지 board 파일이름 BoardDAO
// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
// reInsertBoard(bb) 메서드호출
bdao.reInsertBoard(bb);

// 글목록 이동 list.jsp 
response.sendRedirect("list.jsp");
%>
</body>
</html>