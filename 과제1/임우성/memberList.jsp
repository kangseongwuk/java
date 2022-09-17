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
<title>회원 목록 화면</title>
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

	memberDAO mdao = new memberDAO();
	Vector<memberBean> vec = mdao.allselectmember();
	
%>

<h2 align=center>회원 목록</h2>
<table>

	<tr height=40>
		<td align=center width=100 bgcolor=#c0c0c0>아이디</td>
		<td align=center width=120 bgcolor=#c0c0c0>이름</td>
		<td align=center width=120 bgcolor=#c0c0c0>이메일</td>
		<td align=center width=120 bgcolor=#c0c0c0>전화번호</td>
		<td align=center width=120 bgcolor=#c0c0c0>관심분야</td>
		<td align=center width=80 bgcolor=#c0c0c0>직업</td>
		<td align=center width=50 bgcolor=#c0c0c0>연령대</td>
		<td align=center bgcolor=#c0c0c0>하고싶은말</td>
	</tr>
<%
	for(int i = 0; i<vec.size(); i++){
		memberBean mBean = vec.get(i);
	%>
	<tr>
		<td align=center><a href="memberDetail.jsp?id=<%=mBean.getId()%>"><%=mBean.getId()%></a></td>
		<td><%=mBean.getName()%></td>
		<td><%=mBean.getEmail()%></td>
		<td><%=mBean.getTele()%></td>
		<td><%=mBean.getHobby()%></td>
		<td><%=mBean.getJob()%></td>
		<td><%=mBean.getAge()%></td>
		<td><%=mBean.getInfo()%></td>
	</tr>	
	<%}
	
	%>
		
</table>
<hr>
<div align=center>
<button onclick="location.href='memberJoinform.jsp'">회원가입</button>
</div>
	
</body>
</html>