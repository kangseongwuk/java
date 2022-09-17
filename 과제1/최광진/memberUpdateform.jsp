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

<h2 align="center">회원정보 수정 화면 구현</h2>
<form action="memberUpdateformPro.jsp" method="post" align="center">
	<table border="1" align="center" width="700">
		<tr height="40" align="center" style="background:pink;">
			<td width="150">아이디</td>
			<td><%=mBean.getId() %></td>
		</tr>
		<tr height="40" align="center">
			<td width="150">*비밀번호</td>
			<td><input type="password" name="passwd" size="60"
				placeholder="비밀번호는 영문자, 숫자, 특수문자로 8~15자리로 입력"></td>
		</tr>
		<tr height="40" align="center">
			<td width="100">이&nbsp;&nbsp;름</td>
			<td><%=mBean.getName() %></td>
		</tr>
		<tr height="40" align="center">
			<td width="150">*이메일</td>
			<td><input type="email" name="email" size="60" value="<%=mBean.getEmail() %>"></td>
		</tr>
		<tr height="40" align="center">
			<td width="150">*전화번호</td>
			<td><input type="text" name="tele" size="60" value="<%=mBean.getTele() %>"></td>
		</tr>
		<tr height="80" align="center">
			<td width="150">하고 싶은 말<br>(최대 1000자)</td>
			<td>
				<textarea rows="7" cols="67" name="info" value="<%=mBean.getInfo() %>" style="resize:none"></textarea>
			</td>
		</tr>
		<tr height="40">
			<td colspan="2" align="center">
				<input type="hidden" name="id" value="<%=mBean.getId() %>">&nbsp;&nbsp;
				<input type="submit" value="수정">&nbsp;&nbsp;
				<input type="reset" value="재작성">&nbsp;&nbsp;
				<input type="button" value="회원정보 돌아가기" onclick="location.href='memberList.jsp'">&nbsp;&nbsp;
				<input type="button" value="회원가입" onclick="location.href='memberJoinform.jsp'">
			</td>
		</tr>
	</table>
	*은 필수 사항
</form>

</body>
</html>