<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="studentinfo.StudentInfoDAO" %>
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
		String userID = null;
		if(session.getAttribute("userID")!= null){
			userID=(String)session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 되어있지 않습니다.');");
			script.println("location.href='login.jsp';");
			script.println("</script>");
		}
		int studentID = 0;
		if(request.getParameter("studentID")!= null){
			studentID = Integer.parseInt(request.getParameter("studentID"));
		}
		if(studentID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 학생입니다.');");
			script.println("location.href='student_mgt.jsp'");
			script.println("</script>");
		}
		else{
			//학생 이름, 학생 장애등급을 입력하지 않았을 때
			if(request.getParameter("studentName") == null || request.getParameter("studentDisable") == null
					|| request.getParameter("studentName").equals("") || request.getParameter("studentDisable").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.');");
				script.println("history.back();");
				script.println("</script>");
			}
			//학생 이름, 학생 장애 등급을 모두 입력 했을 때 (데이터베이스 전송)
			else{
				StudentInfoDAO studentinfoDAO = new StudentInfoDAO();
				int result = studentinfoDAO.update(studentID,request.getParameter("studentName"),request.getParameter("studentImage"),request.getParameter("studentClass"),request.getParameter("studentDate"),
						request.getParameter("studentDisable"),request.getParameter("studentPhoneNumber"),request.getParameter("studentClassInfo"));
				System.out.println(result);
				if(result == -1){ //데이터베이스 오류 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수정에 실패했습니다.');");
					script.println("history.back();");
					script.println("</script>");
				}
				else
				{ 	//글쓰기 성공
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'student_mgt.jsp';");
					script.println("</script>");
				}		
			}
		}
	%>
<script>
</script>
</body>
</html>