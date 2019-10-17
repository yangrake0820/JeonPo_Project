<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// js_jQuery3/json2.jsp
// json-simple-1.1.1.jar 프로그램설치
// 디비내용 => json형태로 변경
// MemberBean => JSONObject  "id":"kim"
// List => JSONArray

//		// 1단계 드라이버 불러오기
		Class.forName("com.mysql.jdbc.Driver");
//		// 2단계 디비연결   jspdb1   jspid    jsppass
		Connection con=null;
		String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
		String dbUser="jspid";
		String dbPass="jsppass";
		con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
		// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from member";
		pstmt=con.prepareStatement(sql);
		// 4단계 - 만든 객체 실행   select => 결과 저장 내장객체
		rs=pstmt.executeQuery();
		//5단계 rs에 저장된 내용을 => 화면에 출력
		JSONArray memberList=new JSONArray();				
		while(rs.next()){
			// 한사람의 정보 저장
// 			MemberBean mb=new MemberBean();
			JSONObject mb=new JSONObject();
// 			mb.setId(rs.getString("id"));
// 			mb.setPass(rs.getString("pass"));
// 			mb.setName(rs.getString("name"));
// 			mb.setReg_date(rs.getTimestamp("reg_date"));
			mb.put("id",rs.getString("id"));
			mb.put("pass",rs.getString("pass"));
			mb.put("name",rs.getString("name"));
			mb.put("reg_date",rs.getString("reg_date"));
			// 배열 한칸에 한사람의 정보 저장
// 			memberList.add(mb);
			memberList.add(mb);
		}
%>
<%=memberList %>
