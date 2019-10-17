<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/cookieForm.jsp</h1>
<%
//쿠키값이 없으면 기본값 korea 설정
String lang="korea";
//쿠키값 가져오기 "clang"
//쿠키값이 있으면 
// for if 쿠키값 이름 비교 "clang"
// 쿠키값을 찾으면  lang변수에 저장 
Cookie cookies[]=request.getCookies();
if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("clang")){
			lang=cookies[i].getValue();
		}
	}
}
%>
쿠키값 : <%=lang %><br>
<%
// 쿠키값이 korea 이면  한국어 인사말 출력
//       english 이면 영어 인사말 출력
if(lang.equals("korea")){
	%><h1>안녕하세요 이것은 쿠키 예제입니다.</h1><%
}else{
	%><h1>Hello This is Cookie example.</h1><%
}
%>
<form action="cookiePro.jsp" method="post">
<input type="radio" name="lang" value="korea" <%if(lang.equals("korea")){%>checked<%}%>>한국어페이지보기
<input type="radio" name="lang" value="english" <%if(lang.equals("english")){%>checked<%}%>>영어페이지보기
<input type="submit" value="언어설정">
</form>
</body>
</html>


