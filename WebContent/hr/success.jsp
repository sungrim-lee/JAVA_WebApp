<%@page import="com.coderby.hr.model.MemberVO"%>
<%@ page  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<head>
<title>CJONE | Pages</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row0">
		<div id="topbar" class="hoc clear">
			<!-- ################################################################################################ -->
			<div class="fl_left"></div>
			<div class="fl_right">
				<ul>
					<li><a href="/index.html">LOGOUT</a></li>
					
				</ul>
			</div>
			<!-- ################################################################################################ -->
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- Top Background Image Wrapper -->
	<div class="bgded overlay"
		style="background-image: url('images/demo/backgrounds/logo.png');">
		<!-- ################################################################################################ -->
		<div class="wrapper row1">
			<header id="header" class="hoc clear">
				<!-- ################################################################################################ -->
				<div id="logo" class="fl_left">
					<h1>
						<a href="http://www.cjone.com">진짜 CJONE 하세요!</a>
					</h1>
				</div>
				<nav id="mainav" class="fl_right">
					<ul class="clear">
						<li class="active"><a href="/index.html">Home</a></li>
						<!-- <li><a class="drop" href="/hr/Point.do">나의 ONE</a>
							<ul>
								<li><a href="pages/gallery_backup.html">포인트 적립/사용</a></li>
								<li><a href="pages/full-width.html">나의 쿠폰</a></li>
								<li><a href="pages/sidebar-left.html">카드 관리/변경</a></li>

							</ul></li>-->
							
							<li><a class="drop" href="/hr/gallery.jsp">제휴 브랜드</a>
							<li><a class="drop" href="/hr/notice.jsp">기능 및 유의사항</a>
<% 
	MemberVO member = (MemberVO)request.getAttribute("member");
%>
							<% if("010-7860-4467".equals(member.getPhoneNumber())){%>
							<li><a class="drop" href="/hr/Point.do?cmd=manager">관리자 페이지</a>
							<% } %>
						<!--  <li><a class="drop" href="pages/gallery_backup.html">제휴 브랜드</a>
							<ul>
								<li><a href="pages/gallery_backup.html">제휴 브랜드</a></li>
								<li><a href="pages/full-width.html">보너스 포인트</a></li>
								<li><a href="pages/sidebar-left.html">제휴 신용카드</a></li>
								<!--  <li><a href="pages/sidebar-right.html">Sidebar Right</a></li>
              <li><a href="pages/basic-grid.html">Basic Grid</a></li> 
							</ul></li>
  
						<li><a class="drop" href="#">이벤트</a>
							<ul>
								<li><a href="http://www.cjone.com/cjmweb/event-coupon/event.do">진행 중인 이벤트</a></li>
								<li><a class="drop" href="#">쿠폰</a>
									<ul>
										<li><a href="#">Level 3</a></li>
										<li><a href="#">Level 3</a></li>
										<li><a href="#">Level 3</a></li>
									</ul></li>
								<li><a href="#">스탬프</a></li>
							</ul></li>
						<li><a href="#">기프트 카드</a></li>
					</ul>-->
					
				</nav>

				<!-- ################################################################################################ -->
			</header>
		</div>

  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <section id="breadcrumb" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">나의ONE</a></li>
      <!-- <li><a href="#">제휴사</a></li>-->
    </ul>
    <!-- ################################################################################################ -->
    <h6 class="heading">나의ONE</h6>
    <!-- ################################################################################################ -->
  </section>
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<style>
.col{
	text-align:center;
	height : 150px;
	border : 1px grey;
	font-size: 150%
	}
</style>

<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
  <div id="page-body">
  <div class="container">
    <div class="row wow fdeInUp"> 
      <!--blog posts container-->
      <div class="col-md-12 page-block">
      <h1>로그인 성공</h1>

전화번호: <%=member.getPhoneNumber()%><br>
<%=member.getName()%>님 접속 성공!<br>
<a href=/hr/Point.do?cmd=info&phoneNumber=<%=member.getPhoneNumber() %>>
<%=member.getName()%>님의 정보 보기

</a>
      </div>
      <!--blog posts container-->
      <div class="clearfix"></div>
    </div>
  </div>
</div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row4 bgded overlay" style="background-image:url('../images/demo/backgrounds/03.png');">
  <footer id="footer" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <h3 class="heading">CJONE</h3>
   <!--  <nav>
      <ul class="nospace inline pushright uppercase">
        <li><a href="../index.html"><i class="fa fa-lg fa-home"></i></a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Terms</a></li>
        <li><a href="#">Privacy</a></li>
        <li><a href="#">Cookies</a></li>
        <li><a href="#">Disclaimer</a></li>
      </ul>
    </nav>-->
    <!--  <ul class="faico clear">
      <li><a class="faicon-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
      <li><a class="faicon-twitter" href="#"><i class="fa fa-twitter"></i></a></li>
      <li><a class="faicon-dribble" href="#"><i class="fa fa-dribbble"></i></a></li>
      <li><a class="faicon-linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
      <li><a class="faicon-google-plus" href="#"><i class="fa fa-google-plus"></i></a></li>
      <li><a class="faicon-vk" href="#"><i class="fa fa-vk"></i></a></li>
    </ul>-->
    <!-- ################################################################################################ -->
  </footer>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2016 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Template by <a target="_blank" href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.backtotop.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>