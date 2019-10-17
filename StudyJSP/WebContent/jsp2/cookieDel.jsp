<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/cookieDel.jsp</h1>
<%
// request 에 저장된 여러개 쿠키값 가져오기
Cookie cookies[]=request.getCookies();
// 쿠키값이 있으면
// for  if  쿠키값 이름 비교 "cookname"
// 찾은 쿠키값  cookies[i] 시간 0 설정
// 시간 0으로 설정한 쿠키값 클라이언트에 저장
if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		// 쿠키의 이름을 "cookname" 비교
		if(cookies[i].getName().equals("cookname")){
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
	}
}
		
%>
<script type="text/javascript">
	alert("쿠키값 삭제");
	location.href="cookieTest.jsp";
</script>
</body>
</html>