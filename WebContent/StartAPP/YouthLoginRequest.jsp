<%@page import="startapp.YouthLoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%		//o_id o_pw o_region o_name o_sex o_brithday o_phone o_sharing o_career
		YouthLoginDAO loginDAO = new YouthLoginDAO();
		request.setCharacterEncoding("UTF-8");
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		String result = loginDAO.login(userID, userPW);
		out.print(result);
%>