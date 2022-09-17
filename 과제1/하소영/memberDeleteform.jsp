<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.memberBean" %>
<%@ page import="kr.co.ezen.memberDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 삭제</title>
</head>
<body>
<h2>회원정보 삭제</h2>

<%
	String id = request.getParameter("id");

	memberDAO mdao = new memberDAO();
	memberBean mBean = mdao.oneselectmember(id);
%>

<div align="center">
<form action="memberDeleteformPro.jsp" method="post">
	<table border="1" align="center" width = "30%">
		<tr style="background-color:mistyrose;" height="40" align="center">
			<td width="100">아이디</td> 
			<td><%=mBean.getId() %></td>	
		</tr>
		
		<tr style="background-color:mistyrose;" height="40" align="center">
			<td width="100">비밀번호</td> 
			<td>
			<input type="password" name="password">
			</td>			
		</tr>		
		
		<tr height="40" align="center" style="background-color:mistyrose;">
			<td colspan="2">
				<input type="hidden" name="id" value="<%=mBean.getId() %>">
				&nbsp;&nbsp;&nbsp;
				<input type="submit" value="회원정보삭제" >
				&nbsp;&nbsp;&nbsp;
				<button onclick="location.href='memberList.jsp?'">회원 목록</button>
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="회원가입" onclick="location.href='memberJoinForm.jsp?'">
		</tr>	
		 	
	</table>
</form>
</div>
</body>
</html>