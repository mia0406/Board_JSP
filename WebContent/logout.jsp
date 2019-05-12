<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 - 로그아웃</title>
</head>
<body>
<%
    session.invalidate(); // 기존 세션 데이터 모두 삭제, 세션 초기화
    response.sendRedirect("home.jsp"); // 로그인 페이지로 이동
%>
</body>
</html>