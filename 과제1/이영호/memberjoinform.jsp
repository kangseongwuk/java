<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
<h2 align="center">회원가입 페이지</h2>
<form action="memberJoinformPro.jsp" method="post" align="center">
	<table border="1" align="center" width="600">
		<tr height="40" align="center">
			<td width="150">아이디</td>
			<td width="250"><input type="text" name="id" size="60" placeholder="id입력칸"></td>
		</tr>
		<tr height="40" align="center">
			<td width="150">비밀번호</td>
			<td width="250"><input type="password" name="passwd1" size="60"
				placeholder="비밀번호는 영문자, 숫자, 숫자, 특수문자 8자리 이상 15자리 이하로 입력"></td>
		</tr>
		<tr height="40" align="center">
			<td width="150">비밀번호확인</td>
			<td width="250"><input type="password" name="passwd2" size="60" 
				placeholder="비밀번호는 영문자, 숫자, 숫자, 특수문자 8자리 이상 15자리 이하로 입력"></td>
		</tr>
		<tr height="40" align="center">
			<td width="150">이름</td>
			<td width="250"><input type="text" name="name" size="60" placeholder="이름"></td>
		</tr>
		<tr height="40" align="center">
			<td width="150">전자우편</td>
			<td width="250"><input type="email" name="email" size="60" placeholder="id@domain.com"></td>
		</tr>
		<tr height="40" align="center">
			<td width="150">전화번호</td>
			<td width="250"><input type="text" name="tele" size="60" 
				placeholder="010-1234-5678"></td>
		</tr>
		<tr height="40" align="center">
			<td width="150">관심분야</td>
			<td width="250">
				<input type="checkbox" name="hobby" value="등산" >등산
				<input type="checkbox" name="hobby" value="영화" >영화
				<input type="checkbox" name="hobby" value="게임" >게임
				<input type="checkbox" name="hobby" value="주식" >주식
				<input type="checkbox" name="hobby" value="부동산" >부동산
				<input type="checkbox" name="hobby" value="코딩" >코딩
			</td>
		</tr>
		<tr height="40" align="center">
			<td width="150">직업</td>
			<td width="250">
				<select name="job">
					<option value="교수">교수</option>
					<option value="공무원">공무원</option>
					<option value="프로그래머">프로그래머</option>
					<option value="디자이너">디자이너</option>
					<option value="운동선수">운동선수</option>
					<option value="자영업">자영업</option>
					<option value="서비스직">서비스직</option>
					<option value="무직" selected>무직</option>
				</select>
			</td>
		</tr>
		<tr height="40" align="center">
			<td width="150">연령대</td>
			<td width="250">
				<input type="radio" name="age" value="10대" >10대
				<input type="radio" name="age" value="20대" >20대
				<input type="radio" name="age" value="30대" >30대
				<input type="radio" name="age" value="40대" >40대
				<input type="radio" name="age" value="50대" >50대
				<input type="radio" name="age" value="60대" >60대이상
			</td>
		</tr>
		<tr height="40" align="center">
			<td width="150">하고싶은 말</td>
			<td width="250">
				<textarea rows="7" cols="62" name="info"></textarea>
			</td>
		</tr>
		<tr height="40" align="center">
			<td colspan="2">
				<input type="submit" value="회원가입"/>&nbsp;&nbsp;
				<input type="reset" value="취소"/>
			</td>
		</tr>
	</table>

</form>
</body>
</html>