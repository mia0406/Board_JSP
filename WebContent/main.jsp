<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - Home</title>
</head>
<body>
<h3>Welcome to JSP 게시판</h3>
<p>~님 안녕하세요</p>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
	<tr>
		<td>1</td>
		<td>Sample</td>
		<td>mia</td>
		<td>2019.4.28</td>
		<td>10000</td>
	</tr>
</table>
<br/>
<button type="button" onclick="location.href='writeForm.jsp'">글쓰기</button>
</body>
</html>