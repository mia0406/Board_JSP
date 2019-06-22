<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 수정(실제)</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int num = Integer.parseInt(request.getParameter("num"));

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "mia";
	String password = "mia";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
			
	try{
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, password);
		pstmt=conn.prepareStatement("UPDATE ARTICLE SET title=?, content=? where num=?");
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3, num);
		int result=pstmt.executeUpdate();
		
		if(result != 0){
			out.println("<script>");
		    out.println("location.href='main.jsp'");
		    out.println("</script>");
		}

	} 
	catch (ClassNotFoundException e) {			
		System.out.println("jdbc driver 로딩 실패");
	} 
	catch (SQLException e) {			
		System.out.println("오라클 연결 실패");
	}
%>
</body>
</html>