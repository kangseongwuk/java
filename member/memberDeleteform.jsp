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
<h2 align="center">회원정보 삭제 화면</h2>
	<div align="center"> 
	<form action="memberDeleteformPro.jsp" method="post">
	<table border="1" style="width: 800px; text-align: center;">
		<tr style="height: 40; background: pink;">
			<td width="100">아이디</td>
			<td><%=request.getParameter("id") %></td> 
		</tr>				
		<tr align="center" style="height: 40; background: yellow;">
			<td width="120">비밀번호</td>
			<td>
				<input type="password" name="password">
			</td>
		</tr>		
		<tr style="height: 60;">
			<td colspan="2"> 
				<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
				<input type="submit" value="회원정보삭제">&nbsp;&nbsp;		
				<input type="button" value="회원목록보기" onclick="location.href='memberList.jsp?'"/>&nbsp;&nbsp;
				<input type="button" value="회원가입" onclick="location.href='memberJoinform.jsp?'"/>
			</td>	
		</tr>		
	</table>	
	</form>
</div>
</body>
</html>