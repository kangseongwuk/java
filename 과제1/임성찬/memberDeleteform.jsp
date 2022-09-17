<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.ezen.memberDAO" %>
    <%@ page import="kr.co.ezen.memberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 삭제 화면 구현</title>
</head>
<body>
<%	String id = request.getParameter("id"); 
	
	
%>
<h2 align="center">회원정보 삭제 화면 구현</h2>
	<form action="memberDeletefromPro.jsp" method="post">
	<div align="center">
	<table border="1" align="center" width="600" >
		<tr height="40" align="center" style="background-color : lightgreen">
			<td width="100">아이디</td>
			<td><%=id %></td>
		</tr>
		<tr height="40" align="center" style="background-color : lightblue">
			<td width="100">비밀번호</td>
			<td>
				<input type="password" name="password">
			</td>
		</tr>
		<tr height="40" align="center">
			<td colspan="2">
				<input type="hidden" name="id" value="<%=id%>">
				<input type="submit" value="회원정보삭제">&nbsp;&nbsp;
				<input type="button" value="회원정보조회" onclick="location.href='memberList.jsp?'"/>&nbsp;&nbsp;
				<input type="button" value="회원가입" onclick="location.href='memberjoinform.jsp'"/>&nbsp;&nbsp;
		</tr>
		</table>
		</div>
		</form>
</body>
</html>