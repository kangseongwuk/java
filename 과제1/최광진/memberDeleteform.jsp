<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.memberDAO"%>
<%@ page import="kr.co.ezen.memberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 삭제 화면 구현</title>
</head>
<body>
<%
	String id = request.getParameter("id");

	memberDAO mdao = new memberDAO();
	memberBean mBean = mdao.oneselectmember(id);
%>

<h2 align="center">회원정보 삭제 화면 구현</h2>
<form action="memberDeleteformPro.jsp" method="post" align="center">
	<table border="1" align="center" width="700">
		<tr height="60">
			<td width="150" colspan="2" align="center">삭제하시려면 비번을 입력해주세요.</td>
		</tr>
		<tr height="40" align="center">
			<td width="150">비밀번호 확인</td>
			<td><input type="password" name="passwd" size="60"
				placeholder="비밀번호는 영문자, 숫자, 특수문자로 8~15자리로 입력"></td>
		</tr>
		<tr height="40">
			<td colspan="2" align="center">
				<input type="hidden" name="id" value="<%=mBean.getId() %>">&nbsp;&nbsp;
				<input type="submit" value="확인">&nbsp;&nbsp;
				<input type="button" value="회원정보 돌아가기" onclick="location.href='memberList.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>