<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="kr.co.ezen.memberDAO"%>
<%@ page import="kr.co.ezen.memberBean"%>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세 화면</title>
<style>
table{
border: 1;
margin: auto;
border-collapse: collapse;
border-style: solid;
border-color: black;
}
td{
border: 1;
border-collapse: collapse;
border-style: solid;
border-color: black;
font-size: 20;
}
tr{

}
</style>
</head>

<body>

<% 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	memberDAO mdao = new memberDAO();
	memberBean mBean = mdao.oneselectmember(id);
	
%>

<table>

	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>아이디</td>
		<td width=350><%=mBean.getId()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>이름</td>
		<td width=350><%=mBean.getName()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>이메일</td>
		<td width=350><%=mBean.getEmail()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>전화번호</td>
		<td width=350><%=mBean.getTele()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>관심분야</td>
		<td width=350><%=mBean.getHobby()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>직업</td>
		<td width=350><%=mBean.getJob()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>연령대</td>
		<td width=350><%=mBean.getAge()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>하고싶은말</td>
		<td width=350><%=mBean.getInfo()%></td>
	</tr>
	<tr>
	<td align=center colspan=2>
	<button onclick="location.href='memberUpdateform.jsp?id=<%=mBean.getId() %>'">수정</button>
	<button onclick="location.href='memberDeleteform.jsp?id=<%=mBean.getId() %>'">삭제</button>
	<button onclick="location.href='memberList.jsp'">회원목록</button>
	<button onclick="location.href='memberJoinform.jsp'">회원가입</button>
	</td>
	</tr>
</table>


</body>
</html>