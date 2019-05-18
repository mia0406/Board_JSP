<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 글쓰기</title>
</head>
<body>
<h1>writeForm.jsp</h1>
<form action="write.jsp" method="post" onsubmit="return checkCondition()">
	제목: <input type="text" id="title" name="title"><br/>
	작성자: <input type="text" id="writer" name="writer"><br/>
	본문: <input type="text" id="content" name="content"><br/>
	<input type="submit" value="작성"> 
</form>
<script>
function checkCondition(){
	
	var title = document.forms[0].title.value;
	var writer = document.forms[0].writer.value;
	var content = document.forms[0].content.value;
	
	if(title == null || title == ""){
		
		alert("제목을 입력하세요.");
		return false;
	}
	
	if(writer == null || writer == ""){
		
		alert("글쓴이를 입력하세요.");
		return false;
	}
	
	if(content == null || content == ""){
	
		alert("내용을 입력하세요.");
		return false;
	}
}
</script>
</body>
</html>