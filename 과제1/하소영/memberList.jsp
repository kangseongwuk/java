<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.memberDAO" %>
<%@ page import="kr.co.ezen.memberBean" %>
<%@ page import="java.util.Vector" %>
<%@ page import="kr.co.ezen.memberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<%
		memberDAO mdao = new memberDAO();
		
		Vector<memberBean> vec = mdao.allselectmember();

	%>
<h2 align="center">데이터 출력</h2>	
	<table border="1" align="center" width = "70%">
	 
	 <tr style="background-color:mistyrose;" height="40" align="center">
		<td width="100">아이디</td> 	
	 	<td width="160">이&nbsp;&nbsp;름</td>
	 	<td width="160">연령대</td>
	 	<td width="200">전자우편</td>
		<td width="200">전화번호</td>
	 	<td width="160">닉네임</td>
		<td width="160">관심분야</td>	 
		<td width="160">직&nbsp;&nbsp;업</td>
	 	<td width="200">하고 싶은 말</td>
		
	 </tr>
	 <%
	 for(int i = 0; i < vec.size(); i++){
		 memberBean mBean = vec.get(i);
	 %>
	
	  <tr height="40" align="center">
	  <td><a href="memberDetail.jsp?id=<%=mBean.getId() %>"><%=mBean.getId() %></a></td>
	  <td><%=mBean.getName() %></td>
	  <td><%=mBean.getAge() %></td>
	  <td><%=mBean.getEmail() %></td>
	  <td><%=mBean.getTel() %></td>
	  <td><%=mBean.getNick() %></td>
	  <td><%=mBean.getHobby() %></td>
	  <td><%=mBean.getJob() %></td>
	  <td><%=mBean.getInfo() %></td>
	  
	  	</tr>
	  	<% } %>
	   </table>
</body>
</html>