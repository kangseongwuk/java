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
<form action ="memberJoinFormPro.jsp" method="post" align="center">
	<table border ="1" align="center" width="40%">
		<tr height = "30">
			<td width = "150" align="center">아이디</td>
			<td width = "400"><input type="text" name="id" size ="80" placeholder="id는 필수값입니다" /></td>
		</tr>
			
		<tr height = "30">
			<td width = "150" align="center">비밀번호</td>
			<td width = "600"><input type="password" name="pass" size ="80" 
				placeholder="대소문자 숫자 특수문자를 사용하여 8~15자로 입력하세요" /></td>
		</tr>
			
		<tr height = "30">
			<td width = "150" align="center">비밀번호 확인</td>
			<td width = "600"><input type="password" name="pass2" size ="80"
				 placeholder="비밀번호를 다시 한 번 입력하세요" /></td>
		</tr>
			
		<tr height = "30">
			<td width = "150" align="center">이름</td>
			<td width = "400"><input type="text" name="name" size ="80"
				 placeholder="실명을 입력하세요" /></td>
		</tr>
		
		<tr height = "30">
			<td width = "150" align="center">연령대</td>
			<td width = "600">
				<input type="radio" name="age" value ="10"/>10대
				<input type="radio" name="age" value ="20"/>20대
				<input type="radio" name="age" value ="30"/>30대
				<input type="radio" name="age" value ="40"/>40대<br>
				<input type="radio" name="age" value ="50"/>50대
				<input type="radio" name="age" value ="60"/>60대
				<input type="radio" name="age" value ="70"/>70대
				<input type="radio" name="age" value ="80"/>80대 이상
			</td>
		</tr>
		
		<tr height = "30">
			<td width = "150" align="center">전자우편</td>
			<td width = "600"><input type="email" name="email" size ="80"
				 placeholder="id@domain.com" /></td>
		</tr>
			
		<tr height = "30">
			<td width = "150" align="center">전화번호</td>
			<td width = "600"><input type="text" name="tel" size ="80"
				 placeholder="000-0000-0000" /></td>
		</tr>
		
		<tr height = "30">
			<td width = "150" align="center">닉네임</td>
			<td width = "400"><input type="text" name="nick" size ="80"
				 placeholder="사이트에서 쓸 닉네임을 입력하세요" /></td>
		</tr>
		
		<tr height = "30">
			<td width = "150" align="center">관심분야</td>
			<td width = "600">
				<input type="checkbox" name="hobby" value ="공부"/>공부
				<input type="checkbox" name="hobby" value ="게임"/>게임
				<input type="checkbox" name="hobby" value ="독서"/>독서
				<input type="checkbox" name="hobby" value ="미술"/>미술
				<input type="checkbox" name="hobby" value ="사진"/>사진
				<input type="checkbox" name="hobby" value ="운동"/>운동
				<input type="checkbox" name="hobby" value ="영화"/>영화
				<input type="checkbox" name="hobby" value ="음악"/>음악
				<input type="checkbox" name="hobby" value ="캠핑"/>캠핑
			</td>
		</tr>
		
		<tr height = "30">
			<td width = "150" align="center">직업</td>
			<td width = "600">
				<select name = "job">
					<option value="직업선택">직업선택</option>
					<option value="공무원">공무원</option>
					<option value="교사">교사</option>
					<option value="군인">군인</option>
					<option value="학생">학생</option>
					<option value="대학생">대학생</option>
					<option value="사업">사업</option>
					<option value="서비스업">서비스업</option>
					<option value="자영업">자영업</option>
					<option value="프리랜서">프리랜서</option>
					<option value="회사원">회사원</option>
					<option value="주부">주부</option>
					<option value="백수">백수</option>
				</select>
			</td>
		</tr>
		
		<tr height = "120">
			<td width = "150" align="center">하고 싶은 말</td>
			<td width = "600">
				<textarea rows="5" cols="67" name="info"
				 placeholder="반갑습니다" /></textarea>
			</td>
		</tr>
		
		<tr height = "50">
			<td colspan="2">
				<input type = "submit" value = "회원가입"/>&nbsp;&nbsp;&nbsp;
				<input type = "reset" value = "초기화"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>