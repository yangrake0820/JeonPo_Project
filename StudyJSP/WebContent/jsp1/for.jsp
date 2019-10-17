<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp1/for.jsp</h1>
arr[0]=java<br>
arr[1]=jsp<br>
arr[2]=html<br>
arr[3]=oracle<br>
<%
// 배열선언   값 저장
String arr[]=new String[4];
		arr[0]="java";
		arr[1]="jsp";
		arr[2]="html";
		arr[3]="oracle";
String arr1[]=new String[]{"java","jsp","html","oracle"};
String arr2[]={"java","jsp","html","oracle"};
// for 출력
	for(int i=0;i<arr.length;i++){
//		out.println("arr["+i+"]="+arr[i]+"<br>");
             %>arr[<%=i %>]=<%=arr[i] %><br><%
	}
%>
<table border="1">
	<tr><td>배열변수명</td><td>배열값</td></tr>
	<tr><td>arr[0]</td><td>java</td></tr>
	<tr><td>arr[1]</td><td>jsp</td></tr>
	<tr><td>arr[2]</td><td>html</td></tr>
	<tr><td>arr[3]</td><td>oracle</td></tr>
</table>
<table border="1">
	<tr><td>배열변수명</td><td>배열값</td></tr>
	<%
	for(int i=0;i<arr.length;i++){
		//out.println("<tr><td>arr["+i+"]</td><td>"+arr[i]+"</td></tr>");
		%><tr><td>arr[<%=i %>]</td><td><%=arr[i] %></td></tr><%
	}
	%>
</table>
</body>
</html>


