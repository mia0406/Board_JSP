<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userDB = "mia";
	String passwordDB = "mia";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, userDB, passwordDB);
			
			pstmt=conn.prepareStatement("INSERT INTO ARTICLE VALUES((SELECT MAX(NUM)+1 FROM ARTICLE),?,?,?,sysdate,?)");
			pstmt.setString(1,title);
			pstmt.setString(2,writer);
			pstmt.setString(3, content);
			pstmt.setString(4, "0");
			int result = pstmt.executeUpdate();
			    
			if(result != 0){
				out.println("<script>");
			    out.println("location.href='main.jsp'");
			    out.println("</script>");
			}
			else {
			    out.println("<script>");
			    out.println("location.href='writeForm.jsp'");
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