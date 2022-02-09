<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="studentinfo.StudentInfoDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="studentinfo" class="studentinfo.StudentInfo" scope = "page"/>
<jsp:setProperty name = "studentinfo" property="studentName"/>
<jsp:setProperty name = "studentinfo" property="studentImage"/>
<jsp:setProperty name = "studentinfo" property="studentClass"/>
<jsp:setProperty name = "studentinfo" property="studentDate"/>
<jsp:setProperty name = "studentinfo" property="studentDisable"/>
<jsp:setProperty name = "studentinfo" property="studentPhoneNumber"/>
<jsp:setProperty name = "studentinfo" property="studentClassInfo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
  <!-- Toastr -->
  <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
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
		else{
			//학생 이름, 학생 장애등급을 입력하지 않았을 때
			if(studentinfo.getStudentName() == null || studentinfo.getStudentDisable() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.');");
				script.println("history.back();");
				script.println("</script>");
			}
			//학생 이름, 학생 장애 등급을 모두 입력 했을 때 (데이터베이스 전송)
			else{
				StudentInfoDAO studentinfoDAO = new StudentInfoDAO();
				int result = studentinfoDAO.add(studentinfo.getStudentName(),studentinfo.getStudentImage(),studentinfo.getStudentClass(),studentinfo.getStudentDate(),
						studentinfo.getStudentDisable(),studentinfo.getStudentPhoneNumber(),studentinfo.getStudentClassInfo());
				System.out.println(result);
				if(result == -1){ //데이터베이스 오류 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.');");
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
<!-- Toastr -->
<script src="plugins/toastr/toastr.min.js"></script>
<script>
</script>
</body>
</html>