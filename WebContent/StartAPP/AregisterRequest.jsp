<%@page import="startapp.AuserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
		AuserDAO aDAO = new AuserDAO();
		request.setCharacterEncoding("UTF-8");
		String aUserID = request.getParameter("aUserID");
		String aUserPassword = request.getParameter("aUserPassword");
		String success = aDAO.login(aUserID, aUserPassword);
		out.print(success);
%>