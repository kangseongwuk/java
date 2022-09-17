<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sample7_Score2.jsp</title>
</head>
<body>
	<h2>JavaBeans를 이용한 학생의 점수에 따른 성적 처리 예제</h2>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="score" class="Beans.GradeBeanTest" scope="page" />
	<!--  GradeBean score = new GradeBean(); 와 같다. -->
	<HR>
	<h3>폼에서 전달받은 이름과 성적을 JavaBeans GradeBean에 저장</h3>
	<p>
		이름 : <%=request.getParameter("name")%>, 
		국어 점수 : <%=request.getParameter("kor")%>,
		영어 점수 : <%=request.getParameter("eng")%>,
		수학 점수 : <%=request.getParameter("mat")%> <p>
		
		<jsp:setProperty name="score" property="name" param="name" />
		<jsp:setProperty name="score" property="kor" param="kor" />
		<jsp:setProperty name="score" property="eng" param="eng" />
		<jsp:setProperty name="score" property="mat" param="mat" />
	<HR>
	<h3>JavaBeans GradeBean에 저장된 정보를 조회 출력</h3>
	<p>
		이름 : <jsp:getProperty name="score" property="name" /> <BR> 
		국어 점수 : <jsp:getProperty name="score" property="kor" /> <BR> 
		영어 점수 : <jsp:getProperty name="score" property="eng" /> <BR> 
		수학 점수 : <jsp:getProperty name="score" property="mat" /> <BR> 
		총점 : <jsp:getProperty name="score" property="total" /> <BR> 
		평균 : <jsp:getProperty name="score" property="aver" /> <BR> 
		등급 : <jsp:getProperty name="score" property="grade" />
		
</body>
</html>