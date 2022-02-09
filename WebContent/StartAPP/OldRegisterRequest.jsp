<%@page import="startapp.OldUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%		//o_id o_pw o_region o_name o_sex o_brithday o_phone o_sharing o_career
		OldUserDAO oDAO = new OldUserDAO();
		request.setCharacterEncoding("UTF-8");
		String o_id = null;
		String o_pw = null;
		String o_region = request.getParameter("o_region");
		String o_name = request.getParameter("o_name");
		String o_sex = request.getParameter("o_sex");
		String o_brithday = request.getParameter("o_brithday");
		String o_phone = request.getParameter("o_phone");
		String o_sharing = request.getParameter("o_sharing");
		String o_career = request.getParameter("o_career");
		o_id = o_brithday;
		o_pw = o_phone;
		String success = oDAO.register(o_id, o_pw, o_region, o_name, o_sex, o_brithday, o_phone, o_sharing, o_career);
		out.print(success);
%>