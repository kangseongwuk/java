<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.boardDAO" %>  
<%@ page import="kr.co.ezen.boardBean" %>   
<%	request.setCharacterEncoding("UTF-8");%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bBean" class="kr.co.ezen.boardBean">
		<jsp:setProperty name="bBean" property="*"/>
	</jsp:useBean>
<%
	boardDAO bdao = new boardDAO();
	
	String pass = bdao.getPass(bBean.getNum());

	if(pass.equals(bBean.getPassword())){
		bdao.updateBoard(bBean);
		
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