<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file = "DBconnection.jsp" %>
<%@ include file = "id_check.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 페이지</title>
</head>
<link rel="stylesheet" href="library_index.css">
<body align="center">
	<div>
		<h4>[ <%=id %> ]님으로 로그인 중 입니다.</h4>
		<h4>도서 커뮤니티 - 글쓰기</h4>
		<br>
		<form action="notice_insert.jsp" method="post">
			<table border=1 align="center">
				<tr align=center>
					<td>작성자</td>
					<td><input type="hidden" name ="writer" value="<%=id %>"><%=id %></td>
				</tr>
				<tr align=center>
					<td>제목</td>
					<td><input type="text" name ="title"></td>
				</tr>
				<tr align=center style ="height: 300px">
					<td>내용</td>
					<td><input type="text" name ="content"></td>
				</tr>
				<tr align=center>
					<td>비밀번호</td>
					<td><input type="password" name ="passwd"></td>
				</tr>
			</table>
			<br><br>
			<input type="submit" value="저장하기" class="btn">&nbsp;&nbsp;
			<input type="button" value="뒤로가기" onclick="location.href='books_notice.jsp'" class="btn">
		</form>
	
	</div>
	
</body>
</html>