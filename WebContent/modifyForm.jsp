<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 글 수정 페이지</title>
</head>
<body>
<% 
	String num = request.getParameter("num");

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id  = "mia";
	String password = "mia";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
	
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, password);
		
		pstmt = conn.prepareStatement("select * from ARTICLE where num=?");
		pstmt.setString(1, num);
		rs=pstmt.executeQuery();
		
		while(rs.next()){

%>
<form action="modify.jsp" method="post" onsubmit="return checkCondition()">
<table border="1">
	<input type="hidden" id="num" name="num" value="<%= num%>">
	<tr>
		<td>제목</td>
			<td><input type="text" id="title" name="title" value="<%= rs.getString("title")%>"></td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td><%= rs.getString("writer")%></td>
		</tr>
		<tr>
			<td>본문</td>
			<td><input type="text" id="content" name="content" value="<%= rs.getString("content")%>"></td>
		</tr>				
</table>
<br>
<input type="submit" value="수정">
</form>
<% 
		}
	}catch(Exception e){
		
	}
%>
<script>
function checkCondition(){
	
	var title = document.forms[0].title.value;
	var content = document.forms[0].content.value;
	
	if(title == null || title == ""){
		
		alert("제목을 입력하세요.");
		return false;
	}
	
	if(content == null || content == ""){
		
		alert("본문을 입력하세요.");
		return false;
	}
}
</script>
</body>
</html>