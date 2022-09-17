<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.ezen.memberDAO"%>
<%@ page import="kr.co.ezen.memberBean"%>
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
<h2 align = "center">회원정보 수정 페이지</h2>

<form action="memberUpdateformPro.jsp" method="post">
<table border="1">
	<tr height="40" align="center">
 		<td width="150">아이디</td>
 		<td width="250"><input type="text" name="id" size="67" value="<%=mBean.getId()%>"/></td>
 	</tr>
 	<tr height="40" align="center">
 		<td width="150">비밀번호확인</td>
 		<td width="250"><input type="password" name="passwd1" size="67" /></td>
 	</tr>
 	<tr height="40" align="center">
 		<td width="150">이름</td>
 		<td width="250"><input type="text" name="name" size="67" 
 		value="<%=mBean.getName()%>"></td>
 	</tr>
 	<tr height="40" align="center">
 		<td width="150">이메일</td>
 		<td width="250"><input type="email" name="email" size="67" 
 		value="<%=mBean.getEmail()%>"/></td>
 	</tr>
 	<tr height="40" align="center">
 		<td width="150">전화번호</td>
 		<td width="250"><input type="text" name="tele" size="67" 
 		value="<%=mBean.getTele()%>"/></td>
 	</tr>
 	<tr>
		<td align=center colspan=2>
		<input type=hidden name=id value="<%=mBean.getId() %>"/>
		<button type=submit>회원정보수정</button>
		<button type=button onclick="location.href='memberList.jsp'">회원목록</button>
		<button type=button onclick="location.href='memberJoinform.jsp'">회원가입</button>
		</td>
	</tr>
 	
</table>
</form>

</body>
</html>