<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.ezen.memberBean"%>
<%@page import="kr.co.ezen.memberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세 보기 화면</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	
	memberDAO mdao = new memberDAO();
	memberBean mBean = mdao.oneselectmember(id);
	
%>
	<h2 align="center">회원정보 상세 보기 화면 구현</h2>
	<table border="1" align="center" width="400">
		<tr height="45" align="center" style="background:pink;">
			<td width="100">아이디</td>
			<td><%=mBean.getId() %></td>
		</tr>
		<tr height="45" align="center">
			<td width="100">이&nbsp;&nbsp;름</td>
			<td><%=mBean.getName() %></td>
		</tr>
		<tr height="45" align="center">
			<td width="100">이메일</td>
			<td><%=mBean.getEmail() %></td>
		</tr>
		<tr height="45" align="center">
			<td width="100">전화번호</td>
			<td><%=mBean.getTele() %></td>
		</tr>
		<tr height="45" align="center">
			<td width="100">관심분야</td>
			<td><%=mBean.getHobby() %></td>
		</tr>
		<tr height="45" align="center">
			<td width="100">직&nbsp;&nbsp;업</td>
			<td><%=mBean.getJob() %></td>
		</tr>
		<tr height="45" align="center">
			<td width="100">연령대</td>
			<td><%=mBean.getAge() %></td>
		</tr>
		<tr height="100" align="center">
			<td width="100">하고 싶은 말</td>
			<td><%=mBean.getInfo() %></td>
		</tr>
		<tr height="45" align="center">
			<td colspan="2">
				<button onclick="location.href='memberUpdateform.jsp?id=<%=mBean.getId() %>'">수정</button>&nbsp;&nbsp;
				<button onclick="location.href='memberDeleteform.jsp?id=<%=mBean.getId() %>'">삭제</button>&nbsp;&nbsp;
				<button onclick="location.href='memberList.jsp'">돌아가기</button>&nbsp;&nbsp;
				<button onclick="location.href='memberJoinform.jsp'">회원가입</button>
			</td>
		</tr>
	</table>

</body>
</html>