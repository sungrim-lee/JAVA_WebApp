<%@page import="com.coderby.hr.dao.CjDAO"%>
<%@page import="com.coderby.hr.dao.ICjDAO"%>
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
						<a href="http://www.cjone.com">?????? CJONE ?????????!</a>
					</h1>
				</div>
				<nav id="mainav" class="fl_right">
					<ul class="clear">
						<li class="active"><a href="/index.html">Home</a></li>
						<!-- <li><a class="drop" href="/hr/Point.do">?????? ONE</a>
							<ul>
								<li><a href="pages/gallery_backup.html">????????? ??????/??????</a></li>
								<li><a href="pages/full-width.html">?????? ??????</a></li>
								<li><a href="pages/sidebar-left.html">?????? ??????/??????</a></li>

							</ul></li>-->

						<li><a class="drop" href="/hr/gallery.jsp">?????? ?????????</a>
						<li><a class="drop" href="/hr/notice.jsp">?????? ??? ????????????</a>
    <% 
	double vanishPoint = (double)request.getAttribute("vanishPoint");
	
%>						
 <%
 MemberVO gradePoint = (MemberVO)request.getAttribute("gradePoint");
 %> <%
 	if ("010-7860-4467".equals(gradePoint.getPhoneNumber())) {
 %> <li><a class="drop" href="/hr/Point.do?cmd=manager">????????? ?????????</a>
<%
	}
%>
						<!--  <li><a class="drop" href="pages/gallery_backup.html">?????? ?????????</a>
							<ul>
								<li><a href="pages/gallery_backup.html">?????? ?????????</a></li>
								<li><a href="pages/full-width.html">????????? ?????????</a></li>
								<li><a href="pages/sidebar-left.html">?????? ????????????</a></li>
								<!--  <li><a href="pages/sidebar-right.html">Sidebar Right</a></li>
              <li><a href="pages/basic-grid.html">Basic Grid</a></li> 
							</ul></li>
  
						<li><a class="drop" href="#">?????????</a>
							<ul>
								<li><a href="http://www.cjone.com/cjmweb/event-coupon/event.do">?????? ?????? ?????????</a></li>
								<li><a class="drop" href="#">??????</a>
									<ul>
										<li><a href="#">Level 3</a></li>
										<li><a href="#">Level 3</a></li>
										<li><a href="#">Level 3</a></li>
									</ul></li>
								<li><a href="#">?????????</a></li>
							</ul></li>
						<li><a href="#">????????? ??????</a></li>
					</ul>--></nav>

			
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
      <li><a href="#">?????? ONE</a></li>
      
      <!-- <li><a href="#">?????????</a></li>-->
    </ul>
    <!-- ################################################################################################ -->

    <h6 class="heading"><%=gradePoint.getName()%>(<%=gradePoint.getPhoneNumber()%>)?????? ????????? ??????</h6>
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
    <div class="content"> 
      <!-- ################################################################################################ -->
      <div id="gallery">
        <figure>
          <header class="heading"></header>
          <ul class="nospace clear">
           <title>????????? ????????????</title>

</head>
<body>
<h1> <%ICjDAO dao = new CjDAO(); if(dao.searchPointHistory(gradePoint.getPhoneNumber()).size()==0){%><%=gradePoint.getName()%>?????? ????????? ???????????????!<%} %></h1>
<table border="1">
<tr>
<td>?????? ??????</td> <td><%=gradePoint.getGrade() %></td>
</tr>
<tr>
<td>?????? ?????????</td> <td><%=gradePoint.getPoint() %></td>
</tr>
<tr>
<td>????????? ????????? ?????????</td> <td><%=vanishPoint %></td>
</tr>
</table>
<ul>

<%
if(dao.searchPointHistory(gradePoint.getPhoneNumber()).size()!=0){
%>
<li>
<a href="/hr/Point.do?cmd=pointdetails&phoneNumber=<%=gradePoint.getPhoneNumber()%>">????????? ?????? ?????? ??????</a><%} %>
</li>
<li>
<a href="/hr/Point.do?cmd=buy&phoneNumber=<%=gradePoint.getPhoneNumber()%>">????????? ?????? ??? ??????</a>
</li>

</ul>


</body>
          </ul>
    		
          </div>
        </figure>
       
      </div>
      <!-- ################################################################################################ -->
      <!-- ################################################################################################ -->
     
      <!-- ################################################################################################ -->
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