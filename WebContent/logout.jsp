<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� - �α׾ƿ�</title>
</head>
<body>
<%
    session.invalidate(); // ���� ���� ������ ��� ����, ���� �ʱ�ȭ
    response.sendRedirect("home.jsp"); // �α��� �������� �̵�
%>
</body>
</html>