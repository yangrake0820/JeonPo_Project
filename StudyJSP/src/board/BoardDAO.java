package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	//디비 연결 메서드
	private Connection getConnection() throws Exception{
//		Connection con=null;
//		// 1단계 드라이버 불러오기
//		Class.forName("com.mysql.jdbc.Driver");
//		// 2단계 디비연결   jspdb1   jspid    jsppass
//		String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
//		String dbUser="jspid";
//		String dbPass="jsppass";
//		con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		return con; 
		Connection con=null;
		// 1단계 드라이버 불러오기 2단계 디비연결    자원의 이름 저장
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		con=ds.getConnection();
		return con; 
	}
	// insertBoard(bb)
	public void insertBoard(BoardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			// 1,2 메서드호출
			con=getConnection();
			// num 글번호 구하기
			//select max(num) from board;
			int num=0;
			String sql="select max(num) from board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt("max(num)")+1;
			}
			// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 insert
//			sql="insert into board(num,name,pass,subject,content,readcount,date,file) values(?,?,?,?,?,?,now(),?);";
//			pstmt=con.prepareStatement(sql);
//			pstmt.setInt(1, num);
//			pstmt.setString(2, bb.getName());
//			pstmt.setString(3, bb.getPass());
//			pstmt.setString(4, bb.getSubject());
//			pstmt.setString(5, bb.getContent());
//			pstmt.setInt(6, 0);
//			pstmt.setString(7, bb.getFile());
			
			sql="insert into board(num,name,pass,subject,content,readcount,date,file,re_ref,re_lev,re_seq) values(?,?,?,?,?,?,now(),?,?,?,?);";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);
			pstmt.setString(7, bb.getFile());
			pstmt.setInt(8,num); // re_ref 그룹번호  일반글 num == 그룹번호 일치 
			pstmt.setInt(9, 0);// re_lev 들여쓰기 일반글 들여쓰기 없음 0
			pstmt.setInt(10,0); // re_seq 그룹안에 답글 순서  일반글은 순서 맨위 0
			
			// 4단계 - 만든 객체 실행   insert
//			      readcount 0 ,   date   ? 대신에 now() mysql시스템날짜시간
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리작업
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
	}
	
	// reInsertBoard(bb)
	public void reInsertBoard(BoardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			// 1,2 메서드호출
			con=getConnection();
			// num 글번호 구하기
			//select max(num) from board;
			int num=0;
			String sql="select max(num) from board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt("max(num)")+1;
			}
			
			// 같은 그룹이면서 내가쓴글 아래 답글이 있으면 => 답글순서 아래로 한칸씩 재배치(수정)
			sql="update board set re_seq=re_seq+1 where re_ref=? and re_seq>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			pstmt.executeUpdate();
			
			// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 insert
//			sql="insert into board(num,name,pass,subject,content,readcount,date,file) values(?,?,?,?,?,?,now(),?);";
//			pstmt=con.prepareStatement(sql);
//			pstmt.setInt(1, num);
//			pstmt.setString(2, bb.getName());
//			pstmt.setString(3, bb.getPass());
//			pstmt.setString(4, bb.getSubject());
//			pstmt.setString(5, bb.getContent());
//			pstmt.setInt(6, 0);
//			pstmt.setString(7, bb.getFile());
			
			sql="insert into board(num,name,pass,subject,content,readcount,date,file,re_ref,re_lev,re_seq) values(?,?,?,?,?,?,now(),?,?,?,?);";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);
			pstmt.setString(7, bb.getFile());
			pstmt.setInt(8,bb.getRe_ref()); // re_ref 그룹번호  가져온값 그대로 사용 
			pstmt.setInt(9, bb.getRe_lev()+1);// re_lev 들여쓰기 가져온값 +1
			pstmt.setInt(10,bb.getRe_seq()+1); // re_seq 그룹안에 답글 순서  가져온값 +1
			
			// 4단계 - 만든 객체 실행   insert
//			      readcount 0 ,   date   ? 대신에 now() mysql시스템날짜시간
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리작업
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
	}
	
	//getBoardList()
	public List getBoardList(int startRow,int pageSize) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List boardList=new ArrayList();
		try {
			con=getConnection();
			// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
//			String sql="select * from board order by num desc limit ?,?";
			String sql="select * from board order by re_ref desc,re_seq asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			// 4단계 - 만든 객체 실행   select => 결과 저장 내장객체
			rs=pstmt.executeQuery();
			//5단계 rs에 저장된 내용을 => 화면에 출력
			while(rs.next()){
				// 한개의 글저장
				BoardBean bb=new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				// 배열한칸에 한개의 글저장
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		return boardList;
	}
	
	//updateReadcount(num)
	public void updateReadcount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1,2 
			con=getConnection();
			//3
			String sql="update board set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
	}
	
	//getBoard(num)
	public BoardBean getBoard(int num) {
		BoardBean bb=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1,2 
			con=getConnection();
			//3 sql 
			String sql="select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4
			rs=pstmt.executeQuery();
			//5
			if(rs.next()) {
				bb=new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		return bb;
	}
	
	//checkNum(bb)
	public int checkNum(BoardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int check=-1;
		try {
			//1,2 
			con=getConnection();
			//3 sql 
			String sql="select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			//4
			rs=pstmt.executeQuery();
			//5
			if(rs.next()) {
				if(bb.getPass().equals(rs.getString("pass"))) {
					check=1;
				}else {
					check=0;
				}
			}else {
				check=-1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		return check;
	}
	
	// updateBoard(bb)
	public void updateBoard(BoardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1,2 
			con=getConnection();
			//3 sql 
			String sql="update board set name=?,subject=?,content=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bb.getName());
			pstmt.setString(2, bb.getSubject());
			pstmt.setString(3, bb.getContent());
			pstmt.setInt(4, bb.getNum());
			//4단계 - 만든 객체 실행   insert,update,delete 
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
	}
	
	// getBoardCount()
	public int getBoardCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			//1,2 
			con=getConnection();
			//3 sql 
			String sql="select count(*) from board";
			pstmt=con.prepareStatement(sql);
			//4
			rs=pstmt.executeQuery();
			//5
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}			
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		return count;
	}
	
}
