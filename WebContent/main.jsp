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
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
	<tr>
		<td>0</td>
		<td>Sample</td>
		<td>mia</td>
		<td>2019.4.28</td>
		<td>10000</td>
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

		pstmt=conn.prepareStatement("SELECT * FROM ARTICLE"); 
		rs=pstmt.executeQuery();

	 	while(rs.next()) { 
%>
	<tr>
		<td><%= rs.getString("NUM")%></td>
		<td><%= rs.getString("TITLE")%></td>
		<td><%= rs.getString("WRITER")%></td>
		<td><%= rs.getString("WRITEDATE")%></td>
		<td><%= rs.getString("HITS")%></td>
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