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
	<table border="1" align="center" width="700">
		<tr height="40">
			<td width="150">*아이디</td>
			<td><input type="text" name="id" size="60" placeholder="아이디 입력"/></td>
		</tr>
		<tr height="40">
			<td width="150">*비밀번호</td>
			<td><input type="password" name="passwd" size="60"
				placeholder="비밀번호는 영문자, 숫자, 특수문자로 8~15자리로 입력"/></td>
		</tr><tr height="40">
			<td width="150">*비밀번호 확인</td>
			<td><input type="password" name="passwd2" size="60"
				placeholder="비밀번호는 영문자, 숫자, 특수문자로 8~15자리로 입력"/></td>
		</tr>
		<tr height="40">
			<td width="150">*이름</td>
			<td><input type="text" name="name" size="60" placeholder="홍길동 [예시]"/></td>
		</tr>
		<tr height="40">
			<td width="150">*이메일</td>
			<td><input type="email" name="email" size="60" placeholder="asd123@domain.com [예시]"/></td>
		</tr>
		<tr height="40">
			<td width="150">*전화번호</td>
			<td><input type="text" name="tele" size="60" placeholder="010-1234-5678 / 02-123-4567 [예시]"/></td>
		</tr>
		<tr height="40">
			<td width="150">관심분야</td>
			<td>
				<input type="checkbox" name="hobby" value="캠핑" />캠핑
				<input type="checkbox" name="hobby" value="등산" />영화
				<input type="checkbox" name="hobby" value="영화" />영화
				<input type="checkbox" name="hobby" value="독서" />독서
				<input type="checkbox" name="hobby" value="게임" />게임
				<input type="checkbox" name="hobby" value="여행" />여행
			</td>
		</tr>
		<tr height="40">
			<td width="150">직업</td>
			<td>
				<select name="job">
					<option value="교수">교수</option>
					<option value="공무원">공무원</option>
					<option value="프로그래머">프로그래머</option>
					<option value="디자이너">디자이너</option>
					<option value="운동선수">운동선수</option>
					<option value="자영업">자영업</option>
					<option value="서비스직">서비스직</option>
				</select>
			</td>
		</tr>
		<tr height="40">
			<td width="150">연령대</td>
			<td>
				<input type="radio" name="age" value="10대" />10대
				<input type="radio" name="age" value="20대" />20대
				<input type="radio" name="age" value="30대" />30대
				<input type="radio" name="age" value="40대" />40대<br>
				<input type="radio" name="age" value="50대" />50대
				<input type="radio" name="age" value="60대" />60대
				<input type="radio" name="age" value="70대" />70대
				<input type="radio" name="age" value="80대" />80대
			</td>
		</tr>
		<tr height="80">
			<td width="150">하고 싶은 말<br>(최대 1000자)</td>
			<td>
				<textarea rows="7" cols="67" name="info" style="resize:none"></textarea>
			</td>
		</tr>
		<tr height="40">
			<td colspan="2">
				<input type="submit" value="회원가입">&nbsp;&nbsp;
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	*은 필수 사항

</form>



</body>
</html>