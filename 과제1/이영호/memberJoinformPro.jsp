<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import= "kr.co.ezen.memberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리 구현</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

	String id2 = request.getParameter("id");
	String name2= request.getParameter("name");
	String pwd1 = request.getParameter("passwd1");
	String pwd2 = request.getParameter("passwd2");
	String hobby[] = request.getParameterValues("hobby");
	String texthobby = "";
	
	for(int i=0; i<hobby.length;i++){
		texthobby += hobby[i] + " ";
	}
%>	
	<jsp:useBean id="mBean" class="kr.co.ezen.memberBean">
		<jsp:setProperty name="mBean" property="*"/>
	</jsp:useBean>
		<%
		if(id2.equals("")){
		%>
		<script>
			alert("아이디를 입력해주세요!");
			history.go(-1);
		</script>
	<%
	}else if(name2.equals("")){
	%>
				<script>
					alert("이름을 입력해주세요!");
					history.go(-1);
				</script>
		<%
		}else if(pwd1.equals("")&&pwd2.equals("")){
		%>		<script>
					alert("비밀번호를 입력해주세요");
					history.go(-1);
				</script>
	<%
	}else if(!pwd1.equals(pwd2)){
	%>		<script>
					alert("비밀번호가 다릅니다.");
					history.go(-1);
				</script>
	<%
	}else						//여기서부터 시작
		

		mBean.setHobby(texthobby);
		//데이터 베이스 클래스에 대한 객체 생성
		memberDAO mdao = new memberDAO();
		mdao.insertmember(mBean);

		//회원 정보 목록으로 이동
		response.sendRedirect("memberList.jsp");

	%>	

	
	
	
	
	
	

</body>
</html>