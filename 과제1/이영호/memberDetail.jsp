<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import= "kr.co.ezen.memberDAO" %>
    <%@ page import= "kr.co.ezen.memberBean" %>
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
	memberBean mBean = mdao.oneselectmember(id);
%>
<h2 align="center">회원정보 상세 보기 화면 구현</h2>
<div align="center">
	<table border="1" style="align:center; width:100%; background: aliceblue; ">
			<tr>
				<td width="100" align= "center" style= "height:40; background: pink;">아이디</td>
				<td align= "center"><%=mBean.getId()%></td>
			</tr>
			<tr>
				<td width="120" align= "center" style= "height:40; background: pink;">이&nbsp;&nbsp;&nbsp;름</td>
				<td align= "center"><%=mBean.getName()%></td>
			</tr>
			<tr>
				<td width="120" align= "center" style= "height:40; background: pink;">이메일</td>
				<td align= "center"><%=mBean.getEmail()%></td>
			</tr>
			<tr>
				<td width="120" align= "center" style= "height:40; background: pink;">전화번호</td>
				<td align= "center"><%=mBean.getTele()%></td>
			</tr>
			<tr>
				<td width="120" align= "center" style= "height:40; background: pink;">취미</td>
				<td align= "center"><%=mBean.getHobby()%></td>
			</tr>
			<tr>
				<td width="80" align= "center" style= "height:40; background: pink;">직&nbsp;&nbsp;&nbsp;업</td>
				<td align= "center"><%=mBean.getJob()%></td>
			</tr>
			<tr>
				<td width="50" align= "center" style= "height:40; background: pink;">연령대</td>
				<td align= "center"><%=mBean.getAge()%></td>
			</tr>
			<tr>
				<td align= "center" style= "height:40; background: pink;">하고싶은 말</td>
		
				<td align= "center"><%=mBean.getInfo()%></td>
			</tr>
			<tr>
					<td align="center" colspan="2" style= "background: white;">
					<button onclick="location.href='memberUpdateform.jsp?id=<%=mBean.getId()%>'">수정버튼</button>&nbsp;&nbsp;
					<button onclick="location.href='memberDeleteform.jsp?id=<%=mBean.getId()%>'">삭제버튼</button>&nbsp;&nbsp;
					<button onclick="location.href='memberList.jsp'">회원정보조회버튼</button>&nbsp;&nbsp;
					<button onclick="location.href='memberjoinform.jsp'">회원가입버튼</button>
					</td>
			</tr>
	</table>
</div>
</body>
</html>