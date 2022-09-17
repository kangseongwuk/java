<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import= "kr.co.ezen.memberDAO" %>
    <%@ page import= "kr.co.ezen.memberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트</title>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String tele = request.getParameter("tele");
	
	memberDAO mdao = new memberDAO();
	//memberBean mBean = mdao.oneselectmember(id);
	//String pwd1 = mBean.getPasswd1();
	
	String pwd1 = mdao.getPassword(id);
	if(!pwd1.equals(password)){
	%>		<script>
					alert("비밀번호가 다릅니다.");
					history.go(-1);
			</script>
<%
	}
	
		mdao.updatemember(id,email,tele);

		//회원 정보 목록으로 이동
		%>
		<script>
					alert("수정이 완료되었습니다!");
					location.href = "memberDetail.jsp?id=<%=id%>";
		</script>
		<%
%>
</head>
<body>

</body>
</html>