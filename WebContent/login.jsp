<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 로그인(실제 기능 수행)</title>
</head>
<body>
<%
	String id=request.getParameter("ids");
	String password=request.getParameter("passwd");
	
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
						
			pstmt=conn.prepareStatement("SELECT * FROM USERS where id=?"); 
			//prepareStatement는 Statement와 다르게 ?로 지정된 값을 필요 할 때 마다 이용할수있다.
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){  
	 			
	  			if(password.equals(rs.getString("PASSWORD"))){ 
	  				
	  				if(id.equals("admin")){
	  					session.setAttribute("id",id);
		   				out.println("<script>");
		   				out.println("location.href='mainAdmin.jsp'"); 
		   				out.println("</script>");
	  				}
	  				else{
		   				session.setAttribute("id",id); 
		   				out.println("<script>");
		   				out.println("location.href='main.jsp'"); 
		   				out.println("</script>");
	  				}
	  			}
	  			else{
	  				out.println("<script>");
	  		 		out.println("location.href='home.jsp'"); 
	  		 		out.println("</script>");		
	  			}
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