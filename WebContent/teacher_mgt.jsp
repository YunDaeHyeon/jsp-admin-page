<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
	<%
	String userID = null;
	String ipAddress=request.getRemoteAddr();
	if(session.getAttribute("userID")!= null){
		userID = (String)session.getAttribute("userID");
	}else{  // 로그인이 되어있지 않는 상태에서 index에 접속했을 경우 %> 
		<script>
			location.href = 'login.jsp';
		</script>
	<%}%>
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
            <a href="#" class="nav-link active">
              <i class="nav-icon fa fa-id-card"></i>
              <p> 교사 관리
                <i class="fas fa-angle-left right"></i>
                <span class="right badge badge-info">2</span>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="teacher_mgt.jsp" class="nav-link active">
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
            <a href="#" class="nav-link">
              <i class="nav-icon fa fa-graduation-cap"></i>
              <p> 학생 관리
                <i class="fas fa-angle-left right"></i>
                <span class="right badge badge-info">1</span>
              </p>
            </a>
             <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="student_mgt.jsp" class="nav-link">
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
            <h1 class="m-0">교사 관리 - 추가 / 수정 / 삭제 </h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
              <li class="breadcrumb-item active">Teacher</li>
              <li class="breadcrumb-item active">Teacher Management</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body pb-0">
          <div class="row">
            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
              <div class="card bg-light d-flex flex-fill">
                <div class="card-header text-muted border-bottom-0">
                  	고등부 1학년 1반 담당
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>권혁준</b></h2>
                      <p class="text-muted text-sm"><b>담당: </b> 전맹 / 저시력 / 전맹+저시력 / 고등부 </p>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> 이메일: SarangHeYo@gmail.com </li>
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> 전화번호 : 010-9910-2902</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
                    <a href="#" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i>
                    </a>
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> 프로필
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
              <div class="card bg-light d-flex flex-fill">
                <div class="card-header text-muted border-bottom-0">
                  	중등부 3학년 2반 담당
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>윤대현</b></h2>
                      <p class="text-muted text-sm"><b>담당: </b> 전맹 / 저시력 / 전맹+저시력 / 중등부 </p>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> 이메일: kayuaao12@naver.com </li>
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> 전화번호 : 010-2144-3317</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="dist/img/user3-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
                    <a href="#" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i>
                    </a>
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> 프로필
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
          <nav aria-label="Contacts Page Navigation">
            <ul class="pagination justify-content-center m-0">
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item"><a class="page-link" href="#">6</a></li>
              <li class="page-item"><a class="page-link" href="#">7</a></li>
              <li class="page-item"><a class="page-link" href="#">8</a></li>
            </ul>
          </nav>
        </div>
        <!-- /.card-footer -->
      </div>
      <!-- /.card -->
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
</body>
</html>