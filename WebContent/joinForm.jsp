<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 회원가입</title>
</head>
<body>
<h2>회원가입</h2>
<form method="post" action="join.jsp" onsubmit="return checkCondition()">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" id="ids" name="ids"></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" id="passwd" name="passwd"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="회원가입"></td>
		</tr>
	</table>
</form>

<script>
function checkCondition(){
	
	var id=document.forms[0].ids.value;
	var password = document.forms[0].passwd.value;
	var name = document.forms[0].name.value;
	
	if(id == null || id == ""){
		
		alert("아이디를 입력하세요.");
		return false;
	}
	
	if(password == null || password == ""){
		
		alert("패스워드를 입력하세요.");
		return false;
	}
	
	if(name = null || name == ""){
	
		alert("이름을 입력하세요.");
		return false;
	}

	return true;
}
</script>
</body>
</html>