<%@page import="com.coderby.hr.model.MemberVO"%>
<%@page import="com.coderby.hr.model.AllianceVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 적립 및 사용</title>
<%
	List<AllianceVO> allianceList = (List<AllianceVO>)request.getAttribute("allianceList");
	String phoneNumber = (String)request.getAttribute("phoneNumber");
	MemberVO member = (MemberVO)request.getAttribute("member");
%>
<!--  id, name ,적립률-->
</head>
<body>
<form action="/hr/Point.do" method="post">
	<input type="hidden" name="cmd" value="buy">
	<table border="1">
	<tr>
	<td>핸드폰 번호</td>  
	<td><input type="text" name="phoneNumber" value=<%=phoneNumber %> readonly></td>
	</tr>
	
	<tr>
	<td>금액</td>  
	<td><input type="number" name="amount"></td>
	</tr>
	
	<tr>
	<td>제휴사</td>  
	<td>
	<select name="allianceId">
		<%
			for(AllianceVO alliance:allianceList){
				if(alliance.getAllianceId()!=0) {
		%>
				<option value="<%=alliance.getAllianceId() %>" ><%=alliance.getAllianceName() %>
				
		<%
				}
			}
		%>
	</td>
	</tr>
	
	<tr>
	<td>사용할 포인트</td>  
	<td><input type="number" name="usePoint"></td>
	</tr>
	
	<tr>
	<td>가용 포인트</td>  
	<td><%=member.getPoint() %></td>
	</tr>
	
	<tr>
	<td align="center"><input type="submit" value="완 료" ></td>  
	<td align="center"><a href="/hr/Point.do?cmd=info&phoneNumber=<%=phoneNumber%>">처음으로</a></td>
	</tr>
	</table>
</form>
</body>
</html>