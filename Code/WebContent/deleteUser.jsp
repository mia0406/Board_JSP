<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 회원 삭제(실제 기능)</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String deleteId=request.getParameter("id");

	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String id="mia";
	String password="mia";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, password); //
		
		pstmt=conn.prepareStatement("DELETE FROM USERS WHERE id=?");
		pstmt.setString(1, deleteId);
		int result = pstmt.executeUpdate();
		
		if(result != 0){
			
			out.println("<script>");
			out.println("location.href='userManage.jsp'"); //
			out.println("</script>");
		}
		
	}
	catch(ClassNotFoundException e){
		System.out.println("jdbc 드라이버 로딩 실패");
	}
	catch(SQLException e){
		System.out.println("오라클 실패");
	}
%>
</body>
</html>