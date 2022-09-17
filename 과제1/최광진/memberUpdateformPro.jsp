<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.ezen.memberDAO" %>
<%@ page import="kr.co.ezen.memberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 구현</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>

	<jsp:useBean id="mBean" class="kr.co.ezen.memberBean">
		<jsp:setProperty name="mBean" property="*" />
	</jsp:useBean>
	
<%
	
	String id = request.getParameter("id");
	//데이터베이스 클래스에 대한 객체 생성
	memberDAO mdao = new memberDAO();
	
	String con_passwd = mdao.getPassword(id);
	
	if(mBean.getPasswd().equals(con_passwd)) {
		mdao.updatemember(mBean);
		
		out.print("<script>");
		out.print("alert('수정이 완료되었습니다.');");
		out.print("</script>");

		//회원정보 목록으로 이동
		response.sendRedirect("memberList.jsp");
		
	} else {
		%>
		<script type="text/javascript">
			alert("비번이 틀렸습니다. 다시 확인해 주십시오.")
			history.go(-1);
		</script>
		<%
		/*
		out.print("<script>");
		out.print("alert('비번이 틀렸습니다. 다시 확인해 주십시오.');");
		out.print("</script>");
		*/
	}
	

%>

</body>
</html>