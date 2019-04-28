<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 로그인</title>
</head>
<body>
<script>
<%
	String id=request.getParameter("ids");
	String password=request.getParameter("passwd");
	String redirectUrl = "home.jsp";
	
	// 이제는 DB 연결을 해서 그 DB랑 비교해서 있다면 넘어가고, 아니면 말아야 된다.
	if(id.equals("mia")){		
		if(password.equals("mia")){

			redirectUrl="main.jsp";			
		}
	}
	
	if(redirectUrl.equals("home.jsp")){
%>
		alert("등록되지 않은 회원입니다.");
<%		
	}
	
	response.sendRedirect(redirectUrl);
%>
</script>
</body>
</html>