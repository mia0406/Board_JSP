<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 글 삭제</title>
</head>
<body>
<% 
	int num = Integer.parseInt(request.getParameter("num"));

	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String id="mia";
	String password="mia";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		Class.forName(driver);		
		conn=DriverManager.getConnection(url, id, password); //
		
		pstmt=conn.prepareStatement("DELETE FROM ARTICLE WHERE num=?"); //
		pstmt.setInt(1,num);
		int result = pstmt.executeUpdate(); //
		
		if(result != 0){
		
			out.println("<script>"); //
		    out.println("location.href='main.jsp'"); //
		    out.println("</script>"); //
		}
		
	} catch(ClassNotFoundException e){
		System.out.println("jdbc driver 로딩 실패");
	} catch(SQLException ex){
		System.out.println("오라클 실패");
	}
%>
</body>
</html>