<%@page import="student.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
		//Sname, Sbrithday, Sdisable, Sschool_level, Sgrade, Sclass, Scode, Sadmission_date
		StudentDAO studentDAO = new StudentDAO();
		request.setCharacterEncoding("UTF-8");
		String Sname = request.getParameter("Sname");
		String Sbrithday = request.getParameter("Sbrithday");
		String Sdisable = request.getParameter("Sdisable");
		String Sschool_level = request.getParameter("Sschool_level");
		int Sgrade = Integer.parseInt(request.getParameter("Sgrade"));
		int Sclass = Integer.parseInt(request.getParameter("Sclass"));
		String Scode = request.getParameter("Scode");
		String Sadmission_date = request.getParameter("Sadmission_date");
		
		String result = studentDAO.join(Sname, Sbrithday, Sdisable, Sschool_level, Sgrade, Sclass, Scode, Sadmission_date);
		out.print(result);
%>