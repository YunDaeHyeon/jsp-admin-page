<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>대현</title>
</head>
<body>
	<%
	session.invalidate(); //세션 해제 - 로그아웃
	%>
	<script>
		location.href = 'login.jsp';
	</script>
</body>
</html>