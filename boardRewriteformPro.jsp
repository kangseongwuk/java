<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.boardDAO" %>  
<%@ page import="kr.co.ezen.boardBean" %>   
<%	request.setCharacterEncoding("UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 댓글 쓰기(저장)</title>
</head>
<body>
<jsp:useBean id="bBean" class="kr.co.ezen.boardBean">
		<jsp:setProperty name="bBean" property="*"/>
	</jsp:useBean>
<%
	boardDAO bdao = new boardDAO();
	bdao.rewriteBoard(bBean);
	
	response.sendRedirect("boardList.jsp");
	
%>
</body>
</html>