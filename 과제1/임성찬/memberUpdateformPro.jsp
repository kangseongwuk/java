<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="kr.co.ezen.memberDAO" %>
    <%@ page import="kr.co.ezen.memberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 처리</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>

<%	
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("password");
	
	
	
		memberDAO mdao = new memberDAO();
		String pass = mdao.getPassword(id);
%>		
<jsp:useBean id="mBean" class="kr.co.ezen.memberBean">
	<jsp:setProperty name="mBean" property="*"/>
</jsp:useBean>
<% 
		if(pass.equals(passwd)){
		mdao.updatemember(mBean);
		response.sendRedirect("memberList.jsp");
		
		}else{
%>
<script type="text/javascript">
	alert("비밀번호가 틀립니다. 확인해주세요");
	location="memberList.jsp";
</script>
<%} %>
</body>
</html>