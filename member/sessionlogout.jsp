<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionlogout.jsp</title>
</head>
<body>
<%
	String logout  = request.getParameter("logout");

	if(logout != null){
		session.setMaxInactiveInterval(0);
		session.invalidate();
		
		response.sendRedirect("mainSession.jsp");
	}


%>
</body>
</html>