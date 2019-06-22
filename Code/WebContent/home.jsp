<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 로그인</title>
</head>
<body>
<h3>JSP로만 구현하는 게시판</h3>
<form action="login.jsp" method="post" onsubmit="return checkCondition()">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" id="ids" name="ids"></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" id="passwd" name="passwd"><br/></td>
		</tr>
		<tr>
			<td><input type="submit" value="로그인"></td>
			<td><button type="button" onclick="location.href='joinForm.jsp'">회원가입</button></td>
		</tr>
	</table>
</form>
<script>
function checkCondition(){
	
	var id=document.forms[0].ids.value;
	var password = document.forms[0].passwd.value;
	
	if(id == null || id == ""){
		
		alert("아이디를 입력하세요.");
		return false;
	}
	
	if(password == null || password == ""){
		
		alert("패스워드를 입력하세요.");
		return false;
	}
	
	return true;
}
</script>
</body>
</html>