<%@page import="board2.Board2DAO"%>
<%@page import="board2.Board2DTO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board2/writePro.jsp</h1>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// request name,pass,subject,content 파라미터 가져와서 => 변수 저장
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// BoardDTO 객체 생성
Board2DTO b2dto=new Board2DTO();
b2dto.setName(name);
b2dto.setPass(pass);
b2dto.setSubject(subject);
b2dto.setContent(content);

// Board2DAO 객체 생성
Board2DAO b2dao = new Board2DAO();
// insertBoard(b2dto) 메서드 호출
b2dao.insertBoard(b2dto);

// 글 작성 완료후 list.jsp 이동하게 만들어줌
%><script type="text/javascript">
	alert("글 작성 완료");
	location.href="list.jsp";
</script>


<%







%>

</body>
</html>