<%@page import="com.coderby.hr.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 간편정보</title>
<% 
	MemberVO gradePoint = (MemberVO)request.getAttribute("gradePoint");
	double vanishPoint = (double)request.getAttribute("vanishPoint");
	double expirePoint = (double)request.getAttribute("expirePoint");
	
%>
</head>
<body>
 <%=gradePoint.getPhoneNumber()%>님의 포인트정보 
<table border="1">
<tr>
<td>현재 등급</td> <td><%=gradePoint.getGrade() %></td>
</tr>
<tr>
<td>가용 포인트</td> <td><%=gradePoint.getPoint() %></td>
</tr>
<tr>
<td>이달말 소멸될 포인트</td> <td><%=vanishPoint %></td>
</tr>
<%if(expirePoint>0){%>
	<tr>
	<td>지난달 소멸된 포인트</td> 
	<td><%=expirePoint %></td>
	</tr>
<%} %>
</table>
<ul>
<li>
<a href="/hr/Point.do?cmd=pointdetails&phoneNumber=<%=gradePoint.getPhoneNumber()%>">포인트 상세 내역 조회</a>
</li>
<li>
<a href="/hr/Point.do?cmd=buy&phoneNumber=<%=gradePoint.getPhoneNumber()%>">포인트 적립 및 사용</a>
</li>

</ul>


</body>
</html>