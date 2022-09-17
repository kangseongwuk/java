<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sample7_Score.jsp</title>
</head>
<body>
	<h2>이름과 점수를 입력하세요</h2>
	<%request.setCharacterEncoding("UTF-8");%>
	<form method="post" action="Sample7_ScoreTest2.jsp">
		이름 : <input type="text" name="name" size="16"><br> 
		국어 점수 : <input type="text" name="kor" size="3"><br>
		영어 점수 : <input type="text" name="eng" size="3"><br>
		수학 점수 : <input type="text" name="mat" size="3">
		<p>
			<input type="submit" value="입력완료"> 
			<input type="reset" value="다시쓰기">
	</form>
</body>
</html>