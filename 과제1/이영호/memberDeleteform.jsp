<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import= "kr.co.ezen.memberDAO" %>
    <%@ page import= "kr.co.ezen.memberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 구현</title>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	memberDAO mdao = new memberDAO();
	
	String pwd1 = mdao.getPassword(id);
%>
</head>
<body>
		<script>
			alert("비밀번호를 입력해주세요!");
		</script>
<form action="memberDeleteformPro.jsp" method="post">
<div align="center">
	<table border="1" style="align:center; width:100%; background: aliceblue; ">
		<tr>
			<td width="100" align= "center" style= "height:40; background: pink;">아이디</td>
			<td align= "center"><%=id%></td>
		</tr>
		<tr>
			<td width="100" align= "center" style= "height:40; background: pink;">비밀번호</td>
			<td align= "center">
				<input type="password" name="password">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2" style= "background: white;">
				<input type="hidden" name="id" value="<%=id%>">
				<input type="submit" value="삭제하기" >&nbsp;&nbsp;
			</td>
		</tr>
	</table>
</div>
</form>

</body>
</html>