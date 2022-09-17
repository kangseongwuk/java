<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="kr.co.ezen.memberDAO"%>
<%@ page import="kr.co.ezen.memberBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리 구현</title>
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
%>

    <jsp:useBean id="mBean2" class="kr.co.ezen.memberBean">
		<jsp:setProperty name="mBean2" property="id"/>
		<jsp:setProperty name="mBean2" property="passwd1"/>
		<jsp:setProperty name="mBean2" property="name"/>
		<jsp:setProperty name="mBean2" property="email"/>
		<jsp:setProperty name="mBean2" property="tele"/>
	</jsp:useBean>

<%

	//mBean은 mBean2의 id를 입력해 받아온 db데이터 object
	//mBean2는 form에서 입력받은 데이터 object
	
	memberDAO mdao = new memberDAO();
	String id = mBean2.getId();
	memberBean mBean = mdao.oneselectmember(id);

    String pass1 = mBean.getPasswd1();
    String pass2 = mBean2.getPasswd1();
    
	if(!pass1.equals(pass2)){
	
%>

	<script type="text/javascript">
	alert("비밀번호가 틀립니다. 확인해주십시오.")
	history.go(-1);
	</script>
	
<%
	} else {
%>

	<script type="text/javascript">
	alert("전송에 성공하였습니다.")
	</script>
	
<%
	mdao.updatemember(mBean2);
	}
%>

<h3 align=center>입력한 데이터 확인</h3>
<table>

	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>아이디</td>
		<td width=350><%=mBean2.getId()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>이름</td>
		<td width=350><%=mBean2.getName()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>이메일</td>
		<td width=350><%=mBean2.getEmail()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>전화번호</td>
		<td width=350><%=mBean2.getTele()%></td>
	</tr>


</table>
<br>
<button type="button" onclick="location='memberList.jsp'">회원 목록</button>


</body>
</html>