<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 세션:연결정보를 저장, 페이지 상관없이 값을 저장, 서버에 저장, 보안상에 중요한 데이터 저장(로그인인증,장바구니)
// 쿠키:             페이지 상관없이 값을 저장, 클라이언트에 저장, 보안상 중요지 않고 서버에 부하를 줄이고자할때 사용(아이디저장,최근에 본상품,..)

// 쿠키값 가져오기
String cname="";
Cookie cookies[]=request.getCookies();
if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		// 쿠키의 이름을 "cookname" 비교
		if(cookies[i].getName().equals("cookname")){
			cname=cookies[i].getValue();
		}
	}
}
%>
<h1>WebContent/jsp2/cookieTest.jsp</h1>
쿠키값 :<%=cname %><br>
<input type="button" value="쿠키값 만들기" 
       onclick="location.href='cookieSet.jsp'">
<input type="button" value="쿠키값  삭제" 
       onclick="location.href='cookieDel.jsp'">
</body>
</html>

