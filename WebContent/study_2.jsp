<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>대현</title>
</head>
<style>
</style>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID")!= null){
		userID = (String)session.getAttribute("userID");
	}
	%>
    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <button type = "button" class="navbar-toggle collapsed" data-toggle = "collapse" data-target="#bs-example-navbar-collapse-1"
            aria-expanded="false"> 
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main.jsp">ECC admin</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="main.jsp">메인</a></li>
                <li class = "active"><a href="data.jsp">데이터 관리</a></li>
            </ul>
            <%
            if(userID != null){ //로그인 한 세션이 존재한다면
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class ="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                    aria-expanded="false">계정 관리<span class = "caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="logoutAction.jsp">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
			<%
            }
			%>
        </div>
    </nav>
	<!-- 화면 비율 3:9 관리 -->
	<div class="container-fluid">
	<div class="row">
    	<div class="col-md-3">
    		    <!-- 오른쪽 사이드바 타이틀  -->
    	    <div class = "panel panel-default">
    		<div class = "panel-heading">
    			<h3 class="panel-title">데이터 관리</h3>
    		</div>
    		<!-- 사이드바 메뉴 목록 -->
    		<ul class="list-group">
    			<li class="list-group-item"><a href="#">학생 관리</a></li>
    			<li class="list-group-item"><a href="#">ECC 영역 관리</a></li>
    		</ul>
    	</div>
    </div>
    	<div class="col-md-9">
                <!-- 테이블 게시판 만들기 *table-striped는 홀수 테이블 마다 색상 지정 -->
    			<table class="table table-striped" style="text-align: left; border: 1px solid #dddddd">
                    <!-- 테이블 헤더 - 제일 윗부분 -->
                    <thead> 
                        <tr>
                            <th style = "background-color: #eeeeee; text-align: left;">번호</th>
                            <th style = "background-color: #eeeeee; text-align: left;">제목</th>
                            <th style = "background-color: #eeeeee; text-align: left;">작성자</th>
                            <th style = "background-color: #eeeeee; text-align: left;">작성일</th>
                        </tr>
                    </thead>
                    <!-- 테이블 바디 - 테이블 본문 -->
                    <tbody>
                        <tr>
                            <td>0001</td>
                            <td>게시판 테스트1</td>
                            <td>윤대현</td>
                            <td>2021-07-22/02:00</td>
                        </tr>
                        <tr>
                            <td>0002</td>
                            <td>게시판 테스트2</td>
                            <td>윤대현</td>
                            <td>2021-07-22/02:01</td>
                        </tr>
                        <tr>
                            <td>0003</td>
                            <td>게시판 테스트3</td>
                            <td>윤대현</td>
                            <td>2021-07-22/02:01</td>
                        </tr>
                        <tr>
                            <td>0004</td>
                            <td>게시판 테스트4</td>
                            <td>윤대현</td>
                            <td>2021-07-22/02:04</td>
                        </tr>
                    </tbody>
                </table>
                <a href="add.jsp" class = "btn btn-default pull-right">데이터 추가</a> 
    		</div>
    	</div>
	</div>
    <%
    String strReferer = request.getHeader("referer");
    if(strReferer == null){%>
    <script language="javascript">
    alert("올바르지 않은 경로입니다.");
    document.location.href="login.jsp";</script>
    <%return; } %>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>