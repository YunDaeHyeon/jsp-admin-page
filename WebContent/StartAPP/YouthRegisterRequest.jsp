<%@page import="startapp.YouthUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%		//y_id y_pw y_name y_brithday y_phone y_interest y_job
		YouthUserDAO yDAO = new YouthUserDAO();
		request.setCharacterEncoding("UTF-8");
		String y_id = request.getParameter("y_id");
		String y_pw = request.getParameter("y_pw");
		String y_name = request.getParameter("y_name");
		String y_brithday = request.getParameter("y_brithday");
		String y_phone = request.getParameter("y_phone");
		String y_interest = request.getParameter("y_interest");
		String y_job = request.getParameter("y_job");
		String result = yDAO.register(y_id, y_pw, y_name, y_brithday, y_phone, y_interest,y_job);
		out.print(result);
%>