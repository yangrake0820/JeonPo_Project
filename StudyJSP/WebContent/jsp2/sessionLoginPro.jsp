<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionLoginPro.jsp</h1>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");
%>
폼에서 입력한 아이디 :<%=id %><br>
폼에서 입력한 비밀번호 :<%=pass %><br>
<%
String dbId="admin";
String dbPass="admin1234";
%>
데이터베이스에 저장된 아이디 :<%=dbId %><br>
데이터베이스에 저장된 비밀번호 :<%=dbPass %><br>
<%
// 폼에서 입력한 아이디 와 데이터베이스에 저장된 아이디 비교  .equals()
// 메시지 출력  맞으면 "아이디일치" , 틀리면 "아이디 틀림"
// 아이디 일치하면 비밀번호 비교 
if(id.equals(dbId)){
	out.println("아이디일치<br>");
	if(pass.equals(dbPass)){
		out.println("비밀번호일치<br>");
		// 세션값 생성  이름 "id",값 변수 id => 페이지 상관없이 값유지
		session.setAttribute("id", id);
		// 이동 sessionMain.jsp
		%>
		<script type="text/javascript">
			alert("로그인성공");
			location.href="sessionMain.jsp";
		</script>
		<%
		response.sendRedirect("sessionMain.jsp");
	}else{
		out.println("비밀번호틀림<br>");
	}
}else{
	out.println("아이디 틀림<br>");
}
%>
</body>
</html>