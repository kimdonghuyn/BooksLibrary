<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null; //아이디 널값인지 물어보는거
	
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}else{
		out.println("<script>");
		out.println("location.href='index.jsp");
		out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후 메인 페이지</title>
</head>
<link rel="stylesheet" href="library_index.css">
<body align="center">
	<div class = "container">
		<h4>[ <%=id %> ]님 반갑습니다^^</h4>
		
		<% // 관리자 로그인 부분
		if(id.equals("master")){
		%>
		<input type="button" value="관리자모드 접속 (회원 목록 보기)" onclick="location.href='books_member_list.jsp'" class="btn">
		<% } %>
		<br>
		<h4>▼ 바로가기 목록</h4>
	    <input type="button" value="도서 LIST" onclick="location.href='info_list.jsp'" class="btn"><br><br>
	    <input type="button" value="도서 커뮤니티" onclick="location.href='books_notice.jsp'" class="btn"><br><br>
	    <input type="button" value="도서 정보 추가" onclick="location.href='information.jsp'" class="btn"><br>
		<br>
		<a href = "books_logout.jsp">로그아웃</a>
	</div>
</body>
</html>                     