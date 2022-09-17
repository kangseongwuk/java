<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import= "kr.co.ezen.memberDAO" %>
    <%@ page import= "kr.co.ezen.memberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	memberDAO mdao = new memberDAO();
	String pwd1 = mdao.getPassword(id);
	if(pwd1.equals(password)){
		mdao.deletemember(id);
	%>		
	<script>
			alert("삭제이 완료되었습니다!");
			location.href = "memberList.jsp";
	</script>
<%
	}
	
		

		//회원 정보 목록으로 이동
		%>
		
		<script>
			alert("비밀번호가 다릅니다.");
			location.href = "memberDetail.jsp?id=<%=id%>";
		</script>
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>