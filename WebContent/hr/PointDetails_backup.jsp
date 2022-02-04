<%@page import="com.coderby.hr.model.PointHistoryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>포인트 상세내역</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<% 
	List<PointHistoryVO> pointHistoryList = (List<PointHistoryVO>)request.getAttribute("pointHistoryList");
%>

<body>
<h2 class="alert alert-primary">포인트 적립 및 사용 상세 내역</h2>
<% String phoneNumber = pointHistoryList.get(0).getPhoneNumber(); %>
<a href="/hr/Point.do?cmd=info&phoneNumber=<%=phoneNumber%>">처음으로</a>


<table  class="table table-striped table table-bordered">

<tr>
<td>제휴사 아이디</td>
<td>제휴사 명</td>
<td>금액</td>
<td>사용일자</td>
<td>사용한 포인트</td>
<td>적립 포인트</td>
<td>가용 포인트</td>
</tr>

<% 
	
	for(PointHistoryVO pointHistory:pointHistoryList){ %>
	<tr>
	<td><%=pointHistory.getAllianceId() %></td>
	<td><%=pointHistory.getAllianceName() %></td>
	<td><%=pointHistory.getAmount() %></td>
	<td><%=pointHistory.getUseDate() %></td>
	<td><%=pointHistory.getUsePoint() %></td>
	<td><%=pointHistory.getSavePoint() %></td>
	<td><%=pointHistory.getTotalPoint() %></td>
	</tr>

<% } %>
</table>

</body>
</html>