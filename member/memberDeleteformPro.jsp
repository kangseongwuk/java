<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.memberDAO" %>  
<%@ page import="kr.co.ezen.memberBean" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보삭제</title>
</head>
<body>
<jsp:useBean id="mBean" class="kr.co.ezen.memberBean">
		<jsp:setProperty name="mBean" property="*"/>
	</jsp:useBean>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	memberDAO mdao = new memberDAO();
	String pass = mdao.getPassword(id);
	
	if(pass.equals(password)){
		mdao.deletemember(mBean.getId());
		response.sendRedirect("memberList.jsp");
	}else{
%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다. 확인해 주세요.")
		history.back();//go(-1);
	</script>		
<%
	}
%>		
</body>
</html>