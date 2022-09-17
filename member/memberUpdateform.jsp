<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.memberDAO" %>  
<%@ page import="kr.co.ezen.memberBean" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 화면 구현</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	
	memberDAO mdao = new memberDAO();
	memberBean mBean = mdao.oneselectmember(id);
%>

<h2 align="center">회원정보 수정 화면 구현</h2>
<form action="memberUpdateformPro.jsp" method="post"> 
<div align="center">
	<table border="1" style="text-align: center; width: 100%;">
		<tr align="center" style="height: 40; background: pink;">
			<td width="100">아이디</td>
			<td><%=mBean.getId() %></td>
		</tr>
		<tr align="center" style="height: 40; background: yellow;">
			<td width="120">이&nbsp;&nbsp;&nbsp;름</td>
			<td><%=mBean.getName() %></td>
		</tr>
		<tr align="center" style="height: 40; background: yellow;">
			<td width="120">전자우편</td>
			<td>
				<input type="email" name="email" value="<%=mBean.getEmail() %>">
			</td>
		</tr>
		<tr align="center" style="height: 40; background: yellow;">
			<td width="120">전화번호</td>
			<td>
				<input type="tel" name="tele" value="<%=mBean.getTele() %>">
			</td>
		</tr>
		<tr align="center" style="height: 40; background: yellow;">
			<td width="120">비밀번호</td>
			<td>
				<input type="password" name="password">
			</td>
		</tr>
		<tr style="height: 40; ">
			<td colspan="2">
				<input type="hidden" name="id" value="<%=mBean.getId() %>">
				<input type="submit" value="회원정보수정">&nbsp;&nbsp;
				<input type="button" value="회원정보조회" onclick="location.href='memberList.jsp?'"/>&nbsp;&nbsp;
				<input type="button" value="회원가입" onclick="location.href='memberJoinform.jsp?'"/>
			</td>
		</tr>
	</table>

</div>
</form>
</body>
</html>