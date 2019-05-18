<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 상세페이지</title>
</head>
<body>
<%
	String title = request.getParameter("title");

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "mia";
	String password = "mia";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String person = null;
	
	try{
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, password);
		
		pstmt = conn.prepareStatement("select * from ARTICLE where title=?");
		pstmt.setString(1, title);
		rs = pstmt.executeQuery();
		    
		while(rs.next()){
%>
			<table border="1">
				<tr>
					<td>제목</td>
					<td><%= rs.getString("title")%></td>
				</tr>
				<tr>
					<td>글쓴이</td>
					<td><%= rs.getString("writer")%></td>
				</tr>
				<tr>
					<td>작성 날짜</td>
					<td><%= rs.getString("writedate")%></td>
				</tr>
				<tr>
					<td>조회수</td>
					<td><%= rs.getString("hits")%></td>
				</tr>
				<tr>
					<td>본문</td>
					<td><%= rs.getString("content")%></td>
				</tr>				
			</table>
<%
			person = rs.getString("writer");
		}
		
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException se){
		se.printStackTrace();
	}
%>

<br>
<button onclick="location.href='modifyForm.jsp'">글 수정</button>
<% 
	if(session.getAttribute("id").equals(person)){
%>
		<button onclick="location.href='deletePage.jsp'">글 삭제</button>
<% 			
	}
%>
</body>
</html>