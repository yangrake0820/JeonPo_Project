<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board2.Board2DTO"%>
<%@page import="java.util.List"%>
<%@page import="board2.Board2DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board2/list.jsp</h1>
<%
// Board2DTO 객체생성
Board2DAO b2dao = new Board2DAO();
// 게시판 전체 글개수 가져오기 select count(*)
int count=b2dao.getBoardCount();
// 한 화면에 보여줄 글개수 설정
int pageSize=5;
// 현재 페이지 가져오기
String pageNum=request.getParameter("pageNum");
// pageNum 없으면 pageNum="1" 설정
if(pageNum==null){
	pageNum="1";
}
int currentPage=Integer.parseInt(pageNum);
// 시작하는 행번호 구하기 => 식구하기 => 알고리즘
// pageNum(currentPage)        pageSize    => startRow
//         1                       5       => 0*5+1 => 0+1=> 1
//         2                       5       => 1*5+1=>  5+1=> 6
//         3                       5       => 2*5+1=> 10+1=>11
int startRow = currentPage*pageSize-pageSize+1; 
//    pageNum     pageSize  => endRow
//       1            5     =>   5
//       2            5     =>  10
//       3            5     =>  15
int endRow=currentPage*pageSize;

SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");

// List boardList = getBoardList () 호출
List boardList=b2dao.getBoardList(startRow, pageSize);

//게시판 임의의 번호 구하기
int num=0;
//전체 글개수 count                    페이지 currentPage   -0          시작번호
// 30                             -1-1 => 0*10 = 0                30
// 30                             -2-1 => 1*10 = 10               20
// 30                             -3-1 => 2*10 = 20               10
num=count-(currentPage-1)*pageSize;
%>
<h1>글목록 [게시판 글개수 : <%=count %>]</h1>
<table border="1">
<tr><td>번호</td><td>제목</td><td>작성자</td><td>날짜</td><td>조회수</td></tr>
<%
for(int i=0;i<boardList.size();i++){
	// Board2DTO b2dto = 배열 첫번째 칸 배열이름.get()
			Board2DTO b2dto=(Board2DTO)boardList.get(i);
	%><tr><td><%=b2dto.getNum() %></td><td><a href="content.jsp?num=<%=b2dto.getNum()%>"><%=b2dto.getSubject() %></a></td>
      <td><%=b2dto.getName() %></td>
      <td><%=sdf.format(b2dto.getDate()) %></td>
      <td><%=b2dto.getReadcount()%></td></tr><%	
}
%>

<%
//전체 페이지수 구하기     전체글개수 50 한화면 글개수 10 => 전체 페이지수 5+0 => 5
//               전체글개수 55 한화면 글개수 10 => 전체 페이지수 5+1 =>6 
//int pageCount=count/pageSize + (조건?참값:거짓값);
int pageCount=count/pageSize + (count%pageSize==0?0:1);
//한화면에 보여줄  페이지 개수 설정
int pageBlock=5;
//시작하는 페이지 번호 구하기  1~10 => 1 
//pageNum(currentPage)  pageBlock  => startPage
//1~ 10                  10      =>  ((1~10)/10)*10+1=>0*10+1=>  0+1=>1
//11~ 20                 10      =>  ((11~20)/10)*10+1=>1*10+1=> 10+1=>11
//21~ 30                 10      =>  ((21~30)/10)*10+1=>2*10+1=> 20+1=>21
int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
//끝 페이지 번호 구하기
//startPage   pageBlock     =>  endPage
// 1           10         =>    10
// 11          10         =>    20
// 21          10         =>    30
int endPage=startPage+pageBlock-1;
if(endPage > pageCount){
	endPage=pageCount;
}
//[이전]
if(startPage > pageBlock){
%><a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a><%
}
//1 2 3 .... 10      11 12 13 .... 20
for(int i=startPage;i<=endPage;i++){
	%><a href="list.jsp?pageNum=<%=i%>"><%=i%></a><%
}
//[다음]
if(endPage < pageCount){
	%><a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a><%	
}
%>
<!--       1 2 3 .... 10 [다음] -->
<!-- [이전] 11 12 13 .... 20    -->












</table>

</body>
</html>