<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<link rel="stylesheet" href="library_index.css">
<body align = "center">
	<div class = "container">
	<form name="join" action="books_joinPro.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td colspan="2" align=center><b>
				<font size=5>회원가입 페이지</font></b>
				</td>
			</tr>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="id" size=30/></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="passwd" size=30/></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><input type="text" name="name" size=30/></td>
			</tr>
			<tr>
				<td>나이 :</td>
				<td><input type="text" name="age" maxlength=2 size=30 /></td>
			<tr>
				<td>성별 :</td>
				<td>
					<input type="radio" name="gender" value="남" checked />남성 
					<input type="radio" name="gender" value="여" />여성
				</td>
			</tr>
			<tr>
				<td>이메일 주소 :</td>
				<td><input type="text" name="email" size=30 /></td>
			</tr>
			<tr>
				<td colspan="2" align=center>
				<input type="submit" value="회원가입" class="btn">&nbsp;&nbsp; 
                <input type="reset" value="다시작성" class="btn">
			</tr>
		</table>
	<br>
	<input type="button" value="로그인 화면으로 돌아가기" onclick="location.href='index.jsp'" class="btn">
	</form>
	</div>
</body>
</html>