<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웰컴 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
div.block{
	height: 50px;
	background-color:grey;
	border: 1px white solid;
}
</style>
</head>
<body>
<div class="container">
	<div>
	<a href="/hr/Point.do?cmd=main">시작하기</a>
	</div>
	<div class="row">
		<div class="block col-12 col-sm-6 col-md-4 col-lg-3">a</div>
		<div class="block col-12 col-sm-6 col-md-4 col-lg-3">b</div>
		<div class="block col-12 col-sm-6 col-md-4 col-lg-3">c</div>
		<div class="block col-12 col-sm-6 col-md-4 col-lg-3">d</div>
	</div>
</div>
</body>
</html>