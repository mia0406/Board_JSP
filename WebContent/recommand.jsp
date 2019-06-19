<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 추천 update</title>
</head>
<body>
<% 
	String num = request.getParameter("num");

	String driver="";
	String url="";
	String id ="";
	String password="";
	
	try{
		
	}catch(ClassNotFoundException e){
		System.out.println("DB Driver를 찾을 수 없습니다.");
	}catch(SQLException e){
		System.out.println("오라클 실패");
		e.printStackTrace();
	}
%>
</body>
</html>