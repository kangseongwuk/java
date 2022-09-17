<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.ezen.memberDAO" %>
    <%@ page import="kr.co.ezen.memberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세 보기</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	
	memberDAO mdao = new memberDAO();
	memberBean mBean =  mdao.oneselectmember(id);
%>
	<h2 align="center">회원정보 상세 보기 화면 구현</h2>
	<div align="center">
	<table border="1" align="center" width="600" >
		<tr height="40" align="center" style="background-color : lightgreen">
			<td width="100">아이디</td>
			<td><%=mBean.getId() %></td>
		</tr>
		<tr height="40" align="center" style="background-color : lightblue">
			<td width="120">이름</td>
			<td><%=mBean.getName() %></td>
		</tr>
		<tr height="40" align="center" style="background-color : lightblue">
			<td width="120">전자우편</td>
			<td><%=mBean.getEmail() %></td>
		</tr>
		<tr height="40" align="center" style="background-color : lightblue">
			<td width="120">전화번호</td>
			<td><%=mBean.getTele() %></td>
		</tr>
		<tr height="40" align="center" style="background-color : lightblue">
			<td width="120">관심분야</td>
			<td><%=mBean.getHobby() %></td>
		</tr>
		<tr height="40" align="center" style="background-color : lightblue">
			<td width="80">직업</td>
			<td><%=mBean.getJob() %></td>
		</tr>
		<tr height="40" align="center" style="background-color : lightblue">
			<td width="50">연령대</td>
			<td><%=mBean.getAge() %></td>
		</tr>
		<tr height="40" align="center" style="background-color : lightblue">
			<td>하고 싶은 말</td>
			<td><%=mBean.getInfo() %></td>
		</tr>
		<tr height="40" align="center">
			<td colspan="2">
				<button onclick="location.href='memberUpdateform.jsp?id=<%=mBean.getId() %>'">수정버튼</button>&nbsp;&nbsp;
				<button onclick="location.href='memberDeleteform.jsp?id=<%=mBean.getId() %>'">삭제버튼</button>&nbsp;&nbsp;
				<button onclick="location.href='memberList.jsp?'">회원정보조회</button>&nbsp;&nbsp;
				<button onclick="location.href='memberjoinform.jsp?'">회원가입</button>
		</tr>
	</table>
	</div>
	
</body>
</html>