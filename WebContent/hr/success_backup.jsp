<%@page import="com.coderby.hr.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접속 성공</title>
<% 
	
%>
</head>
<body>
<% 
	MemberVO member = (MemberVO)request.getAttribute("member");
%>
전화번호: <%=member.getPhoneNumber()%><br>
<%=member.getName()%>님 접속 성공!<br>
<a href=/hr/Point.do?cmd=info&phoneNumber=<%=member.getPhoneNumber() %>>
<%=member.getName()%>님의 정보 보기

</a>
</body>
</html>