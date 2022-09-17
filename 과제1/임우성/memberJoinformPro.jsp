<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="kr.co.ezen.memberDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리 구현</title>
<style>
table{
border: 1;
margin: auto;
border-collapse: collapse;
border-style: solid;
border-color: black;
}
td{
border: 1;
border-collapse: collapse;
border-style: solid;
border-color: black;
font-size: 20;
}
tr{

}
</style>
</head>

<body>

<% request.setCharacterEncoding("UTF-8");%>
<!-- 위의 문장이 먼저 오지 않으면 utf-8형태로 받아들이지 못한다. 제일 앞에 써야함. -->

	<jsp:useBean id="mBean" class="kr.co.ezen.memberBean">
		<jsp:setProperty name="mBean" property="*"/>
	</jsp:useBean>
	
	
<% 	
	
    String pass1 = mBean.getPasswd1();
    String pass2 = mBean.getPasswd2();
    
	if(!pass1.equals(pass2)){
	
%>
	<script type="text/javascript">
	alert("비밀번호가 틀립니다. 확인해주십시오.")
	history.go(-1);
	</script>
<%
	} else {
%>
	<script type="text/javascript">
	alert("전송에 성공하였습니다.")
	</script>
<%
	
	String hobby[]=request.getParameterValues("hobby");
	String texthobby = "";
	
	for(int i=0; i<hobby.length; i++){
		texthobby += hobby[i] + " ";
	}
	
	mBean.setHobby(texthobby);
	
	//데이터베이스 클래스에 대한 객체 생성
	memberDAO mdao = new memberDAO();
	mdao.insertmember(mBean);
	
	//회원 정보 목록으로 이동
	//response.sendRedirect("memberList.jsp");
	}

	/*Connection conn = null;
	String Driver="oracle.jdbc.OracleDriver";
	String dburl="jdbc:oracle:thin:@localhost:1521:xe";
	String dbid="hyun";
	String dbpass="1234";
	
	Class.forName(Driver);
	conn=DriverManager.getConnection(dburl,dbid,dbpass);*/
	
	/*String sql = "insert into camping_member values (?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,mBean.getId());
	pstmt.setString(2,mBean.getPasswd1());
	pstmt.setString(3,mBean.getName());
	pstmt.setString(4,mBean.getEmail());
	pstmt.setString(5,mBean.getTele());
	pstmt.setString(6,mBean.getHobby());
	pstmt.setString(7,mBean.getJob());
	pstmt.setString(8,mBean.getAge());
	pstmt.setString(9,mBean.getInfo());
	ResultSet rs = pstmt.executeQuery();
	}
	catch(Exception e){
	e.printStackTrace();
	}
	*/
%>
<h3 align=center>입력한 데이터 확인</h3>
<table>

	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>아이디</td>
		<td width=350><%=mBean.getId()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>이름</td>
		<td width=350><%=mBean.getName()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>이메일</td>
		<td width=350><%=mBean.getEmail()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>전화번호</td>
		<td width=350><%=mBean.getTele()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>관심분야</td>
		<td width=350><%=mBean.getHobby()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>직업</td>
		<td width=350><%=mBean.getJob()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>연령대</td>
		<td width=350><%=mBean.getAge()%></td>
	</tr>
	<tr height=40 align=center>
		<td bgcolor=#c0c0c0 width=250>하고싶은말</td>
		<td width=350><%=mBean.getInfo()%></td>
	</tr>


</table>
<br>
<button type="button" onclick="location='memberList.jsp'">회원 목록</button>


</body>
</html>