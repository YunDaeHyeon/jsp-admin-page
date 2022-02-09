<%@page import="teacher.teacherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
		teacherDAO tDAO = new teacherDAO();
		request.setCharacterEncoding("UTF-8");
		String TloginID = request.getParameter("TloginID");
		String TloginPW = request.getParameter("TloginPW");
		String success = tDAO.Tlogin(TloginID, TloginPW);
		out.print(success);
%>