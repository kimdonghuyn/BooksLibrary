<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "DBconnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>

<link rel="stylesheet" href="library_index.css">
<body align = "center">
	<div class="container">
	<h4>도서 정보 페이지에 오신걸 환영합니다~^^*</h4>
	<form name="login" action = "books_loginPro.jsp" method = "post" w>
		<table align = "center" border = "1">
			<tr>
			<td colspan="2" align=center>
			<b><font size=5>로그인</font></b>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name ="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
				
			</tr>
			<tr>
			<td colspan="2" align=center>
			<input type="button" value="로그인" onclick="location.href='javascript:login.submit()'" class="btn">
			<input type="button" value="회원가입" onclick="location.href='books_joinForm.jsp'" class="btn">
			</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>