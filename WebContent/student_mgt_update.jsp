<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="studentinfo.StudentInfo" %>
<%@ page import="studentinfo.StudentInfoDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="plugins/sweetalert2/sweetalert2.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
<title>대현</title>
</head>
<style>
</style>
<body> <!-- 사이드바 Open / Close  class="sidebar-collapse" -->
	<div class="wrapper">
	<%
	String userID = null;
	String ipAddress=request.getRemoteAddr();
	if(session.getAttribute("userID")!= null){
		userID = (String)session.getAttribute("userID");
	}else{  // 로그인이 되어있지 않는 상태에서 index에 접속했을 경우 %> 
		<script>
			alert('로그인이 되어있지 않습니다.');
			location.href = 'login.jsp';
		</script>
	<%}
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
	StudentInfo studentinfo = new StudentInfoDAO().getStudentInfo(studentID);
	
	%>
	<nav class="main-header navbar navbar-expand navbar-light">
		<!-- Left navbar links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
				href="#" role="button"><i class="fas fa-bars"></i></a></li>
			<li class="nav-item d-none d-sm-inline-block"><a href="index.jsp"
				class="nav-link">Home</a></li>
			<li class="nav-item d-none d-sm-inline-block"><a href="#"
				class="nav-link">Contact</a></li>
		</ul>

		<!-- Right navbar links -->
		<ul class="navbar-nav ml-auto">
			<!-- Navbar Search -->
			<li class="nav-item"><a class="nav-link"
				data-widget="navbar-search" data-target="#navbar-search1" href="#"
				role="button"> <i class="fas fa-search"></i>
			</a>
				<div class="navbar-search-block" id="navbar-search1">
					<form class="form-inline">
						<div class="input-group input-group-sm">
							<input class="form-control form-control-navbar" type="search"
								placeholder="Search" aria-label="Search">
							<div class="input-group-append">
								<button class="btn btn-navbar" type="submit">
									<i class="fas fa-search"></i>
								</button>
								<button class="btn btn-navbar" type="button"
									data-widget="navbar-search">
									<i class="fas fa-times"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</li>
			<li class="nav-item"><a class="nav-link"
				data-widget="fullscreen" href="#" role="button"> <i
					class="fas fa-expand-arrows-alt"></i>
			</a></li>
	  <%
      	if (userID != null) { //로그인 한 세션이 존재한다면
      %>
			<li class="nav-item dropdown">
				<a href="#" class = "nav-link" data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-sign-out-alt"></i><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li style="text-align: center"><a href="logoutAction.jsp">로그아웃</a></li>
				</ul>
			</li>
	  <%
      }
      %>
		</ul>
	</nav>
	<!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index.jsp" class="brand-link">
      <img src="images/ECC logo.png" alt="ECC Logo" class="brand-image img-responsive img-thumbnail elevation-1" style="opacity: .8">
      <span class="brand-text font-weight-light">ECC Admin</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-2 mb-2 d-flex">
        <div class="image px-2 py-2" style="vertical-align: middle;">
          <img src="images/Admin Icon.png" class="img-responsive img-circle elevation-2" alt="Admin Icon">
        </div>
        <div class="info">
          <a href="index.jsp" class="d-block"><%=userID%><br><small><%=ipAddress%></small></a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
           <li class="nav-item">
            <a href="index.jsp" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p> 대시보드
                <span class="right badge badge-danger">main</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fa fa-id-card"></i>
              <p> 교사 관리
                <i class="fas fa-angle-left right"></i>
                <span class="right badge badge-info">2</span>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="teacher_mgt.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>추가 / 수정 / 삭제</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="teacher_auth.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>권한 관리</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link active">
              <i class="nav-icon fa fa-graduation-cap"></i>
              <p> 학생 관리
                <i class="fas fa-angle-left right"></i>
                <span class="right badge badge-info">1</span>
              </p>
            </a>
             <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="student_mgt.jsp" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p> 추가 / 수정 / 삭제 </p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p> ECC 영역 관리
                <i class="fas fa-angle-left right"></i>
                <span class="right badge badge-info">2</span>
              </p>
            </a>
             <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="ecc_mgt.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p> 추가 / 수정 / 삭제 </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="ecc_asg.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p> 할당 ECC 영역  </p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">학생 관리 - 추가 / 수정 / 삭제 </h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
              <li class="breadcrumb-item"><a href="student_mgt.jsp">Student</a></li>
              <li class="breadcrumb-item"><a href="student_mgt.jsp">Student Management</a></li>
              <li class="breadcrumb-item">Student Management Update</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
    <form method = "post" action="student_mgt_update_Action.jsp?studentID=<%=studentID%>">
		<div class="row">
        <div class="col-md-6">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">학생 수정</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="studentName">학생 이름</label>
                <input type="text" id="studentName" name="studentName" value="<%=studentinfo.getStudentName().replaceAll(" ","&nbsp;").replaceAll(">","&gt;").replaceAll("\n","<br>")%>" class="form-control">
              </div>
              <div class="form-group">
                <label for="studentImage">학생 사진</label>
                <input type="text" id="studentImage" name="studentImage" value="<%=studentinfo.getStudentImage().replaceAll(" ","&nbsp;").replaceAll(">","&gt;").replaceAll("\n","<br>")%>" class="form-control">
              </div>
              <div class="form-group">
                <label for="studentClass">학년/반</label>
                <input type="text" id="studentClass" name="studentClass" value="<%=studentinfo.getStudentClassInfo().replaceAll(" ","&nbsp;").replaceAll(">","&gt;").replaceAll("\n","<br>")%>"  class="form-control">
              </div>
              <div class="form-group">
                <label for="studentDate">생년월일</label>
                <input type="text" id="studentDate" name="studentDate" value="<%=studentinfo.getStudentDate().replaceAll(" ","&nbsp;").replaceAll(">","&gt;").replaceAll("\n","<br>")%>"  class="form-control">
              </div>
              <div class="form-group">
                <label for="studentDisable">장애 분류</label>
                <select id="studentDisable" name="studentDisable" class="form-control custom-select">
                  <option><%=studentinfo.getStudentDisable().replaceAll(" ","&nbsp;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></option>
                  <option>시각장애 </option>
                  <option>청각장애 </option>
                  <option>지체장애 </option>
                  <option>지적장애 </option>
                  <option>자폐성장애 </option>
                  <option>정서행동장애 </option>
                  <option>의사소통장애</option>
                  <option>학습장애</option>
                  <option>건강장애</option>
                  <option>발달지체</option>
                </select>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <div class="col-md-6">
          <div class="card card-secondary">
            <div class="card-header">
              <h3 class="card-title">기타 정보</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="studentPhoneNumber">전화번호</label>
                <input type="text" id="studentPhoneNumber" name="studentPhoneNumber" value="<%=studentinfo.getStudentPhoneNumber().replaceAll(" ","&nbsp;").replaceAll(">","&gt;").replaceAll("\n","<br>")%>" class="form-control">
              </div>
              <div class="form-group">
                <label for="studentClassInfo">입학년도</label>
                <input type="text" id="studentClassInfo" name="studentClassInfo" value="<%=studentinfo.getStudentClass().replaceAll(" ","&nbsp;").replaceAll(">","&gt;").replaceAll("\n","<br>")%>" class="form-control">
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>   
   </div>
      <div class="row">
        <div class="col-12">
          <a href="student_mgt.jsp" class="btn btn-secondary">Cancel</a>
          <input type="submit" value="수정" class="btn btn-success float-right">
        </div>
      </div>   
    </form>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
	모티브 - ECC 프로젝트
  </footer>
    <%
    String strReferer = request.getHeader("referer");
    if(strReferer == null){%>
    <script language="javascript">
    alert("올바르지 않은 경로입니다.");
    document.location.href="login.jsp";</script>
    <%return; } %>
    <!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
</div>
</body>
</html>