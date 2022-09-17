<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.ezen.memberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리 구현</title>
</head>
<body>

		

	<%
		request.setCharacterEncoding("UTF-8");
	
		String hobby[] = request.getParameterValues("hobby");
		String texthobby = " ";
		 
		for(int i = 0; i< hobby.length; i++){
			 texthobby += hobby[i] + " ";
		}
		 
						
	%>
	
	<jsp:useBean id = "mBean" class = "kr.co.ezen.memberBean">
		<jsp:setProperty name="mBean" property="*" />
	</jsp:useBean>
	
	<%				
		mBean.setHobby(texthobby);	
	
		//데이터베이스 클래스에 대한 객체 생성
		memberDAO mdao = new memberDAO();
		mdao.insertmember(mBean);
		
		//회원정보 목록으로 이동
		response.sendRedirect("memberList.jsp");
		
	%>	 
		 
		 
	 <h3>회원가입에 성공했습니다</h3>
	 
	 
	 <p><%=mBean.getNick() %>님 회원가입을 축하드립니다.</p>
	 <br>
	 <br>
	 <br>
	 <br>
	 
	
</body>
</html>