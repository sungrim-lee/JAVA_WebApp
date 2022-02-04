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
					<li><a href="/index.html"><i class="fa fa-lg fa-home"></i></a></li>
					
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
      <li><a href="#">기능 및 유의사항</a></li>
      <!-- <li><a href="#">제휴사</a></li>-->
    </ul>
    <!-- ################################################################################################ -->
    <h6 class="heading">기능 및 유의사항</h6>
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
      <h1>기능 및 유의사항</h1>
		<div class="pointGuide_wrap">
						<div class="pointGuide_sec saving">
							<div class="header">
								<h2 class="h2_tit">적립</h2>
								<p class="h_desc">CJ ONE 제휴 브랜드 이용 시, <em class="em">결제금액의 5%~10% 포인트 적립!</em></p>
							</div>
							<div class="info_box">
								<ul class="way">
									<li class="way01">
										<div class="way_info">
											<p class="num num01">
												<span class="haze">01</span>
											</p>
											<p class="info_txt">결제 시 포인트를 사용할 경우, 포인트 <em class="em">사용 금액을 제외한 지불 금액</em>에 대해 포인트가 적립됩니다.</p>
										
										</div>
									</li>
									<li class="way02">
										<div class="way_info">
											<p class="num num02">
												<span class="haze">02</span>
											</p>
											<p class="info_txt">적립된 포인트는 즉시 가용포인트로 전환됩니다.</p>
										</div>
									</li>
									
									<li class="way03">
										<div class="way_info">
											<p class="num num03">
												<span class="haze">03</span>
											</p>
											<p class="info_txt">각 제휴 브랜드별로 적립률이 상이합니다.</p>
										</div>
									</li>
									
									<li class="way04">
										<div class="way_info">
											<p class="num check">
												<span class="haze"></span>
											</p>
											<p class="info_txt"><em class="em">TIP.</em> 제휴 브랜드 이용실적에 따라 매달 등급이 갱신됩니다.</p>
											<div class="btn_wrap">
												<a href="/hr/gallery.jsp" class="btn btn_sm"><span class="arr">제휴사별 등급별 포인트 적립률 알아보기</span></a>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="pointGuide_sec use">
							<div class="header">
								<h2 class="h2_tit">사용</h2>
								<p class="h_desc"><em class="em">가용 포인트가 있으면</em> 현금처럼 사용 가능!</p>
							</div>
							<div class="info_box">
								<ul class="way">
									<li class="way01">
										<div class="way_info">
											<p class="num num01">
												<span class="haze">01</span>
											</p>
											<p class="info_txt">보유 가용 포인트 <em class="em"> 0포인트 초과일 때 현금처럼 사용</em>가능합니다.</p>
										</div>
									</li>
									<li class="way02">
										<div class="way_info">
											<p class="num num02">
												<span class="haze">02</span>
											</p>
											<p class="info_txt">적립한 포인트는 적립한 월말에서 1년이 지나면 소멸됩니다.</p>
										</div>
									</li>
									
									
									<li class="way03">
										<div class="way_info">
											<p class="num num03">
												<span class="haze">03</span>
											</p>
											<p class="info_txt">포인트 적립내역은 포인트 소멸 기준과 같은 최근 1년 내역으로 제공됩니다.</p>
										</div>
									</li>
								</ul>
							</div>
						</div>

						

					</div>

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