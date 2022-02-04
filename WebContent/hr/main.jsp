<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CJOne 포인트 관리 애플리케이션</title>
</head>
<body>
<form action="/hr/Point.do" method="post">
<input type="hidden" name="cmd" value="main">
<h3>포인트 관리를 위해 전화번호를 입력해주세요!</h3>
<input type="text" name="hp_no1" id="hp_no1" class="zero_select" style="width:40px;" maxlength="4" title="휴대폰번호 첫번째 자리">
   <span class="md_txt">-</span>
   <input type="text" name="hp_no2" id="hp_no2" class="first_select" style="width:40px;" maxlength="4" title="휴대폰번호 가운데 자리">
   <span class="md_txt">-</span>
   <input type="text" name="hp_no3" id="hp_no3" style="width:40px;" maxlength="4" title="휴대폰번호 마지막 자리">
<input type="submit" value="제 출">
</form>
</body>
</html>