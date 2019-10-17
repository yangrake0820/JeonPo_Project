<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/testPro4.jsp</h1>
<%
request.setCharacterEncoding("utf-8");

String name=request.getParameter("name");
String gender=request.getParameter("gender");
//String hobby=request.getParameter("hobby");
// 배열 = 하나의 이름에 String 같은형의 값을 여러개 저장
String hobby[]=request.getParameterValues("hobby");
String grade=request.getParameter("grade");
%>
이름 : <%=name %><br>
성별 : <%=gender %>
<%
//gender가 null 이 아니면 동작
if(gender != null){
	int gen=Integer.parseInt(gender);
	// 정수형 비교
	if(gen==1){
		//out.println("남");
		%>남<%
	}else{
// 		out.println("여");
		%>여<%
	}
	
	//문자열비교 .equals() 함수 사용
	if(gender.equals("1")){
// 		out.println("남");
		%>남<%
	}else{
// 		out.println("여");
		%>여<%
	}
}


%>
<br>
취미 선택 한 개수 : <%=hobby%><%//=hobby.length %><br>
취미 : <%
	// hobby가 null이 아니면
	if(hobby!=null){
		for(int i=0;i<hobby.length;i++){
//			out.println(hobby[i]);
			%><%=hobby[i]%><%
		}
	}
%>
<table border="1">
	<tr><td>취미변수</td><td>취미값</td><tr>
	<%
	for(int i=0;i<hobby.length;i++){
		%><tr><td>hobby[<%=i %>]</td><td><%=hobby[i] %></td><tr><%
	}
	%>
</table>
<br>
학년 : <%=grade %>학년<br>
</body>
</html>




