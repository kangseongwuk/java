<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.memberBean" %>  
<%@ page import="kr.co.ezen.memberDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id = "mBean" class = "kr.co.ezen.memberBean">
	<jsp:setProperty name="mBean" property="*" />
	</jsp:useBean>

	<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
			
	memberDAO mdao = new memberDAO();
	String pass1 = mdao.getPassword(id);
		
	if(pass1.equals(password)){
		mdao.updatemember(mBean);
		response.sendRedirect("memberList.jsp");
	} else{
	%>

	<script>
		alert("비밀번호가 다릅니다.")
		history.back(); //go(-1);
	</script>

	<% } %>
</body>
</html>