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
		
	memberDAO mdao = new memberDAO();
	mdao.updatemember(mBean);
	
	response.sendRedirect("memberList.jsp");
	
	%>

<h2>회원정보 수정</h2>
<br>
<br>
<p><%=mBean.getNick() %>님의 정보가 수정되었습니다.</p>
<br>


</body>
</html>