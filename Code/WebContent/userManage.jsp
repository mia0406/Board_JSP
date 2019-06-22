<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 사용자 관리(관리자용)</title>
</head>
<body>
<h2>사용자 관리(관리자용)</h2>
<table border="1">
	<tr>
		<th>ID</th> <!-- <th>를 <tr>랑 안에 쓴다. <th>랑 <td>는 같은 레벨 -->
		<th>이름</th> 
		<th>회원 삭제</th>
	<tr>
<% 
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String id="mia";
	String password="mia";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, password); //

		pstmt = conn.prepareStatement("SELECT * FROM USERS");
		rs = pstmt.executeQuery();
		
		while(rs.next()){
%>
			<tr>
				<td><%=rs.getString("ID") %></td>
				<td><%=rs.getString("NAME") %></td>
				<td><a href="deleteUser.jsp?id=<%= rs.getString("ID")%>">삭제</a></td> <!--  -->
			</tr>
<%					
		}
	}
	catch(ClassNotFoundException e){
		System.out.println("jdbc 드라이버 로딩 실패");
	}
	catch(SQLException e){
		System.out.println("오라클 실패");
	}
%>
</table>
</body>
</html>