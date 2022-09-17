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

<!-- ---------------------------------------------------------------------------------------- -->

<h2 align="center">회원정보 수정 화면 구현</h2>
<form action="memberUpdateformPro.jsp" method="post">
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
					<td align= "center">
						<input type="email" name="email" value="<%=mBean.getEmail()%>">
					</td>
					
				</tr>
				<tr>
					<td width="120" align= "center" style= "height:40; background: pink;">전화번호</td>
					<td align= "center">
						<input type="text" name="tele" value="<%=mBean.getTele()%>">
					</td>
				</tr>
				<tr>
					<td width="100" align= "center" style= "height:40; background: pink;">비밀번호</td>
					<td align= "center">
						<input type="password" name="password">
					</td>
				</tr>

				<tr>
					<td align= "center" style= "height:40; background: pink;">하고싶은 말</td>
			
					<td align= "center"><%=mBean.getInfo()%></td>
				</tr>
				<tr>
					<td align="center" colspan="2" style= "background: white;">
						<input type="hidden" name="id" value="<%=mBean.getId()%>">
						<input type="submit" value="회원정보수정" >&nbsp;&nbsp;
						<button onclick="location.href='memberList.jsp'">회원정보조회버튼</button>&nbsp;&nbsp;
						<button onclick="location.href='memberjoinform.jsp'">회원가입</button>
					</td>
				</tr>
		</table>
	</div>
</form>
</body>
</html>