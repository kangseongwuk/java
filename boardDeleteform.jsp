<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.boardDAO" %>  
<%@ page import="kr.co.ezen.boardBean" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 정보 삭제 화면</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	boardDAO bdao = new boardDAO();	
	boardBean bBean = bdao.UpdateOneSelectBoard(num);
%>
<h2 align="center">게시판 정보 삭제 화면</h2>
<div align="center">
	<form action="boardDeleteformPro.jsp" method="post"> 
		<table border="1" style="width: 800px; text-align: center;">
			<tr style="height: 50px; background: yellow;">
				<td width="80">번호</td>
				<td><%=bBean.getNum() %></td>		
				<td width="120">작성자</td>
				<td><%=bBean.getWriter() %></td>			
			</tr>	
			<tr style="height: 50px; background: yellow;">							
				<td width="80">비밀번호</td>
				<td colspan="3"><input type="password" name="password" size="50"></td>		
			</tr>
			<tr style="height: 50px;">
				<td colspan="4">
					<input type="hidden" name="num" value="<%=bBean.getNum() %>">
					<input type="submit" value="삭제완료">&nbsp;&nbsp;
					<input type="reset" value="삭제취소">&nbsp;&nbsp;
					<input type="button" onclick="location.href='boardList.jsp'" value="글목록보기"></button>&nbsp;&nbsp;
					<input type="button" onclick="location.href='memberJoinform.jsp'" value="회원가입"></button>
				</td>
			</tr>			
		</table>	
	</form>
</div>

</body>
</html>