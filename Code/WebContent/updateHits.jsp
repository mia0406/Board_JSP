<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 조회수올리기(실제 기능)</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("num");

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "mia";
	String password = "mia";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, password);
		
		pstmt=conn.prepareStatement("SELECT hits FROM ARTICLE where num=?"); 
		pstmt.setString(1, num);
		rs=pstmt.executeQuery();
		
		String hits="";
		while(rs.next()){
			hits=rs.getString("hits");
		}
		
		int str=Integer.parseInt(hits);
		hits=(str+1)+"";
		
		// hits update
		pstmt=conn.prepareStatement("UPDATE ARTICLE SET hits=? where num=?");
		pstmt.setString(1, hits);
		pstmt.setString(2, num);
		int result=pstmt.executeUpdate();
		
		if(result != 0){
			out.println("<script>");
		    out.println("location.href='pageDetail.jsp?num="+ num + "'");
		    out.println("</script>");
		}
	} 
	catch (ClassNotFoundException e) {			
		System.out.println("jdbc driver 로딩 실패");
	} 
	catch (SQLException e) {			
		System.out.println("오라클 연결 실패");
		e.printStackTrace();
	}
%>
</body>
</html>