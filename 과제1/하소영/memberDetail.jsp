<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.memberBean" %>  
<%@ page import="kr.co.ezen.memberDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
</head>
<body>
<%
	String id = request.getParameter("id");

	memberDAO mdao = new memberDAO();
	memberBean mBean = mdao.oneselectmember(id);

%>

<h2>회원 상세 정보</h2>

	<table border="1" align="center" width = "30%">
	 
		 <tr style="background-color:mistyrose;" height="40" align="center">
			<td width="100">아이디</td> 
			<td><%=mBean.getId() %></td>	
		</tr>
		
		<tr height="40" align="center" style="background-color:aliceblue;">	
		 	<td width="160">이&nbsp;&nbsp;름</td>
		 	<td><%=mBean.getName() %></td>
		</tr>	
		
		<tr height="40" align="center" style="background-color:aliceblue;"> 	
		 	<td width="160">연령대</td>
		 	<td><%=mBean.getAge() %></td>
		</tr>
		
		<tr height="40" align="center" style="background-color:aliceblue;">
		 	<td width="200">전자우편</td>
		 	<td><%=mBean.getEmail() %></td>
		</tr>	
		 	
		<tr height="40" align="center" style="background-color:aliceblue;"> 	
			<td width="200">전화번호</td>
			<td><%=mBean.getTel() %></td>
		</tr>	
		
		<tr height="40" align="center" style="background-color:aliceblue;">
		 	<td width="160">닉네임</td>
		 	<td><%=mBean.getNick() %></td>
		</tr>	
		
		<tr height="40" align="center" style="background-color:aliceblue;">
			<td width="160">관심분야</td>	
			<td><%=mBean.getHobby() %></td>
		</tr>		 
		
		<tr height="40" align="center" style="background-color:aliceblue;">
			<td width="160">직&nbsp;&nbsp;업</td>
			<td><%=mBean.getJob() %></td>
		</tr>		
		
		<tr height="40" align="center" style="background-color:aliceblue;">
		 	<td width="200">하고 싶은 말</td>
		 	<td><%=mBean.getInfo() %></td>
		</tr>
		
		<tr height="40" align="center" style="background-color:mistyrose;">
			<td colspan="2">
				<button onclick="location.href='memberUpdateform.jsp?id=<%=mBean.getId() %>'">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button onclick="location.href='memberDeleteform.jsp?id=<%=mBean.getId() %>'">삭제</button>
				&nbsp;&nbsp;&nbsp;
				<button onclick="location.href='memberList.jsp?'">회원 목록</button>
				&nbsp;&nbsp;&nbsp;
				<button onclick="location.href='memberJoinForm.jsp?">회원 가입</button>
			</td>
		</tr>	 	
	</table>

</body>
</html>