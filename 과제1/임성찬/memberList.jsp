<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="kr.co.ezen.memberDAO" %>
    <%@ page import="kr.co.ezen.memberBean" %>
   <%@ page import="java.util.Vector" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 보기 화면</title>
</head>
<body>
<%
	memberDAO mdao = new memberDAO();

	Vector<memberBean> vec = mdao.allselectmember();

%>
<h2 align="center">데이터 출력</h2>
	<table border="1" align="center" width="600">
		<tr height="40" align="center" style="background-color : lightgreen">
			<td width="100">아이디</td>
			<td width="120">이름</td>
			<td width="120">전자우편</td>
			<td width="120">전화번호</td>
			<td width="120">관심분야</td>
			<td width="80">직업</td>
			<td width="50">연령대</td>
			<td>하고 싶은 말</td>
		</tr>
		<%
			for(int i=0; i < vec.size(); i++){
				
				memberBean mBean = vec.get(i);
		
		%>
		<tr height="40" align="center" style="background-color : lightblue">
		<td><a href="memberDetail.jsp?id=<%=mBean.getId() %>"><%=mBean.getId() %></a></td>
		<td><%=mBean.getName() %></td>
		<td><%=mBean.getEmail() %></td>
		<td><%=mBean.getTele() %></td>
		<td><%=mBean.getHobby() %></td>
		<td><%=mBean.getJob() %></td>
		<td><%=mBean.getAge() %></td>
		<td><%=mBean.getInfo() %></td>
		</tr>
		<%	} %>
		</table>
</body>
</html>