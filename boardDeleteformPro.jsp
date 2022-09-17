<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.boardDAO" %>  
<%@ page import="kr.co.ezen.boardBean" %>   
<%	request.setCharacterEncoding("UTF-8");%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 정보 삭제 구현</title>
</head>
<body>
<jsp:useBean id="bBean" class="kr.co.ezen.boardBean">
		<jsp:setProperty name="bBean" property="*"/>
	</jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("password");
	
	boardDAO bdao = new boardDAO();
	
	String passwd = bdao.getPass(num);

	if(pass.equals(passwd)){
		bdao.deleteBoard(num);
		
		response.sendRedirect("boardList.jsp");
	}else{
%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다. 확인해 주세요.!!!");
		history.back();
	</script>	
	<%
	}
	%>	
	
</body>
</html>