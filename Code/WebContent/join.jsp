<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 회원가입 (실제 기능 구현)</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("ids");
	String password = request.getParameter("passwd");
	String name = request.getParameter("name");
	
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
			
			pstmt=conn.prepareStatement("INSERT INTO USERS VALUES(?,?,?)");
			pstmt.setString(1,id);
			pstmt.setString(2,password);
			pstmt.setString(3,name);
			int result = pstmt.executeUpdate();
			    
			if(result != 0){
				out.println("<script>");
			    out.println("location.href='home.jsp'");
			    out.println("</script>");
			}
			else {
			    out.println("<script>");
			    out.println("location.href='home.jsp'");
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