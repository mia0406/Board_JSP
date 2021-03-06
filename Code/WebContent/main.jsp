<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - Home</title>
</head>
<body>
<h3>Welcome to JSP 게시판</h3>
<p><%= session.getAttribute("id") %>님 안녕하세요</p>
<!-- https://arabcoding.tistory.com/38 참고 -->
<!-- https://seinarin.tistory.com/11(페이징) 참고 -->
<!-- https://doublesprogramming.tistory.com/61 https://ssppmm.tistory.com/1787 (검색) 참고 -->
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
		<th>추천수</th>
	</tr>
<% 
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userDB = "mia";
	String passwordDB = "mia";

	Connection conn = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	
	try {
		Class.forName(driver);
		conn=DriverManager.getConnection(url, userDB, passwordDB);
		
		
		// 추천 상위노출(3개)
		pstmt=conn.prepareStatement("SELECT * FROM ARTICLE WHERE ROWNUM<=3 ORDER BY RECOMMAND"); 
		rs=pstmt.executeQuery();
		
		while(rs.next()){
%>
			<tr style="color:blue;">
				<td>추천!</td>
				<td><a href="updateHits.jsp?num=<%= rs.getString("num")%>"><%= rs.getString("title")%></a></td>
				<td><%= rs.getString("WRITER")%></td>
				<td><%= rs.getString("WRITEDATE")%></td>
				<td><%= rs.getString("HITS")%></td>	
				<td><%= rs.getString("RECOMMAND")%></td>
			</tr>
<% 
			//System.out.println(rs.getString("NUM"));
		}
%>
<%
		//}

		// 모든 article 
		pstmt=conn.prepareStatement("SELECT * FROM ARTICLE ORDER BY num"); 
		rs=pstmt.executeQuery();

	 	while(rs.next()) { 
%>
		<tr>
			<td><%= rs.getString("NUM")%></td>
			<td><a href="updateHits.jsp?num=<%= rs.getString("num")%>"><%= rs.getString("title")%></a></td>
			<td><%= rs.getString("WRITER")%></td>
			<td><%= rs.getString("WRITEDATE")%></td>
			<td><%= rs.getString("HITS")%></td>
			<td><%= rs.getString("RECOMMAND")%></td>
		</tr>
<% 
	 	}
	} 
	catch (ClassNotFoundException e) {			
		System.out.println("jdbc driver 로딩 실패");
	} 
	catch (SQLException e) {			
		System.out.println("오라클 연결 실패");
	} 	
%>
</table>
<br/>
<button type="button" onclick="location.href='writeForm.jsp'">글쓰기</button>
<button type="button" onclick="location.href='logout.jsp'">로그아웃</button>
</body>
</html>