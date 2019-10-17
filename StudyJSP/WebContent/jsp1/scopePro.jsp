<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/scopePro.jsp</h1>
<%
// http가 들고온 서버정보,파라미터정보("id"),클라이언트정보 => request저장
//  request에서 파라미터 "id" 정보를 => 변수 String id 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
// 영역                       영역내장객체                      유효범위
// page            pageContext         해당페이지
// request         request             요청정보 유지되는 페이지
// session         session             연결정보를 저장, 세션이 유지되는 동안
// application     application         웹애플리케이션서버가 실행되고 있는 동안

// 영역내장객체 : 값저장
pageContext.setAttribute("page", "pageContext value");
request.setAttribute("req", "request value");
session.setAttribute("ses", "session value");
application.setAttribute("app", "applicaton value");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext 영역내장객체 값 :<%=pageContext.getAttribute("page") %><br>
request 영역내장객체 값 : <%=request.getAttribute("req") %><br>
session 영역내장객체 값 : <%=session.getAttribute("ses") %><br>
application 영역내장객체 값 : <%=application.getAttribute("app") %><br>

<!-- http://localhost:8080/StudyJSP/jsp1/scopePro.jsp?id=kim&pass=p123 -->

<a href="scopeProPro.jsp?id=<%=id%>&pass=<%=pass%>">scopeProPro.jsp이동</a>
<script type="text/javascript">
	// scopeProPro.jsp이동 메시지
// 	alert("scopeProPro.jsp이동");
	// 이동   js2/test2.html 참조
 	<%-- location.href="scopeProPro.jsp?id=<%=id%>&pass=<%=pass%>"; --%>
</script>
<%
// scopeProPro.jsp 이동 
// response.sendRedirect("scopeProPro.jsp?id="+id+"&pass="+pass);

//액션태그 forward : jsp문법  태그처럼 사용
// 이동  forward / a.jsp request 모든 정보를 가지고 이동 => b.jsp 
//             / 주소줄 a.jsp  ->  화면 b.jsp 보임
%>
<%-- <jsp:forward page="scopeProPro.jsp" /> --%>
</body>
</html>



