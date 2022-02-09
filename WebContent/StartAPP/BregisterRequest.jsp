<%@page import="startapp.BuserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
		BuserDAO bDAO = new BuserDAO();
		request.setCharacterEncoding("UTF-8");
		String bUserID = request.getParameter("bUserID");
		String bUserPassword = request.getParameter("bUserPassword");
		String success = bDAO.login(bUserID, bUserPassword);
		out.print(success);
%>