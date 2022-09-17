<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리 구현</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	
	
	String hobby[] = request.getParameterValues("hobby");
	String texthobby = "";
	
	for(int i=0; i<hobby.length; i++) {
		texthobby += hobby[i] + " ";
	}
	
%>

	<jsp:useBean id="mBean" class="kr.co.ezen.memberBean">
		<jsp:setProperty name="mBean" property="*" />
	</jsp:useBean>
	
<%
	mBean.setHobby(texthobby);

	String Driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String Id = "kj2";
	String pass = "1234";
	
	try{
		Class.forName(Driver);
		Connection conn = DriverManager.getConnection(url, Id, pass);
		String sql = "INSERT INTO campling_member VALUES(?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		pstmt.setString(1, mBean.getId());
		pstmt.setString(2, mBean.getPasswd());
		pstmt.setString(3, mBean.getName());
		pstmt.setString(4, mBean.getEmail());
		pstmt.setString(5, mBean.getTele());
		pstmt.setString(6, mBean.getHobby());
		pstmt.setString(7, mBean.getJob());
		pstmt.setString(8, mBean.getAge());
		pstmt.setString(9, mBean.getInfo());
		
		pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>

	<h2>setter변수(메모리)에 데이터 저장 중</h2>
	<table border="1" align="center" width="600">
		<tr height="50" align="center">
			<td width="200">아이디</td>
			<td><%=mBean.getId() %></td>
		</tr>
		<tr height="50" align="center">
			<td width="200">이  름</td>
			<td><%=mBean.getName() %></td>
		</tr>
		<tr height="50" align="center">
			<td width="200">이메일</td>
			<td><%=mBean.getEmail() %></td>
		</tr>
		<tr height="50" align="center">
			<td width="200">전화번호</td>
			<td><%=mBean.getTele() %></td>
		</tr>
		<tr height="50" align="center">
			<td width="200">관심분야</td>
			<td><%=mBean.getHobby() %></td>
		</tr>
		<tr height="50" align="center">
			<td width="200">직  업</td>
			<td><%=mBean.getJob() %></td>
		</tr>
		<tr height="50" align="center">
			<td width="200">연령대</td>
			<td><%=mBean.getAge() %></td>
		</tr>
		<tr height="50" align="center">
			<td width="200">하고 싶은 말</td>
			<td><%=mBean.getInfo() %></td>
		</tr>
	</table>
	


	
	<script type="text/javascript">
		alert("전송에 성공하였습니다.");
		//history.go(-1);
	</script>
	
</body>
</html>